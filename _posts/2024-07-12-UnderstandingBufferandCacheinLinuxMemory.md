---
title: "리눅스 메모리의 버퍼와 캐시 이해하기 차이점과 활용 방법"
description: ""
coverImage: "/assets/img/2024-07-12-UnderstandingBufferandCacheinLinuxMemory_0.png"
date: 2024-07-12 22:52
ogImage:
  url: /assets/img/2024-07-12-UnderstandingBufferandCacheinLinuxMemory_0.png
tag: Tech
originalTitle: "Understanding Buffer and Cache in Linux Memory"
link: "https://medium.com/codex/understanding-buffer-and-cache-in-linux-memory-6da3a1460e1b"
isUpdated: true
---

<img src="/assets/img/2024-07-12-UnderstandingBufferandCacheinLinuxMemory_0.png"/>

오늘의 내용을 시작하기 전에 먼저 free 명령어 출력 예제로 시스템의 메모리 사용량을 검토해보겠습니다:

```js
$ free
              total        used        free      shared  buff/cache   available
Mem:        8169348      263524     6875352         668     1030472     7611064
Swap:             0           0           0
```

이 출력 결과에는 물리 메모리(Mem)와 스왑 공간(Swap)의 사용에 관한 상세한 정보가 포함되어 있습니다. 총 메모리, 사용 중인 메모리, 캐시, 사용 가능한 메모리 등이 있습니다. 특히 캐시 지표는 버퍼(Buffer)와 캐시의 합계입니다.

<div class="content-ad"></div>

대부분의 이 메트릭은 비교적 이해하기 쉽지만, 버퍼(Buffer)와 캐시(Cache)를 구별하는 것은 조금 어려울 수 있습니다. 말 그대로, 버퍼는 임시 저장 영역이며, 캐시 또한 메모리 내에서의 임시 저장 형태입니다. 그러나 이 두 유형의 "임시 저장" 간의 차이를 아시나요?

# 무료 데이터의 출처

man 명령어를 사용하여 free에 대한 설명서를 확인함으로써 해당 메트릭에 대한 자세한 설명을 찾을 수 있습니다. 예를 들어 man free를 실행하면 다음과 같은 인터페이스가 표시됩니다:

```js
   buffers
          커널 버퍼에 의해 사용된 메모리 (/proc/meminfo의 버퍼)

   cache  페이지 캐시 및 슬랩에 의해 사용된 메모리 (/proc/meminfo의 Cached 및 SReclaimable)

   buff/cache
          버퍼 및 캐시의 합계
```

<div class="content-ad"></div>

무료 매뉴얼에서 버퍼와 캐시에 대한 설명을 볼 수 있어요.

버퍼: 이는 커널 버퍼에서 사용하는 메모리를 나타내며, /proc/meminfo의 Buffers 값과 일치합니다.

캐시: 이는 커널 페이지 캐시와 슬랩에서 사용하는 메모리를 가리키며, /proc/meminfo의 Cached와 SReclaimable의 합과 일치합니다.

이 설명은 이러한 값들이 /proc/meminfo에서 파생되었음을 보여줍니다. 그러나 Buffers, Cached 및 SReclaimable의 더 구체적인 의미를 명확히 설명하지는 않습니다.

<div class="content-ad"></div>

# 프록 파일 시스템

/proc은 Linux 커널이 제공하는 특별한 파일 시스템으로, 사용자가 커널과 상호작용할 수 있는 인터페이스 역할을 합니다. 예를 들어, 사용자는 커널의 실행 상태와 구성 옵션을 조회하거나 프로세스의 실행 상태와 통계를 확인하며, 심지어 /proc을 통해 커널 구성을 수정할 수도 있습니다.

프록 파일 시스템은 많은 성능 도구의 궁극적인 데이터 원본이기도 합니다. 예를 들어, 앞서 보았듯이 free 명령어는 /proc/meminfo에서 정보를 읽어와 메모리 사용량 정보를 얻습니다.

/proc/meminfo를 계속해서 살펴보면, 버퍼, 캐시, 그리고 SReclaimable의 정의가 즉각적으로 명확하지 않기 때문에, 이를 자세히 이해하기 위해 프록 파일 시스템을 더 깊이 파헤쳐야 합니다.

<div class="content-ad"></div>

man proc를 실행하여 proc 파일 시스템의 자세한 문서를 확인할 수 있습니다.

이 문서는 상세하기 때문에, 내부에서 검색하는 것이 좋습니다 (예: meminfo를 검색하여 메모리에 관한 관련 섹션을 빠르게 찾을 수 있습니다).

```js
Buffers %lu
    매우 크지 않아야 하는 원시 디스크 블록의 상대적으로 임시 저장 공간 (약 20MB).

Cached %lu
    디스크에서 읽은 파일들을 위한 메모리 캐시 (페이지 캐시). SwapCached를 포함하지 않습니다.
...
SReclaimable %lu (Linux 2.6.19부터)
    캐시와 같이 회수될 수 있는 Slab의 일부입니다.

SUnreclaim %lu (Linux 2.6.19부터)
    메모리 압력으로 인해 회수되지 못할 Slab의 일부입니다.
```

이 문서를 통해 아래 내용을 볼 수 있습니다:

<div class="content-ad"></div>

버퍼는 원시 디스크 블록을 임시로 저장하는 공간입니다. 즉, 디스크에 쓰여질 데이터를 캐싱하는 데 사용됩니다. 일반적으로 크기는 크지 않습니다 (약 20MB). 이로써 커널은 디스크 쓰기를 최적화할 수 있습니다. 분산된 쓰기를 더 크고 효율적인 쓰기로 통합하는 방식으로 작업할 수 있습니다. 예를 들어, 여러 작은 쓰기를 하나의 큰 쓰기로 통합하는 것입니다.

캐시는 디스크로부터 읽힌 파일들을 위한 페이지 캐시입니다. 즉, 파일로부터 읽힌 데이터를 캐싱합니다. 이렇게 함으로써, 다음에 해당 파일들을 엑세스할 때는 느린 디스크를 다시 접근하는 대신 빠르게 메모리로부터 데이터를 검색할 수 있습니다.

SReclaimable은 Slab의 일부분입니다. Slab에는 두 부분이 있습니다: 회수 가능한 부분(SReclaimable로 기록됨)과 회수 불가능한 부분(SUnreclaim로 기록됨)으로 나뉩니다.

자, 이제 우리는 이 세 가지 메트릭에 대해 상세한 정의를 찾았습니다. 이 시점에서, 당신은 아마 "버퍼와 캐시를 드디어 이해했다!" 하며 안도의 한숨을 쉬고 있을 것입니다. 하지만 이러한 정의들을 알게 된다고 해서 진정으로 이해했다고 할 수 있을까요? 여기 고려해볼 두 가지 질문이 있습니다:

<div class="content-ad"></div>

첫 번째 질문: 문서에는 Buffer가 디스크에서 읽히는 데이터를 캐싱하는지 아니면 디스크로 기록되는 데이터를 캐싱하는지 명시되어 있지 않습니다. 많은 온라인 소스들은 Buffer가 디스크로 쓰여질 데이터만을 캐싱한다고 주장합니다. 하지만 반대로, 디스크에서 읽히는 데이터도 캐싱하는지 여부도 알고 싶습니다.

두 번째 질문: 문서에는 Cache가 파일에서 읽히는 데이터를 캐싱하는 용도로 사용된다고 언급되어 있습니다. 하지만 파일에 기록되는 데이터를 캐싱하는 용도로도 사용되는지 궁금합니다.

이러한 질문에 대한 답변을 위해, 다양한 시나리오에서 어떻게 Buffer와 Cache가 사용되는지 보여주는 여러 사례 연구를 사용하겠습니다.

# 케이스 스터디

<div class="content-ad"></div>

오늘의 사례는 Ubuntu 18.04를 기반으로 하지만, 다른 리눅스 시스템에도 적용할 수 있습니다. 제가 사용하는 환경은 다음과 같습니다:

기기 구성: 2개의 CPU, 8GB의 메모리.
설치된 패키지: sysstat, apt install sysstat을 통해 설치할 수 있습니다.

sysstat을 설치한 이유는 Buffers와 Cache의 변화를 관찰하기 위해 vmstat을 사용할 것입니다. /proc/meminfo에서 유사한 결과를 얻을 수 있지만, vmstat은 결과를 더 직관적으로 보여줍니다.

또한, 이러한 사례에서는 디스크 및 파일 I/O를 시뮬레이션하기 위해 dd를 사용하므로 I/O 변화도 관찰해야 합니다.

<div class="content-ad"></div>

위에서 언급한 도구를 설치한 후에는 두 개의 터미널을 열고 Ubuntu 머신에 연결해야 합니다.

최종 준비 단계: 캐시의 영향을 줄이기 위해 첫 번째 터미널에서 다음 명령을 실행하여 시스템 캐시를 지우는 것을 기억해 주세요:

```js
# 파일 페이지, 디렉토리 항목, 아이노드 등과 같은 다양한 캐시를 지웁니다.
$ echo 3 > /proc/sys/vm/drop_caches
```

## 시나리오 1: 디스크 및 파일 쓰기 경우

<div class="content-ad"></div>

첫 번째 시나리오를 시뮬레이션해 보겠습니다. 먼저, 첫 번째 터미널에서 다음의 vmstat 명령어를 실행하세요:

```js
# 1초마다 한 번씩 데이터 셋 출력
$ vmstat 1
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
0  0      0 7743608   1112  92168    0    0     0     0   52  152  0  1 100  0  0
 0  0      0 7743608   1112  92168    0    0     0     0   36   92  0  0 100  0  0
```

vmstat 출력에서 메모리 섹션의 buff와 cache 그리고 IO 섹션의 bi와 bo가 주목해야 할 핵심 지표입니다.

- buff와 cache는 메모리 지표로, KB 단위로 표시됩니다.
- bi와 bo는 블록 장치의 읽기 및 쓰기 크기를 나타내며, 블록 당 초 단위로 표시됩니다. Linux에서 블록 크기는 1KB이므로 이 단위는 KB/s와 동일합니다.

<div class="content-ad"></div>

일반적으로 휴식 중인 시스템에서는 이러한 값들이 여러 결과에서 상대적으로 일정하게 유지됩니다.

다음으로 두 번째 터미널에서 dd 명령을 사용하여 무작위 장치에서 읽어와 500MB 파일을 생성해보세요:

```js
$ dd if=/dev/urandom of=/tmp/file bs=1M count=500
```

다음으로 첫 번째 터미널로 다시 전환하여 Buffer 및 Cache의 변화를 관찰해보세요:

<div class="content-ad"></div>

```js
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
0  0      0 7499460   1344 230484    0    0     0     0   29  145  0  0 100  0  0
1  0      0 7338088   1752 390512    0    0   488     0   39  558  0 47 53  0  0
1  0      0 7158872   1752 568800    0    0     0     4   30  376  1 50 49  0  0
1  0      0 6980308   1752 747860    0    0     0     0   24  360  0 50 50  0  0
0  0      0 6977448   1752 752072    0    0     0     0   29  138  0  0 100  0  0
0  0      0 6977440   1760 752080    0    0     0   152   42  212  0  1 99  1  0
...
0  1      0 6977216   1768 752104    0    0     4 122880   33  234  0  1 51 49  0
0  1      0 6977440   1768 752108    0    0     0 10240   38  196  0  0 50 50  0
```

vmstat의 출력을 관찰하면 dd 명령을 실행하는 동안 캐시가 계속 증가하면서 버퍼는 상대적으로 변경되지 않았음을 알 수 있습니다.

I/O 메트릭스를 더 자세히 살펴보면:

- 캐시가 처음으로 증가하기 시작할 때 블록 장치 I/O가 최소입니다. 예를 들어, bi에서 단일 인스턴스가 488 KB/s를 보여주고 bo는 단지 4 KB를 보여줍니다. 시간이 지남에 따라 bo가 122,880 KB로 상당히 증가하는 뚜렷한 블록 장치 쓰기가 관찰됩니다.
- dd 명령이 끝나면 캐시가 계속 성장을 멈추지만, 블록 장치 쓰기는 계속되며 쓴 총 I/O 양은 dd가 작성한 500 MB 데이터와 같습니다.

<div class="content-ad"></div>

위 결과를 방금 배운 캐시의 정의와 비교하면 약간 헷갈릴 수 있습니다. 왜 문서가 캐시를 파일 읽기 페이지 캐싱으로 설명하는데, 이제는 파일 쓰기에도 관여하는 것으로 보일까요?

우선 이 질문은 일단 접어두고 다른 디스크 쓰기 예제로 넘어가겠습니다. 두 가지 케이스를 모두 완료한 후에 함께 분석해보겠습니다.

다만, 다음 예제에 대해 다음 사항을 강조해야 합니다:

다음 케이스에서 사용되는 명령어는 매우 특정한 환경이 필요합니다. 시스템에는 여러 개의 디스크가 있어야 하며, 디스크 파티션 /dev/sdb1은 사용되지 않아야 합니다. 하나의 디스크만 있는 경우에는 이 명령어를 시도하지 마십시오. 그렇지 않으면 디스크 파티션을 손상시킬 수 있습니다.

<div class="content-ad"></div>

시스템이 요구 사항을 충족한다면, 디스크 캐시를 지운 후 /dev/sdb1 디스크 파티션에 2GB의 랜덤 데이터를 쓰기 위해 다음 명령어를 두 번째 터미널에서 실행해주세요:

```js
# 먼저, 캐시를 지웁니다
$ echo 3 > /proc/sys/vm/drop_caches
# 그런 다음 dd 명령을 사용하여 /dev/sdb1 디스크 파티션에 2GB의 데이터를 씁니다
$ dd if=/dev/urandom of=/dev/sdb1 bs=1M count=2048
```

그런 다음, 메모리 및 I/O 변화를 관찰하려면 다시 터미널 1로 돌아가주세요:

```js
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
1  0      0 7584780 153592  97436    0    0   684     0   31  423  1 48 50  2  0
 1  0      0 7418580 315384 101668    0    0     0     0   32  144  0 50 50  0  0
 1  0      0 7253664 475844 106208    0    0     0     0   20  137  0 50 50  0  0
 1  0      0 7093352 631800 110520    0    0     0     0   23  223  0 50 50  0  0
 1  1      0 6930056 790520 114980    0    0     0 12804   23  168  0 50 42  9  0
 1  0      0 6757204 949240 119396    0    0     0 183804   24  191  0 53 26 21  0
 1  1      0 6591516 1107960 123840    0    0     0 77316   22  232  0 52 16 33  0
```

<div class="content-ad"></div>

위의 내용을 보면 데이터 쓰기는 일반적인 작업이지만, 디스크에 쓰거나 파일에 쓰는 것은 다른 동작을 보입니다. 디스크에 쓸 때(즉, bo가 0보다 클 때)는 버퍼와 캐시가 모두 증가하지만 분명히 버퍼가 훨씬 더 빠르게 증가함을 볼 수 있습니다.

이것은 디스크에 쓰기가 대량의 버퍼를 사용한다는 것을 나타내며, 이는 문서에서 찾은 정의와 일치합니다.

두 시나리오를 비교해보면 파일에 쓰기는 데이터를 저장하기 위해 캐시를 사용하는 반면, 디스크에 쓰기는 데이터를 캐시하기 위해 버퍼를 사용합니다. 따라서, 앞서 언급한 질문으로 돌아가서 문서에서는 캐시가 파일 데이터를 읽기 위한 것이라고만 언급하지만, 캐시는 파일 쓰기 중에도 데이터를 저장합니다.

## 시나리오 2: 디스크 및 파일 읽기 케이스

<div class="content-ad"></div>

디스크 및 파일 쓰기 상황을 이해했으니, 이제 디스크 및 파일 읽기 중에 무슨 일이 일어나는지 살펴봅시다.

터미널 2로 돌아가서 다음 명령어를 실행해보세요. 캐시를 지우고, /tmp/file 파일에서 데이터를 읽어서 null 장치에 쓰는 것입니다:

```js
# 먼저 캐시를 지웁니다
$ echo 3 > /proc/sys/vm/drop_caches
# dd 명령어를 사용하여 파일 데이터를 읽습니다
$ dd if=/tmp/file of=/dev/null
```

그런 다음, 메모리 및 I/O의 변경 사항을 관찰하기 위해 첫 번째 터미널로 돌아갑니다:

<div class="content-ad"></div>

procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
r b swpd free buff cache si so bi bo in cs us sy id wa st
0 1 0 7724164 2380 110844 0 0 16576 0 62 360 2 2 76 21 0
0 1 0 7691544 2380 143472 0 0 32640 0 46 439 1 3 50 46 0
0 1 0 7658736 2380 176204 0 0 32640 0 54 407 1 4 50 46 0
0 1 0 7626052 2380 208908 0 0 32640 40 44 422 2 2 50 46 0

vmstat 출력을 분석하면 파일을 읽을 때 (즉, bi가 0보다 큰 경우) Buffer가 변하지 않는 반면 Cache가 계속 증가하는 것을 볼 수 있습니다. 이 관찰 결과는 우리가 검색한 정의와 일치합니다: "Cache는 파일 읽기용 페이지 캐시입니다."

그렇다면 디스크 읽기는 어떨까요? 두 번째 시나리오를 실행하여 알아보겠습니다.

먼저 두 번째 터미널로 전환하여 다음 명령을 실행하십시오:

<div class="content-ad"></div>

```js
# 먼저 캐시를 지웁니다
$ echo 3 > /proc/sys/vm/drop_caches
# 파일 데이터를 읽기 위해 dd 명령을 실행합니다
$ dd if=/dev/sda1 of=/dev/null bs=1M count=1024
```

그런 다음, 메모리와 I/O의 변화를 관찰하기 위해 첫 번째 터미널로 돌아갑니다:

```js
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
0  0      0 7225880   2716 608184    0    0     0     0   48  159  0  0 100  0  0
 0  1      0 7199420  28644 608228    0    0 25928     0   60  252  0  1 65 35  0
 0  1      0 7167092  60900 608312    0    0 32256     0   54  269  0  1 50 49  0
 0  1      0 7134416  93572 608376    0    0 32672     0   53  253  0  0 51 49  0
 0  1      0 7101484 126320 608480    0    0 32748     0   80  414  0  1 50 49  0
```

vmstat 출력을 관찰하면 디스크 읽기 작업 중 (즉, bi가 0보다 큰 경우) Buffer와 Cache가 모두 증가하지만 Buffer가 더 빠르게 증가한다는 것을 알 수 있습니다. 이는 디스크 읽기 작업 중 데이터가 Buffer에 캐싱되고 있음을 나타냅니다.

<div class="content-ad"></div>

물론, 이전 시나리오에서 분석한 두 가지 경우와 같이 두 시나리오를 비교하여 이 결론을 도출할 수 있습니다: 데이터는 파일 읽기를 위해 Cache로 캐시되고, 데이터는 디스크 읽기를 위해 Buffer로 캐시됩니다.

여기서, Buffer와 Cache에 대한 설명은 문서에 모든 세부 정보를 다 다루지는 않음을 발견했을 것입니다. 예를 들어, 오늘 우리가 배운 두 가지 사실은 다음과 같습니다:

- Buffer는 "디스크에 쓰기 위해 캐시된 데이터" 및 "디스크로부터 읽힌 데이터를 캐시하는 데 사용될 수 있다."
- Cache는 "파일 읽기를 위한 페이지 캐시" 및 "파일 쓰기를 위한 페이지 캐시" 모두에 사용될 수 있다.

요약하자면, Buffer는 디스크 데이터를 캐싱하는 데 사용되고, Cache는 파일 데이터를 캐싱하는 데 사용됩니다. 둘 다 읽기 및 쓰기 요청에 사용됩니다.

<div class="content-ad"></div>

# 결론

오늘은 메모리 성능에서 버퍼(Buffer)와 캐시(Cache)의 상세한 의미를 살펴보았습니다. 버퍼와 캐시는 각각 디스크와 파일 시스템의 읽기 및 쓰기 데이터를 캐싱하는 데 사용됩니다.

쓰기 관점에서 보면, 이러한 기술들은 디스크 및 파일 쓰기를 최적화하는데 도움을 주는데 더불어 실제로 데이터가 디스크에 기록되기 전에 응용 프로그램이 다른 작업을 수행할 수 있도록 도와줍니다.

읽기 관점에서 보면, 자주 액세스되는 데이터의 검색 속도를 높이고 디스크에 대한 입출력(I/O) 부하를 줄이는 데 도움이 됩니다.

<div class="content-ad"></div>

이 탐구의 내용 외에도 과정 자체가 당신에게 영감을 주어야 합니다. 성능 문제 해결 시, 다양한 리소스에 대한 성능 지표가 많기 때문에 모든 지표의 상세한 의미를 기억하는 것은 불가능합니다. 그래서 정확하고 효율적인 방법인 문서 상담이 매우 중요해집니다.

성능 지표의 상세한 의미를 해석하는 습관을 기르고 문서를 참고하는 것이 좋습니다. 또한 proc 파일 시스템은 유용한 도구입니다. 시스템의 내부 상태를 제공하며 성능 도구의 데이터 원천이 되어 성능 문제 해결에 탁월한 방법입니다.

![이미지](/assets/img/2024-07-12-UnderstandingBufferandCacheinLinuxMemory_1.png)
