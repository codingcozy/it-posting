---
title: "세대를 거치며 발전한 애플 CPU 아키텍처의 역사"
description: ""
coverImage: "/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_0.png"
date: 2024-07-13 23:50
ogImage:
  url: /assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_0.png
tag: Tech
originalTitle: "Through the Ages: Apple CPU Architecture"
link: "https://medium.com/macoclock/through-the-ages-apple-cpu-architecture-92b33abedea7"
isUpdated: true
---

✨✨✨

Markdown으로 변경한요!

# Timeline & Key Concepts

애플 CPU 아키텍처의 4대 시대 이야기입니다. 하지만 각 장은 기본적인 CPU 개념의 구조화 장치로도 작용합니다.

만약 안드로이드가 더 맞으시다면, 오버클럭된 명령 포인터처럼 필요에 따라 섹션을 자유롭게 이동해도 괜찮아요.✨

<div class="content-ad"></div>

## 1984 - Motorola 68k

- CPU 및 레지스터
- 산술 논리 장치
- 8비트 대 16비트
- 엔디안

## 1994 - PowerPC

- CISC 대 RISC
- 파이프라이닝
- 어셈블리 언어
- 에뮬레이션

<div class="content-ad"></div>

## 2006 — Intel x86

- CPU Caches (L1, L2, L3)
- Branch Prediction
- Superscalar Architecture
- Hyper-threading

## 2020 — Apple Silicon

- Heterogeneous Computing
- Unified Memory Architecture
- Out-of-order Execution
- Physics: The Ultimate Constraint

<div class="content-ad"></div>

# CPU 아키텍처 이주의 왕

에반젤리스트는 아니지만, 팬보이가 아니어도 애플이 인상적인 회사임을 인정할 수 있다는 것을 알고 계시나요?

그들은 자본주의 역사상 가장 성공한 제품을 발명했으며, 결국 1조 달러 시가총액을 달성한 최초의 기업이 되었습니다. iPod와 같은 히트 제품, 비길 데 없는 브랜딩, 스티브 잡스의 현실 왜곡 영향력을 통해, 기술을 쿨하게 만들었습니다.

이 인상적인 실행 뒤에는 경계선을 넘나드는 하드웨어 최적화가 있습니다: 1984년에 Mac이 출시된 이후로 애플은 CPU 아키텍처를 세 번이나 이주했습니다.

<div class="content-ad"></div>

이건 쉬운 과제가 아닙니다.

컴퓨터 회사가 CPU 아키텍처 이전을 발표할 때마다, 전체 소프트웨어 생태계가 동시에 폐지될 수 있는지에 대한 광범위한 회의론이 제기됩니다.

소프트웨어가 아직 판지 상자 안에 들어있던 시절에는 이 회의론이 믿기 어려울 정도로 심호흡을 하게 만들었습니다. 유명한 기술 칼럼니스트인 존 더보락은 2005년 Intel x86으로의 이동이 애플을 윈도우로 가져올 선례라고 제안했습니다.

Apple은 단기적으로 고통을 참는 것을 허용해 프로세서 게임을 마스터할 수 있었습니다. 각 새로운 CPU 아키텍처는 애플이 종말적 위협에 맞서거나 경쟁사들을 앞설 수 있게 했습니다.

<div class="content-ad"></div>

오늘은 애플 CPU 아키텍처의 4대 시대를 오디세이를 타고 살펴볼 거에요. 각 이주가 왜 필요했는지 비즈니스 맥락을 살펴보고, 애플이 어떻게 각 전환을 이겨냈는지 알려드릴게요.

우리는 그 과정에서 CPU 개념도 배워볼 거에요. 시간이 흘러가면서 칩 기술이 더욱 발전하면서, 우리는 시대를 따라 펼쳐지는 편리한 학습 곡선을 경험하며 여행할 거에요.

# 1984 — Motorola 68k

![Through the Ages Apple CPU Architecture](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_1.png)

<div class="content-ad"></div>

1981.

Reagan. MTV. Indiana Jones.

Apple is stumbling.

Its early breakout success and cash cow, the Wozniak wizardry of the 1977 Apple II, was creaking under its age.

<div class="content-ad"></div>

IBM PC가 대량 시장에 출시되었고, PC에 대한 구매 주문이 전례 없이 증가했습니다. 24세의 천재인 빌 게이츠는 IBM의 운영 체제를 제공하도록 요청받았습니다.

애플의 LISA는 이들의 주력 제품이 되어가고 있습니다. 5년 동안 모두에게 큰 틀니였던 스티브 잡스는 이제 이사회에 의해 저가 Macintosh 프로젝트를 운영하도록 견제당하게 되었습니다.

## CPU 선택

처음에는 저렴한 대량 소비자용 제품이었던 매킨토시는, 잡스가 이끄는 데로 방향을 전환하여 LISA 팀을 압도하는 데 집중했습니다. 스티브는 매킨토시에 새롭고 도둑질한 것이 아닌 사용자 인터페이스를 도입하고, 그 당시 제일 진보된 하드웨어를 팀에 요구했습니다.

<div class="content-ad"></div>

만약 개인용 컴퓨터 우주에서 주목받고 싶다면 CPU 선택은 중요합니다. OS가 운영되는 하드웨어이자 소프트웨어를 발전시키는 플랫폼입니다.

매우 초기의 PC는 (Wozniak과 같은 열성가들이 차고에서 조립한) 8비트 CPU를 사용했습니다. 그러나 1980년대 초기에 강력한 대중용 컴퓨터를 설계한다면, 현대적인 16비트 프로세서 아키텍처를 사용해야 합니다. 실제로 세 가지 주요 선택지가 있습니다: 인텔 8088, 지로그 Z8000, 혹은 모토로라 68k.

여기서 8비트와 16비트는 CPU가 작업하는 레지스터와 데이터 버스의 크기 또는 "폭"을 나타냅니다.

## CPU와 레지스터

<div class="content-ad"></div>

똑같은 페이지로 가봅시다: CPU란 컴퓨터 메모리(RAM)에서 데이터를 빠른 임시 메모리(레지스터)로 옮겨 작업을 수행한 후, 결과를 다시 메모리로 이동시키는 장치입니다.

![image](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_2.png)

레지스터는 전자 메모리의 가장 작은 단위입니다. CPU의 핵심 부분에는 몇 개의 비트만을 저장할 수 있습니다. CPU는 명령(컴퓨터 프로그램)을 따라 데이터에 대한 작업을 수행하며, 비트(1과 0)를 조작합니다.

## ALU

<div class="content-ad"></div>

이러한 작업들은 산술 논리 장치(ALU)에 의해 수행됩니다. 이것은 기본적으로 간단하고 전문화된 작업을 수행하는 회로들의 집합입니다. 예를 들어:

- 이진 숫자를 더하기, 예를 들어 0010 + 0101 = 0111
- 논리 연산 수행, 예를 들어 NOT 0000 = 1111
- 비트 이동, 예를 들어 1 자리 왼쪽 이동 0011은 0110이 됩니다.

CPU의 제어 장치는 한 번에 한 번 명령을 해독하여 어떤 데이터가 어느 레지스터로 이동해야 하는지, 그리고 어떤 레지스터의 데이터가 어떤 ALU 회로를 통과해야하는지 결정합니다.

이러한 작업을 매우 빠르게 여러 번 수행하면 행렬 곱셈, 비디오 게임에서의 충돌 물리학, 화면 픽셀로 이미지 데이터를 레스터화하는 결과물과 같은 출력이 누적됩니다.

<div class="content-ad"></div>

## 8-bit와 16-bit

그래서 비트 폭은 왜 중요할까요?

8-bit CPU는 한 클록 주기 내에 0010110에 대한 NOT 연산을 실행하여 비트를 1101001로 뒤집을 수 있습니다. 16-bit CPU는 이 연산을 한 번에 실행하여 10100100010110을 01011001101001로 바꿀 수 있습니다.

게다가, 단일 8-bit 레지스터는 RAM에서 2⁸개의 서로 다른 바이트 '주소'를 가리킬 수 있습니다. 즉, 데이터를 찾을 수 있는 256개의 위치가 있습니다. 이 제한 때문에 대부분의 8-bit 컴퓨터는 메모리 주소를 저장하기 위해 두 레지스터가 필요했습니다. 16-bit 레지스터 또는 뒤에 쌓인 두 개의 8-bit 레지스터는 2¹⁶개의 메모리 주소를 가리킬 수 있으며, 즉 64kB의 메모리에 액세스할 수 있음을 의미합니다.

<div class="content-ad"></div>

Endian-ness가 더 중요해지는 건, 8비트(1바이트)에서 16비트 CPU(2바이트)로 업그레이드 할 때 호환성을 고려할 때입니다. 시스템은 빅엔디언 또는 리틀엔디언으로 분류되며, 이는 바이트를 어떤 순서로 저장하는지를 정의합니다. 예를 들어, 16진수로 표현된 숫자 41,394는 빅엔디언 시스템에서 레지스터에 A1 B2으로 저장되고, 리틀엔디언 시스템에서는 B2 A1로 저장됩니다.
마지막으로, "데이터 버스"는 CPU를 메인 메모리에 연결하는 회로를 가리킵니다; 따라서 16비트 버스는 8비트 버스에 비해 메모리로 데이터를 읽고 쓰는 속도가 두 배 빠릅니다.
모두 이해하셨나요? 이제 다시 애플로 돌아가볼까요?

## 인텔 대 지로그 대 모토롤라

<div class="content-ad"></div>

어떤 칩 구조를 선택하겠습니까?

**Intel 8088**

- 8/16비트 마이크로프로세서 - 8비트 레지스터와 16비트 데이터 버스.
- 20비트 메모리 주소 지정 범위 - 640kB의 RAM을 지원합니다.
- IBM PC가 이 칩 아키텍처를 사용하므로 강력한 소프트웨어 생태계가 존재합니다.
- Intel의 대규모 경제적 이점으로 약 35달러 (1983년 달러로)의 저가 제품.
- 리틀엔디안.

<div class="content-ad"></div>

## Zilog Z8000

- 순수한 16비트 마이크로프로세서 — 16비트 레지스터 및 16비트 데이터 버스.
- 23비트 메모리 주소 지정 범위 — 8MB의 RAM 지원.
- 이 구조를 사용하는 대규모 경쟁 업체가 거의 없으며 소프트웨어 생태계도 제한적.
- 1983년 대략 $55의 중저가로 시장 점유율 확대를 모색 중.
- (대부분이) 빅엔디언.

## Motorola 68k

- 16/32비트 마이크로프로세서 — 32비트 레지스터와 16비트 데이터 버스.
- 24비트 메모리 주소 지정 범위 — 16MB의 RAM 지원.
- Atari와 Commodore는 이 칩 설계를 사용하며 일부 기존 개발자 생태계가 존재.
- Apple I, Apple II 및 LISA를 통해 Motorola와의 이전 공급업체 관계.
- 1983년 대략 $70의 중고가에서 제품 판매.
- 빅엔디언.

<div class="content-ad"></div>

총적으로, Motorola 68k는 1984년이 1984년과 같지 않을 이유를 보여주기 위한 선도적인 선택으로 보입니다. 개발 생태계가 약한 점과 호환성이 부족한 점은 지배적인 IBM PC에 대한 브랜드 차별화를 제공하기 위한 필수적인 희생이었습니다.

더욱이 68k는 (대부분은) 직교적 명령어 세트를 갖고 있었습니다. 이는 (대부분은) 모든 CPU 연산이 (거의) 모든 레지스터에서 수행될 수 있다는 것을 의미했는데, 경쟁하는 많은 CPU들은 특정 레지스터로 제한된 명령어를 갖고 있었습니다. 직교성은 CPU를 프로그래밍하기 훨씬 쉽게 만들어 주며, 이는 미래의 소프트웨어 생태계를 육성할 때 이상적입니다.

16MB의 주소 지정 범위는 결국 중요한 역할을 하게 되었습니다: 맥킨토시는 상위 12MB의 RAM을 운영 체제를 위해 예약하여 소프트웨어 애플리케이션들이 공유하는 4MB의 컴퓨터 메모리만을 남겨두었습니다.

2012년에 16GB iPod Touch에 사용 가능한 저장 공간을 살펴본 적이 있다면, 아무것도 변하지 않는다는 것을 알 것입니다.

<div class="content-ad"></div>

![Through the Ages Apple CPU Architecture](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_3.png)

# 1994 — PowerPC

![Through the Ages Apple CPU Architecture](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_4.png)

The year is 1994.

<div class="content-ad"></div>

Steve Jobs가 Apple에서 8년 전에 내보내졌으며, 지금은 Pixar와 NeXT를 발명하느라 바쁩니다.

Apple은 중요성을 잃어가고 있습니다.

과거의 쓴 적이 있는 PC 경쟁사인 IBM은 Microsoft에 의해 점차 시장 점유율을 빼앗기는 고통스러운 과정을 겪고 있습니다.

![Image](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_5.png)

<div class="content-ad"></div>

1990년대에 악마로 불린 빌 게이츠와 인텔은 Wintel이라 불리는 부정한 결합으로 들어가, 두 기업 각각에게 거의 독점권을 확보하고 있었습니다.

인텔은 강력한 x86 칩 아키텍처를 지속적으로 개선해왔지만, 회로의 혁신은 파워 트랜지스터 이후 가장 대단한 것이었습니다: 칩에 멋진 이름을 붙이기 시작했습니다. 펜티엄 프로세서는 Microsoft 시장 점유율을 늘리는 기계의 원동력이 되었습니다.

x86 칩 아키텍처의 강력함을 얕볼 수는 없습니다. 인텔은 100MHz의 클럭 속도와 비할 데 없는 전력 효율성으로 자신의 지배력을 증명했습니다. 90년대에 매킨토시를 이끌었던 모터로라 68,000 칩 패밀리는 발걸음을 제대로 따라잡지 못했습니다.

모노폴리에 위협받는 컴퓨터 세계에서 애플은 예전 파트너인 모터로라와 의외의 동맹인 IBM과 함께 하기로 결정했습니다. 이 계획의 목적은 자본주의의 힘에 맞서기 위해 친구들의 힘을 이용하는 것이었습니다.

<div class="content-ad"></div>

A friendly nod to the birth of the AIM (Apple, IBM, Motorola) alliance, where they discovered a flaw in the x86 architecture – its reliance on CISC architecture. In an agile move, AIM introduced a RISCy strategy: PowerPC.

## CISC vs. RISC

In the realm of chip design, two philosophies stand in contrast to each other:

<div class="content-ad"></div>

-CISC (Complex Instruction Set Computer) - RISC (Reduced Instruction Set Computer)

이를 이해하기 위해서는 명령어 집합이 의미하는 것에 대해 파악해야 합니다. 이전 섹션에서, CPU가 모든 클록 주기에 작업을 실행한다고 언급했었습니다. 이러한 작업에는 레지스터 간 데이터 이동, 산술 및 논리 연산 등이 포함됩니다.

각 CPU는 실제 물리적 배치 제약으로 인해 제한된 수의 작업만을 수행할 수 있습니다. 이러한 개별 작업은 어셈블리어 또는 기계 코드로 표현됩니다. 이 코드는 이진 명령어의 연속으로 프로세서에 공급되어 순차적으로 수행됩니다.

![Image](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_6.png)

<div class="content-ad"></div>

칩 제작을 위한 두 가지 학팴에 대한 접근 방식이 다릅니다:

- CISC는 복잡한 명령어 세트를 수용하여 CPU의 기능을 계속 추가합니다. 결국, 당신은 POLY와 같은 복잡한 다단계 처리를 단일 명령문으로 수행할 수 있는 능력을 얻게 됩니다. 이것은 마치 마법처럼 느껴졌지만, 동시에 처리기가 많은 내부 상태를 유지해야 했기 때문에 무언가 잘못되면 치명적인 성능 저하가 발생할 수 있었습니다.
- RISC는 "단순하게 유지하세요!" 접근 방식을 취합니다. CISC의 주요 함정은 개발자에게 복잡성이었습니다. CISC 아키텍처를 위해 쓰인 컴파일러 엔지니어들은 필요한 명령어를 찾기 위해 500페이지 분량의 매뉴얼을 참조해야 했지만, RISC 엔지니어들은 레지스터에 저장된 60여 개의 명령어로 -- 죄송합니다 -- 뇌를 갖고 활약하고 있었습니다.

## 파이프라인

RISC에 의해 부여된 주요 성능 향상을 정말로 보려면, 피카부-해석-수행 주기를 살펴봄으로써 파이프라이닝을 이해해야 합니다. 한마디로, 단일 클럭 주기 동안 -- CPU에서 한 작업이 실행되는 시간 -- 세 가지 중 하나가 수행됩니다:

<div class="content-ad"></div>

- 가져오기: CPU는 메모리에서 다음 기계 코드 명령을 가져옵니다.
- 해독: CPU의 제어 장치가 명령을 해석하여 실제로 무엇을 하는지 파악합니다.
- 실행: CPU는 명령을 실행합니다. 레지스터와 메모리 사이의 데이터 이동이나 비트를 논리 장치를 통해 전달하는 작업 등이 이루어집니다.

CPU가 간단한 RISC 명령 세트를 사용하는 경우, 이러한 단계는 각각 하나의 사이클이 소요되며, 이러한 작업을 동시에 실행할 수 있습니다. 각 클록 사이클마다 3개의 명령을 병렬로 실행할 수 있습니다. 이로 인해 (평균적으로) 클록 사이클 당 한 기계 코드 작업이 실행됩니다.

![image](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_7.png)

CISC를 사용하는 경우, 각 단계가 일관된 1 사이클/단계가 아닐 수 있습니다. POLY 작업의 경우, x² 표현식에 대한 실행 단계만 10 사이클이 걸릴 수 있습니다. CISC에서는 작업을 잘 정렬하기가 어려워 복잡한 명령에 대한 성능을 얻기 어렵습니다.

<div class="content-ad"></div>

파이프라이닝은 간단히 말해 명령어를 동시에 교차로 배열하는 개념이에요.

## CPU 아키텍처 마이그레이션은 왜 어려울까요?

애플과 AIM 얼라이언스가 그들의 음모를 꾸몄어요.

파워PC는 현대적인 RISC(축소 명령 집합 컴퓨터) 마이크로프로세서 아키텍처로, 주도적이었던 인텔 x86 아키텍처와 직접 경쟁하기 위해 만들어졌어요.

<div class="content-ad"></div>

PowerPC은 더 효율적인 성능을 약속했습니다 - 즉, 와트 당 더 많은 CPU 작업을 수행할 수 있습니다. 또한, Apple은 소프트웨어와 하드웨어를 모두 제어하기 때문에 Mac OS를 이 프로세서 아키텍처에 최적화할 수 있었습니다.

이제 그들은 생태계를 이주시켜야 했습니다.

## 어셈블리 언어

한 프로세서를 위해 작성된 소프트웨어는 반드시 다른 프로세서에서 실행되지는 않습니다. 프로세서 패밀리는 각 CPU 작업을 정의하는 어셈블리 명령의 목록인 명령 세트를 포함하고 있기 때문입니다.

<div class="content-ad"></div>

여기는 모터로라 68k 어셈블리 코드의 한 부분이에요:

MOVE.L $1000, D0 ; 데이터 레지스터 D0에 주소 $1000의 longword를 로드해요
MOVE.L $1004, D1 ; 데이터 레지스터 D1에 주소 $1004의 longword를 로드해요
ADD.L D1, D0 ; D0와 D1 값을 더해서 결과를 D0에 저장해요
MOVE.L $1000, D0 ; 주소 $1000의 longword를 데이터 레지스터 D1에 로드해요
NOT.L D1 ; D1의 모든 비트를 반전시켜요

그리고 이게 파워PC 어셈블리 코드의 모습이에요:

lwz r3, 0x1000 ; 주소 0x1000으로부터 워드를 레지스터 r3에 로드해요
lwz r4, 0x1004 ; 주소 0x1004으로부터 워드를 레지스터 r4에 로드해요
add r5, r3, r4 ; r3와 r4의 값을 더해서 결과를 r5에 저장해요
lwz r3, 0x1000 ; 주소 0x1000으로부터 워드를 레지스터 r3에 로드해요
not r4, r3 ; r3의 모든 비트를 반전시키고 결과를 r4에 저장해요

<div class="content-ad"></div>

이미지 파일을 다운로드하면 엔디안에 관한 가정을 하는 코드와 같은 경우, 애플 에코시스템의 모든 기존 소프트웨어를 다시 컴파일해야하며 경우에 따라 다시 작성해야합니다.

애플이 조치할 필요가 있었어요.

## PowerPC 전환

이전에 PowerPC 기계에서 작동하기 위해서는 애플은 이 전환이라는 두 가지 전략을 개발했습니다.

<div class="content-ad"></div>

이 에뮬레이터는 PowerPC가 Motorola CPU를 에뮬레이트할 수 있는 환경을 개발했습니다. 이는 한 명령 집합 아키텍처에서 다른 명령 집합 아키텍처로 실시간으로 명령을 변환하는 것을 의미합니다.

이런 방식은 당연히 성능 손실이 매우 크다는 것을 의미합니다. 다행히도, PowerPC CPU가 매우 강력했기 때문에 하드웨어를 업그레이드하는 소비자에게는 일반적으로 에뮬레이션은 큰 문제가 되지 않았습니다.

애플이 사용한 다른 전략 중 하나는 전환 기간 동안 소프트웨어에 대해 "fat binaries"를 사용한 것입니다. 이를 통해 소프트웨어가 68k와 PowerPC 아키텍처용으로 컴파일된 코드를 모두 포함할 수 있었습니다. 따라서 엔지니어들은 두 개 별도의 이진 파일을 포함하여 두 Mac CPU 플랫폼에서 모두 작동하는 단일 앱을 제공할 수 있었습니다.

80MB의 하드 드라이브가 적당한 시대에, 이것은 상당히 귀찮은 일이었기 때문에 사용자들이 기기에서 작동하는 하나만 저장하면 되는 바이너리 축소 도구의 시장이 생겼습니다.

<div class="content-ad"></div>

애플의 이주는 전체적으로 성공적이었습니다. 68k에서 PowerPC로의 이동으로 엄청난 성능 향상을 가져왔습니다. 에뮬레이션과 팻 바이너리는 소프트웨어 생태계가 주요 문제 없이 전환할 수 있도록 했습니다.

하지만 윈텔 연합은 거의 영향을 받지 않았습니다. 펜티엄과 윈도우 95의 출시로 그들의 시장 지배력이 전례 없는 수준으로 증가했습니다. 윈도우는 기본 컴퓨팅 플랫폼으로 성장하면서 전 세계 학교 정보통신기술 교육 과정을 "마이크로소프트 오피스 사용 방법"으로 변모시키는 비극을 야기했습니다.

애플이 견고한 하드웨어 플랫폼을 손에 넣었지만, 고대된 시스템 7 맥 OS는 주요 난제가 되었습니다. 윈도우에 대항할 현대적인 경쟁자를 만들기 위한 내부 프로젝트들은 실패했고, 이는 얼룩지는 추락에서 벗어나기 위한 유일한 방법으로 새 OS를 구매하는 것이 남았다는 것을 의미했습니다.

이러한 상황이 애플의 넥스트 인수와 스티브 잡스의 복귀를 뒷받침했습니다.

<div class="content-ad"></div>

# 2006 — Intel x86

![](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_8.png)

이른 시기 2000년대, 애플은 다시 무슨 일을 하고 있나요?

잡스가 CEO이고 맥 OS X로의 시대를 정의하는 소프트웨어 이동이 성공적으로 이루어졌습니다. 아이팟이 한 자릿수 시장 점유율을 가진 버전 구 다운 컴퓨터 회사를 소비자 전자기기 강자로 만들었습니다.

<div class="content-ad"></div>

The dominance of desktop computers lasted throughout the 80s, 90s, and into the 2000s. However, with the continuous advancement of Moore's Law, technology started to shrink, and laptops began to gain popularity.

When your device is not plugged in, the battery life becomes a crucial factor. In the early 2000s, it became evident that PowerPC architecture was struggling to keep up with the Intel x86 processors in terms of energy efficiency.

Intel outperformed its competitors through superior execution, manufacturing, and research and development. Their wide range of Windows-compatible devices created a strong ecosystem, allowing them to invest substantially in advancing their processor technology.

At that time, PowerPC CPUs consumed too much power and produced excessive heat, making it challenging to realize Jobs' vision of the slim MacBook Air. As more than half of Apple's revenue came from laptop sales, it was a strategic decision to transition to Intel processors in order to stay competitive.

<div class="content-ad"></div>

## WWDC 2005

![Through the Ages Apple CPU Architecture](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_9.png)

Jobs explained it best at Apple’s 2005 Worldwide Developer Conference:

But my favourite part of the video?

<div class="content-ad"></div>

2010년대 개발자로서 회의에서 Xcode 최신 업데이트용 CD를 집어들다니, 정말로 재미있다는 생각이 듭니다. 2005 베타 버전이 오늘날 익숙한 것처럼 버그가 많았을까요?

하지만, 제게 정말로 흥미로운 것은 이것입니다:

## 왜 인텔 x86 CPU가 더 나은 것인가요?

인텔 x86 프로세서는 1978년 인텔 8086로 개척된 명령 집합 구조의 가족에서 기원합니다. 1982년의 인텔 80186이나 2000년대의 펜티엄 4와 같은 이후 프로세서들은 이 초기 명령 집합과의 하위 호환성을 유지했습니다. 네가 맞게 읽고 있어요: 70년대에 8086에서 컴파일된 프로그램은 아무 수정 없이 2000년대에도 잘 실행됩니다.

<div class="content-ad"></div>

하지만 소프트웨어 생태계는 이야기의 일부일 뿐입니다.

2006년까지 고성능 Intel x86 프로세서는 PowerPC와 비교해 거의 5배의 성능을 왓트 당 생산할 것으로 예측되었으며, 거의 1.5배의 클럭 속도를 보여주었습니다.

Intel은 CPU의 모든 측면에서 혁신하고 있었습니다:

- CPU 캐시 (L1, L2 및 L3)
- Branch Prediction
- 슈퍼스칼라 아키텍처

<div class="content-ad"></div>

이러한 내용을 자세히 살펴보겠습니다. 현대 CPU 성능에서 매우 중요한 개념들이기 때문이죠. Intel의 x86을 우승자로 만든 것은 단일 부분이 아닙니다. CPU의 상호 연결된 성질 덕분에, 이러한 구성요소 전반에 걸쳐 최적화가 이루어지고 x86은 경쟁 상대 앞서갔습니다.

## CPU 캐시

이전에 설명한대로, CPU는 RAM(메모리)에서 데이터를 가져와 프로세서 칩 내의 초고속 레지스터에 배치하고 해당 데이터에서 작업을 수행합니다. 그러나 기가헤르츠 클럭 속도(초당 1,000,000,000회 연산)에서는 RAM에서 명령어 및 데이터를 가져오는 것이 너무 느립니다.

그래서 CPU는 온칩 캐시를 발전시켜 중간양의 데이터를 저장합니다. 이 캐시는 물리적으로 칩 자체에 더 가깝게 저장되는 중간 양의 RAM 블록 역할을 하며 필요한 데이터에 빠르게 액세스할 수 있게 합니다.

<div class="content-ad"></div>

이러한 캐시들은 각각 계층화되어 있습니다:

- L1 캐시는 가장 작고 가장 빠른 계층입니다. CPU 코어와 직접 통합되어 작은 양의 데이터(몇 kB)를 빠르게 검색하기 위해 사용됩니다. CPU 코어와 매우 가깝게 통합되어 있기 때문에 각 CPU 코어마다 L1 캐시가 있습니다.
- L2 캐시는 중간 계층으로 속도와 용량을 균형있게 조절하며, 일반적으로 CPU 칩 자체의 어딘가에 통합되어 있습니다. 이 캐시는 각 CPU 코어에 대해 파티션을 나눠 사용할 수도 있고, 모든 코어가 공유할 수도 있습니다.
- L3 캐시는 CPU가 RAM에서 데이터를 검색해야 할 때까지 최후의 버퍼 역할을 합니다. CPU 코어들 간에 많은 메가바이트의 공유 메모리 풀로 저장하는 저장소 계층입니다.

하버드 대학의 CS 과정에서 가져온 이 다이어그램이 더 잘 설명해줍니다:
![다이어그램](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_10.png)

<div class="content-ad"></div>

CPU가 가장 가까운 캐시에 저장되어 있지 않은 명령 또는 데이터를 가져와야 할 때, 이를 캐시 미스라고 합니다. 그러면 다음 단계의 캐시, 또는 그 다음 단게, 또는 RAM, 또는 디스크에서 가져와야 합니다! 이는 속도와 효율성에 심각한 영향을 미칠 수 있습니다.

매크로 규모의 비유로 설명하자면, 프로그램이 로컬 저장소가 아니라 네트워크에서 데이터를 찾아야 할 때, 어플리케이션이 로드되는 속도가 얼마나 느려지는지 생각해보세요. CPU의 나노 스케일에서의 왕복은 빠르게 누적될 수 있습니다.

2000년대 중반까지, Intel의 x86 CPU 캐시는 PowerPC보다 훨씬 크기 때문에 더 낮은 대기시간과 더 나은 성능을 제공했습니다. 또한 향상된 프리페치 및 예측 알고리즘과 함께 사용되면, 비싼 캐시 미스가 x86에서 덜 문제가 되었습니다.

즉 이들은 에너지 효율성을 향상시켰으며, 데이터가 프로세서 옆에 있을 때, 메모리 바이트를 이동시키기 위해 CPU 회로를 통해 덜 전기가 소모됩니다.

<div class="content-ad"></div>

## 분기 예측

처음에 '분기 예측'을 들었을 때, 마치 신비한 영적인 매력을 품고 있는 것처럼 들릴 수 있어요.

분기 명령은 조건문인 if/else의 어셈블리 코드 버전이에요. 이는 프로세서에서 점프, 호출 및 반환으로 나타나지요. 똑똑한 CPU는 통계를 사용해 코드의 실행 경로를 추측하고 명령 파이프라인을 최대한 활용하기 위해 노력해요.

이러한 메커니즘은 CPU의 회로에 직접 내장된 하드웨어 알고리즘을 포함하고 있어요. 최근에 발생한 분기 결과를 캐싱하는 '분기 히스토리 테이블'이라는 버퍼가 있어요. 이를 분석해서 예측을 내립니다.

<div class="content-ad"></div>

**고급 분기 예측기들은 궁극의 YOLO 방법을 적용합니다: 공세 실행, 예측된 분기 상에서의 명령어가 결과가 확정되기 전에 실행됩니다.**

**인텔의 실리콘 크리스탈 볼들은 사이킷 CPU들보다 훨씬 빠르게 x86 프로세서를 진화시켰습니다.**

## 슈퍼스칼라 아키텍처

**슈퍼스칼라 아키텍처는 다중 작업의 궁극적인 형태입니다. 슈퍼스칼라 CPU들은 단일 클럭 주기 동안 복수의 명령어를 동시에 실행할 수 있습니다:**

<div class="content-ad"></div>

- 페치 단계에서 CPU는 작동 파이프라인으로부터 여러 명령을 수집합니다.
- 디코드 단계는 각 명령을 평가하기 위해 여러 디코더 유닛을 활용합니다.
- 이러한 명령은 CPU의 서로 다른 실행 유닛으로 전송될 수 있습니다.

이 구조는 산술, 레지스터 간 메모리 이동 및 부동 소수점 연산과 같은 작업이 ALU의 다른 회로 부품을 필요로하기 때문에 작동합니다. 따라서, 똑똑하게 여러 명령을 병렬로 수행할 수 있습니다.

이 작업은 올바르게 수행하기 어려운 과정입니다. 병목 현상이 발생할 수 있습니다. 특히 동시에 여러 작업이 같은 레지스터나 같은 ALU 더하기 회로와 같은 자원을 사용해야 할 때입니다. 의존성 문제 또한 발생할 수 있으며, 특히 어떤 명령이 다른 더 오래 실행되는 작업의 결과를 기다리고 있을 때입니다.

Intel은 슈퍼스칼라 아키텍처가 CPU 코어에서 효과적으로 작동하도록 하는 데 필요한 의지와, 더 중요한 것은 연구 및 개발 자금을 가지고 있었습니다.

<div class="content-ad"></div>

## [Further Intel Innovations](https://yourwebsite.com/further-intel-innovations)

안녕하세요! 인텔의 x86 칩셋은 캐시, 분기 예측 및 슈퍼스칼라 아키텍처 외에도 많은 기능을 최적화했습니다:

- 여러 ALU 실행 유닛을 추가하여 수퍼스칼라 아키텍처의 작업을 더 쉽게 병렬화할 수 있도록 함.
- Hyper-threading을 통해 단일 CPU 코어가 운영체제에 2개의 논리 코어로 표시되어 한 코어가 동시에 2개의 스레드를 실행할 수 있도록 함.

인텔은 패치, 디코드, 실행 주기를 21단계로 분할하는 고급 파이프라이닝을 도입하여 주어진 클록 속도에서 더 많은 명령어를 실행할 수 있도록 했습니다. 이렇게 하면 초당 더 많은 명령어를 실행할 수 있게 되죠! **YourWebsite**에서 자세한 내용을 확인해보세요!

<div class="content-ad"></div>

오늘 우리는 Apple이 부드러운 CPU 아키텍처 이전을 위해 오랜 시간 검증된 전환 기술을 다시 사용했다는 소식을 전해드립니다.

Apple은 두 가지 CPU 아키텍처용으로 구축된 유니버설 바이너리를 소개했는데, 간단한 Xcode 빌드 구성으로 설정할 수 있었습니다.

![이미지](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_11.png)

또한 Apple은 "당신이 결코 볼 수 없을 가장 놀라운 소프트웨어"로 소개한 동적 이진 번역기 Rosetta를 소개했습니다. 이는 x86 Mac에 처음으로 출시된 Mac OS X Tiger에 포함되어 있었으며, PowerPC 앱이 x86에서 자동으로 실행되도록 했습니다.

<div class="content-ad"></div>

Apple은 Rosetta가 에뮬레이터가 아니라고 자세히 설명하기 위해 많은 노력을 기울입니다. Rosetta는 프로그램이 실행됨에 따라 코드를 ‘실시간’으로 동적으로 번역합니다. 실제로 이는 애플리케이션 이진 파일로부터 PowerPC CPU 명령 및 OS 시스템 호출을 해당하는 x86 어셈블리와 시스템 호출로 번역한다는 것을 의미합니다.

애플은 수년에 걸친 전이 일정을 언더프로미스 했고, 스케줄보다 훨씬 빠르게 과거에 제시한 것 이상으로 결과를 이루었습니다. 이는 조브스가 꿈꾸던 소형 폼 팩터와 애플을 현대 시대로 이끈 것이었습니다.

# 2020—애플 실리콘

![image](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_12.png)

<div class="content-ad"></div>

스티브 잡스에 관한 월터 아이작슨의 책을 읽은 사람은 애플의 신념과 그들의 궁극적인 경쟁 우위를 알 것입니다: 하드웨어와 소프트웨어의 밀접한 통합으로 놀랍게 훌륭한 제품을 만든다는 것을.

Intel에 x86 CPU에 의존하면 때로는 Intel의 공급 제약과 출시 지연으로 인해 가끔 애플의 로드맵에 영향을 줄 수 있습니다.

수십 년 동안 CPU는 계속 빠져나가는 정체였습니다. Apple I의 오프더셸프 MOS 6502 마이크로프로세서부터 2019 맥 프로의 고급 Intel 제온 CPU까지, 애플은 이 가치 사슬의 이 부분을 정말로 소유하지 못했습니다.

하지만 이제 그들은 소유할 수 있습니다.

<div class="content-ad"></div>

오리지널 2세대 아이폰은 2007년에 출시되었는데 삼성이 공급한 ARM CPU를 사용했습니다. 그러나 2010년대 초반, 아이폰 4부터 애플은 A4로 시작하는 자체 칩을 설계하기 시작했습니다.

애플은 발전했습니다. 그리고 계속 발전해왔습니다.

2020년.

아이폰은 모든 현금 소스의 신이 되었습니다. ✨

<div class="content-ad"></div>

Apple, 현재 행성상 가장 가치 있는 상장 회사로 등극한 친구, 어디다 그거 먼지 뭐상 $20,000,000,000 현금흐름으로 R&D에 몰아쳐.

## 무려 원고, 그 이야기

한 잠만 — 오늘날로 가기 전에, 역사 속으로 작은 여행을 떠나 봐야 해. 조금 험한 길이 될지도 몰라.

2008년, Apple이 $278m에 P.A. Semiconductor을 인수했어, 고급 저전력 프로세서로 유명한 CPU 디자인 회사야. P.A.의 CPU는 원래 IBM의 Power 아키텍처에 기반을 둔 거였어 — 바로 PowerPC Macs에서 AIM 연합이 사용했던 명령어 집합과 같은 거.

<div class="content-ad"></div>

그 때 안드로이드 운영체제가 스마트폰 시장에 진입했습니다. 자체 칩 디자인을 보유하게 되면 iPhone은 신규로 혼잡해진 시장에서 경쟁사와 더욱 차별화될 수 있습니다. 이 인수로 애플은 참모유지로 유명한 기업으로서 최고의 독점 칩 디자인을 내부에서 비밀리에 보호할 수 있었습니다.

이 인수는 2018년, 10년 뒤에 유럽 칩 디자이너인 Dialog의 부분인수와 함께 3억 달러에 이루어졌습니다.

좋아요, 이제 M1에 대해 이야기 할 수 있을까요?

아니요. 먼저 더 예전으로 돌아가 봐야 합니다.

<div class="content-ad"></div>

ARM의 RISC 명령어 집합과 칩 디자인은 오늘날 주류를 이루고 있습니다. 실제로 ARM은 1990년에 Apple과 Acorn Computers 사이의 합작으로 설립되었습니다. 전설에는 - 그리고 전설이라 하면 Quora에서 나온 소스가 없는 주장을 말합니다 - 스티브 잡스가 Acorn을 설득하여 하드웨어 제품을 포기하고 저전력 프로세서 디자인에 집중하도록 한다고 합니다.

저는 그게 사실이라고 믿고 싶어요. 왜냐하면 그것이 오늘날의 애플을 만든 장기적 사고의 대표적인 사례이기 때문이거든.

요컨대, 알아듣고 계신가요? 그럼 좋아요. 다시 2020년으로 돌아가볼게요.

## 애플 실리콘의 태양이 뜬다

<div class="content-ad"></div>

Apple 엔지니어들은 여러 해 동안 iPhone 및 iPad의 ARM 칩을 설계하고 개선했습니다.

모바일 형태로 인해 주머니에 냉각 팬을 넣기 어렵기 때문에 전력 소비 및 열 효율성이 큰 고민거리입니다. RISC 아키텍처가 이에 대한 명확한 해결책으로, 이것이 모바일 사용 사례에서 x86 거대를 대체했습니다.

그리고 2020년까지 이러한 ARM CPU들은 빠르게 발전해 왔습니다.

Intel의 x86 칩보다 훨씬 빠른 속도로요.

<div class="content-ad"></div>

![Through the Ages Apple CPU Architecture](/assets/img/2024-07-13-ThroughtheAgesAppleCPUArchitecture_13.png)

애플의 맞춤 ARM CPU는 발전하여, 이제 더 이상 의문의 여지가 없었다. 그것들은 애플 노트북에서 사용하기에 충분히 강력했다.

2020년, 애플은 M1으로 세 번째로 위대한 맥 CPU 아키텍처 전환을 발표했고, 애플 실리콘 시대가 시작되었다.

## 정확히 M1은 무엇인가요?

<div class="content-ad"></div>

The M1은 Mac 노트북 및 데스크톱을 위한 Apple 실리콘 칩 "M 패밀리"의 첫 번째 버전이었습니다. M1 Pro, M1 Max 및 M1 Ultra와 같은 동생들이 있습니다. 오늘날 최신 하드웨어에서는 M2 칩을 구매할 수도 있지만 (하지만 저는 M3이 나오기 전까지 CTO에게 요청을 보내지 않을 거에요).

M1은 시스템 온 칩(SoC)입니다. 이것은 표준 데스크톱 PC와 다른 하드웨어 구축 방식입니다. SoC는 마더보드에 교체 가능한 구성 요소를 장착하는 대신 (CPU, 저장장치, RAM, 그래픽 카드와 같은), 모든 것을 단일 구성 요소로 통합해 이는 왜 이 방식이 공간이 제한된 모바일 장치에 맞게 자연스럽게 적합해요.

처음으로 M1 MacBook으로 업그레이드하는 것은 마치 마법 같아요. 진정한 게임 체인저. 모든 것이 빠르고, 냉각 팬은 전혀 작동하지 않는 것 같고, 배터리는 하루 종일 단 하나의 충전으로 지속돼요.

M1이 왜 이렇게 강력하면서도 그토록 적은 전력을 사용할 수 있는지에 대해서 어떻게 생각하세요?

<div class="content-ad"></div>

### M1의 비밀 무기

인텔 섹션에서 언급했듯이 CPU의 연결된 성격은 일반적으로 칩 아키텍처 간의 성능을 평가하기 어렵게 만듭니다.

인텔의 주요 성능 증진 요인은 트랜지스터를 줄이고 더 많고 빠른 CPU 코어를 칩에 탑재하는 것이었습니다. 더 많고 빠른 CPU 코어는 자연스럽게 더 높은 성능으로 이어집니다.

그러나 M1의 경우, 성능을 높이는데 기인한 완전히 다른 방식이 있습니다: 전문화.

<div class="content-ad"></div>

## 이집트 인나와 결속

M1 칩은 이집트 인나와 결속 전략을 적용합니다. 이는 특정 워크로드를 위한 특수 구성 요소를 의미합니다. PC 게이머들은 이미 이에 익숙합니다. 수십 년 동안 Nvidia는 비디오 게임 랜더링 엔진에서 마주하는 특수 병렬 워크로드를 처리하기 위해 그래픽 카드인 GPU를 판매해 왔습니다.

애플은 혼성 워크로드의 방향을 급격히 변화시키면서 이 접근 방식을 다음 수준으로 이끌고 있습니다. M1 SoC의 구성 요소는 다양한 컴퓨팅 작업을 위해 특수화되어 있습니다:

- 이미지 처리 회로
- 수학 신호 프로세서
- AI 가속화 신경 엔진
- 전용 비디오 인코더 및 디코더
- 암호화된 저장 공간을 위한 안전한 엔클레이브
- 128 병렬 실행 단위를 갖춘 8개의 GPU 코어
- 4개의 고성능 Firestorm CPU 코어
- 4개의 효율적이고 저전력 Icestorm CPU 코어

<div class="content-ad"></div>

이 듀얼 세트의 CPU를 활용하는 방식은 ARM에 의해 big.LITTLE 아키텍처로 명명되었는데, 이는 전문 구성 요소로 보내지 않은 일반 CPU 워크로드의 전력 소비를 최적화합니다.

파이어스톰 CPU는 사용자가 요청한 시간에 민감한 워크로드를 무한히 실행합니다. 한편, 아이스스톰 CPU는 느리게 백그라운드 워크로드를 처리하면서 전력을 90% 적게 소비합니다.

애플 실리콘 SoC의 핵심 이질적 아키텍처 외에도 놀라운 M1 성능의 몇 가지 보충적 이유가 있습니다:

- 통합 메모리 아키텍처
- 비순차적 실행
- 물리학: 궁극의 제약

<div class="content-ad"></div>

## 통합 메모리 아키텍처

M1 칩은 GPU와 CPU 간에 공유되는 통합 메모리 아키텍처를 갖고 있어요. 이것은 성능을 위한 탁월한 선택이에요. 데이터를 외부 GPU로 전송해야 할 때, CPU는 일반적으로 처리를 위해 데이터를 GPU가 소유한 메모리로 복사해야 합니다.

왜 모든 프로세서가 통합 그래픽을 갖고 있지 않을까요?

Apple이 CPU와 GPU를 SoC에 통합할 때 발생하는 두 가지 주요 문제를 해결해야 했기 때문이에요:

<div class="content-ad"></div>

- CPU와 GPU는 그들의 데이터를 서로 다른 방식으로 포맷합니다. CPU는 작은 바이트를 자주 조금식 뜯어먹는 것을 좋아하고, GPU는 대량의 데이터를 드물게 한꺼번에 먹는 것을 좋아해 대규모 병렬 처리를 수행합니다.
- GPU는 열을 만듭니다. 매우 많은 열을 만듭니다. 그래픽 카드에는 "주보잉 주척" 감성을 위해 통합 냉각 팬이 장착되어 있습니다.

애플의 방식은 RAM과 L3 캐시 모두에 대해 같은 블록의 메모리를 할당하여 CPU가 필요로 하는 고 처리량의 대량 덩어리를 제공할 수 있는 형식으로 GPU가 좋아하는 방식으로 두 프로세서 간에 공유됩니다. 그들의 ARM 칩은 라톱의 허벅지에 구멍을 뚫지 않으면서도 같은 다이에 통합할만큼 저에너지입니다.

## 순서변경 실행

이렇게 이질적인 아키텍처는 특수화된 워크로드가 최적의 도구로 이동할 수 있도록 하지만, Firestorm CPU 코어 자체는 일반 워크로드에 대해 매우 강력합니다.

<div class="content-ad"></div>

이전에 CPU 코어가 동시에 여러 명령을 가져오고 해독하며 한꺼번에 처리할 수 있게 했던 슈퍼스칼라 아키텍처에 대해 이야기했습니다. RISC 아키텍처를 통해 M1 칩은 실행 순서와 독립적으로 작동하는 모델을 통해 이를 더욱 발전시킬 수 있습니다.

ARM RISC 명령어는 모두 4바이트(32비트)이며, 반면 x86 CISC 명령어는 1~15바이트로 다양합니다. 이는 ARM 칩이 분석 오버헤드 없이 지시 바이트의 연속적인 스트림을 디코더로 쉽게 나눌 수 있다는 것을 의미합니다.

기본 M1 칩에는 놀라운 8개의 디코더가 있으며, Firestorm CPU 코어는 각 클럭 주기에 동시에 채웁니다. 이러한 명령어들은 여러 특수 회로 부분으로 병렬적으로 전달됩니다.

Apple 실리콘은 한꺼번에 수백 개의 명령어 사이의 종속성 그래프를 분석하여 지금 바로 전달할 수 있는 것과 결과를 기다려야 하는 것을 파악합니다. 이러한 점을 선진적인 분기 예측과 결합하면, M1 CPU는 실질적으로 아티움을 태우는 것과 다름없습니다.

<div class="content-ad"></div>

## 물리학: 궁극적인 제약요소

이 SoC가 빠르고 저전력인 근본적인 이유가 하나 있습니다. 이것은 CPU 캐시에 대해 배울 때 살펴본 개념과 동일합니다.

간단히 말해, M1 칩에 있는 모든 것은 물리적으로 아주 가깝습니다. 전기 신호가 번개처럼 움직이더라도, 거리가 짧을수록 작업이 간단히 빠릅니다.

GHz 클럭 속도에서 나노초는 누적됩니다.

<div class="content-ad"></div>

## 초고성능

M1 Ultra 칩은 최대 출력을 제공하기 위해 설계된 칩으로, Apple은 그들의 도구통에서 극자외선 리소그래피 장비 대신 흉칙한 도구를 꺼냈습니다. 극단적인 초자외선 리소그래피 장비 대신, 팀 쿡은 대형 망치를 꺼내들었습니다.

사실 M1 Ultra 칩은 그냥 두 개의 M1 Max 칩을 붙여 놓은 것입니다.

조금은 미묘할 수도 있습니다 - 이 중개 구조는 2.5TB/s의 꽤 높은 칩 간 처리량을 가능하게 하여 구성 요소들이 마치 같은 칩인 것처럼 동작할 수 있게 합니다.

<div class="content-ad"></div>

## Apple의 최종 이전?

Apple은 Intel x86에서 Apple Silicon으로의 전환을 위해 검증된 전략을 계속 적용해왔습니다.

개발자들은 Intel과 Apple Silicon 바이너리를 모두 포함하는 유니버설 앱을 개발할 수 있습니다. 게다가, Rosetta가 Rosetta II로 업그레이드되어 Intel 명령을 ARM으로 실시간으로 변환해주는 완벽한 기능을 제공합니다.

Apple은 언제나 웅장하게 발표를 하는 스타일로 몇몇 Intel 앱과 게임이 원래보다 더 나은 성능으로 Rosetta II를 통해 ARM에서 실행될 것이라고 주장합니다.

<div class="content-ad"></div>

## 인텔의 종말?

인텔에게 장기간 파트너십을 이어온 대형 고객 중 하나가 관계를 끊으려 한 것은 아픈 타격이었습니다. 현실에 대한 부인 상태인 인텔은 자신들만의 투자로 따라잡을 수 있다고 믿고 있습니다.

애플 실리콘과 AI 사용 사례에서의 엔비디아의 우세성을 고려하면 분명한 한 가지 사실이 있습니다: 인텔은 너무 오랫동안 너무 만족스럽게 여겼습니다.

# 결론

<div class="content-ad"></div>

애초에 이 글은 애플의 유명한 CPU 아키텍처 이주의 간략한 역사를 다루려고 했지만, 언제나처럼 내 호기심이 좀 너무 커졌네요. 대부분의 정보 출처가 표면적인 수준에 그친 게 너무 답답했거든요.

- 왜 맥킨토시 팀이 사용 가능한 옵션 중에서 모토로라 68k를 선택했는지 알아야 했어요.
- 새로운 CPU 아키텍처인 파워PC로의 이주가 왜 그토록 어려웠는지 궁금해졌어요.
- 인텔의 x86 아키텍처가 경쟁사들보다 어떻게 앞서게 되었는지를 알아야 했어요.
- M1 칩이 왜 그토록 효율적인지가 알고 싶었죠.

제 생각에 제법 잘 이야기해 냈을 거라 생각해요.

조금이나마 배우고, 무엇보다도 즐거운 시간을 가졌기를 바래요.

<div class="content-ad"></div>

이 아키텍처 중 어떤 것을 사용해 보셨나요? 어셈블리 코드를 작성했거나, CPU를 커스텀 빌드 PC의 구성 요소로 사용했거나, 아니면 새로운 M1 Mac에 감탄한 적이 있을 수도 있습니다.

댓글로 여러분의 경험을 공유해 주세요!

(진지합니다. 새로운 Medium 알고리즘에서는 박수와 댓글이 엄청난 차이를 만들어 냅니다!)

이 글이 마음에 드셨다면, '사대로 이야기: 애플 애니메이션 API' 시리즈의 다른 글도 확인해 보세요!

<div class="content-ad"></div>

읽어 주셔서 감사합니다!
