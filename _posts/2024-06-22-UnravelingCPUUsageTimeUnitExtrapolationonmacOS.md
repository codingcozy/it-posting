---
title: "맥OS에서 CPU 사용량 해부 시간 단위 외삽법 이해하기"
description: ""
coverImage: "/assets/img/2024-06-22-UnravelingCPUUsageTimeUnitExtrapolationonmacOS_0.png"
date: 2024-06-22 16:22
ogImage:
  url: /assets/img/2024-06-22-UnravelingCPUUsageTimeUnitExtrapolationonmacOS_0.png
tag: Tech
originalTitle: "Unraveling CPU Usage: Time Unit Extrapolation on macOS"
link: "https://medium.com/@federicosauter/unraveling-cpu-usage-time-unit-extrapolation-on-macos-7e0f53315464"
isUpdated: true
---

![이미지](/assets/img/2024-06-22-UnravelingCPUUsageTimeUnitExtrapolationonmacOS_0.png)

macOS에서 CPU 성능 지표를 이해하는 것은 복잡한 과제일 수 있습니다. 이전에 살펴본 것처럼, 이 기사에서는 서로 다른 시간 단위 간의 CPU 사용량을 추정하는 작업의 마지막 부분을 안내하며 Mach 커널 시간 유닛의 복잡성을 밝힐 것입니다.

# 빠진 링크

사용자 공간에서 시간 단위(Mach 시간 및 틱)를 변환하는 것이 불가능할 때 대안적인 방법이 필요합니다. 커널 소스를 통해 한 가지 핵심 요소인 hz_tick_interval이 이 변환에 중요하다는 것을 알게 되었습니다.

<div class="content-ad"></div>

한편, 각 프로세스가 사용한 CPU 시간을 Ticks로 표현했습니다. 프로세스의 CPU 사용률을 백분율로 얻으려면 시스템이 수행한 총 CPU 시간(휴식 시간 포함)이 필요합니다. 이 총 CPU 시간이 우리가 본질적으로 찾고 있는 것입니다. 사용된 CPU 시간과 휴식 CPU 시간 사이의 비율은 사용된 단위에 관계없이 동일해야 하므로 변환 프로세스가 단순화됩니다.

사용된 CPU 시간과 휴식 CPU 시간 사이의 비율이 사용된 단위에 관계없이 동일해야 한다고 가정하면 다음 방정식을 도출할 수 있습니다:

\[ \frac{Used\ CPU\ Time}{Idle\ CPU\ Time} = \frac{X\ ticks}{1 – X\ ticks} \]

여기서 X는 Mach 시간으로 표현된 CPU 휴식 시간입니다.

<div class="content-ad"></div>

만약 이 방정식을 해결하면, totalMachTimeForAllProcesses와 X를 더하여 시스템이 전달한 총 CPU 시간을 쉽게 계산할 수 있습니다.

## 갭 식별

우리는 방정식의 우변이 host_processor_info() API에 의해 처리되었다는 것을 알고 있습니다. 하지만 Mach 시간에서 총 CPU 시간을 어떻게 결정할 수 있을까요?

어떤 다른 구현을 찾아서 나에게 방법을 보여줄 수 있을까요?

<div class="content-ad"></div>

## ps 명령어를 활용한 탐사

저는 ps 명령줄 유틸리티가 프로세스의 CPU 사용량을 백분율로 보고하기 때문에, 이를 살펴볼 좋은 곳이라는 것을 기억했습니다. 다행히도, 이 명령어는 BSD 유틸리티이기 때문에 오픈 소스이기도 합니다. ps 구현체는 커널에서 얻은 프로세스 목록 전체를 반복하며 각 프로세스의 시간을 합하여 총 시간을 얻습니다. 이 지식을 갖고 나면, 이 문제를 마침내 고칠 방법을 정확히 알게 되었습니다!

# 결과 및 반성

새로운 구현의 결과는 기대를 충족시켰습니다. 퍼즐의 빠진 조각을 추론함으로써, 서로 다른 시간 단위 간에 명시적으로 변환할 필요 없이 전체 시스템 CPU 부하를 얻을 수 있었습니다. 이 여정은 xnu 커널의 깊은 곳을 지나 예상치 못한 곳으로 이끌었습니다.

<div class="content-ad"></div>

마지막 질문이 남았습니다: 커널에 왜 여러 시간 단위가 있는 것일까요? 내부적으로 일관되게 하나의 시간 단위를 사용하는 것이 더 간단하지 않을까요? 답은 xnu 커널이 초기에 어떻게 발전했는지와 가장 독특한 특성 중 하나를 보여주고 있습니다.

## 역사적 맥락

Mach 시간과 Ticks 간 변환에 사용되는 hz_tick_interval 상수의 정의를 검색하는 중 눈에 띄는 코멘트를 우연히 발견했습니다. 이 코멘트는 즉시 내 주목을 끈 것이었습니다:

![이미지](/assets/img/2024-06-22-UnravelingCPUUsageTimeUnitExtrapolationonmacOS_2.png)

<div class="content-ad"></div>

지금은 Mach 커널의 Recount 하위 시스템이 Mach 시간을 사용하여 리소스 사용을 추적한다는 것을 알게 되었습니다. 그러나 BSD 커널은 다른 기대를 가지고 있습니다. 이를 설명한 주석에서 확인할 수 있으며, 이에 변환이 필요합니다.

두 레이어가 시간 슬라이스에 대해 다른 가정을 하는 이유는 Mach 커널 초기 구현으로 거슬러 올라가봐야 합니다. CMU의 연구팀은 Mach 커널을 BSD에서 시작했습니다. BSD 시스템 호출을 조금씩 자신들의 것으로 대체하면서 조금씩 Mach을 구현하게 되었습니다. 작업 중에 움직임이 일어날 때, 새 시스템이 BSD와 완전히 호환되도록 보장하는 것은 더 쉬워집니다. 또한 개발 중간에 있어서도 완전히 작동하는 시스템을 보유하는 것이 더 쉬워집니다.

재밌는 점은, 리누스 토발즈가 처음에 Linux를 개발할 때 하는 방식과 유사하다는 점입니다.

이제 xnu는 여기서 논의한 것보다 더 많은 하위 시스템으로 구성되어 있으며, 각각은 다른 시기에 다른 조직에 의해 작성되었습니다. macOS의 시스템 프로그래밍이 왜 도전적이면서 매력적인지 빠르게 이해하게 될 것입니다.

<div class="content-ad"></div>

# 계층화된 아키텍처

여러 차례, 특정 기능을 구현하는 커널 레이어가 무엇인지 고민해야 했던 적이 있었습니다. 예를 들어 디스크를 생각해보면, 우리가 시스템에서 USB 디스크가 연결되었는지 또는 분리되었는지 알고 싶다면, 이것은 커널의 IOKit 레이어에 구현되어 있습니다. 그러나 반대로 USB 디스크에서 마운트된 파일 시스템에 대해 알고 싶다면, BSD 레이어에 구현되어 있습니다. 각 레이어마다 고유한 API와 리소스 식별자가 있습니다.

xnu는 서로 다른 레이어로 구성된 양파처럼, 때로는 예상치 못한 방법으로 상호 작용합니다.

정말 재미있는 여정이었습니다! 저에게는 마치 영화 '매트릭스'에서 알약을 복용하여 복잡한 세계에 들어간 느낌이었는데, 그곳에서 얻은 정보를 현실 세계에 적용하는 것 같았습니다. 만약 여러분도 이렇게 깊게 파고들어서 탐험하는 것을 즐기신다면, 시스템 프로그래밍은 여러분이 즐겁게 다룰 수 있는 분야일 것입니다! 읽어 주셔서 감사합니다. 다음 글에서 뵙겠습니다!
