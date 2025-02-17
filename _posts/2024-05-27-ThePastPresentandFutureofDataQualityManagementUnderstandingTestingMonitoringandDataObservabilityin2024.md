---
title: "데이터 품질 관리의 과거, 현재, 그리고 미래 2024년에 알아야 할 테스트, 모니터링, 그리고 데이터 관찰 가능성"
description: ""
coverImage: "/assets/img/2024-05-27-ThePastPresentandFutureofDataQualityManagementUnderstandingTestingMonitoringandDataObservabilityin2024_0.png"
date: 2024-05-27 12:51
ogImage:
  url: /assets/img/2024-05-27-ThePastPresentandFutureofDataQualityManagementUnderstandingTestingMonitoringandDataObservabilityin2024_0.png
tag: Tech
originalTitle: "The Past, Present, and Future of Data Quality Management: Understanding Testing, Monitoring, and Data Observability in 2024"
link: "https://medium.com/towards-data-science/the-past-present-and-future-of-data-quality-management-understanding-testing-monitoring-and-efd1350457eb"
isUpdated: true
---

## 데이터 환경이 진화하고 있으며, 데이터 품질 관리도 함께 발전해야 합니다. 다음은 AI 시대에 데이터 품질 관리가 향하는 방향과 세 가지 일반적인 접근 방식에 대한 정보입니다.

![이미지](/assets/img/2024-05-27-ThePastPresentandFutureofDataQualityManagementUnderstandingTestingMonitoringandDataObservabilityin2024_0.png)

서로 다른 용어일까요? 같은 문제에 대한 독특한 접근 방식일까요? 아니면 다른 것일까요?

그리고 더 중요한 것은 — 모두 세 가지가 정말 필요한가요?

<div class="content-ad"></div>

데이터 엔지니어링에서처럼, 데이터 품질 관리도 초속으로 진화하고 있어요. 기업에서 데이터와 AI의 급부상으로 인해, 현대 비즈니스에 있어 데이터 품질은 제로 데이 위험이 되었고 데이터 팀이 해결해야 할 핵심 문제가 되었어요. 중첩 용어가 많아서 어떻게 모두 맞는지 또는 맞는지 여부가 항상 명확하지 않아요.

그러나 몇몇이 주장하는 것과는 달리, 데이터 품질 모니터링, 데이터 테스트 및 데이터 가시화는 데이터 품질 관리에 대한 대안적인 접근 방식도 아니고, 상충되는 것도 아니에요. 이것들은 하나의 해결책의 보완적 요소들이에요.

이 글에서, 이 세 가지 방법론의 구체적인 내용, 각각이 어디에서 가장 잘 작동하며, 어디서 약점이 있는지, 그리고 2024년에 데이터 신뢰를 증진할 수 있는 데이터 품질 실무를 최적화하는 방법에 대해 살펴볼게요.

# 현대 데이터 품질 문제 이해하기

<div class="content-ad"></div>

현재 솔루션을 이해하기 전에 문제를 이해해야 합니다. 시간이 지남에 따라 어떻게 변화했는지 알아야 합니다. 다음 유사성을 고려해 봅시다.

상상해보세요. 당신이 지역 수도 공급을 책임지는 엔지니어라고 상상해봅시다. 당신이 이 직무를 맡을 때, 그 도시에는 단 1,000 명의 주민이 있었습니다. 그러나 도시 아래에 금이 발견되자, 당신의 1,000 명 주민들의 작은 커뮤니티가 1,000,000 명의 진정한 도시로 변모했습니다.

이것이 당신이 하는 일에 어떻게 영향을 미칠까요?

먼저, 작은 환경에서는 실수 포인트가 상대적으로 적습니다. 파이프가 고장나면, 근본 원인을 냉동 파이프, 누군가가 수도관에 파고들면, 일반적인 몇 가지 원인 중 하나로 좁힐 수 있고, 1~2 명의 직원이 리소스로 문제를 빠르게 해결할 수 있습니다.

<div class="content-ad"></div>

100만 명의 신규 거주민을 디자인하고 유지하기 위한 뱀과 같은 파이프라인, 수요 충족을 위해 필요한 광란스러운 속도, 그리고 팀의 한계적인 능력(및 가시성) 때문에 예상했던 모든 문제를 찾아 해결하거나 감시해야 할 수 있는 능력이 더 이상 동일하지 않습니다.

현대 데이터 환경도 마찬가지입니다. 데이터 팀은 금광을 발견했고 이해 관계자들은 그 발전 상황에 참여하고 싶어합니다. 데이터 환경이 커질수록 데이터 품질 유지가 더 어려워지며 전통적인 데이터 품질 방법이 덜 효과적일 수 있습니다.

그들의 주장이 완전히 틀렸다고 할 수는 없습니다. 하지만 그것만으로 충분하지는 않습니다.

# 그래서 데이터 모니터링, 테스트 및 관찰의 차이는 무엇일까요?

<div class="content-ad"></div>

매우 명확하게, 이러한 방법 중 각각은 데이터 품질에 대응하려는 시도입니다. 따라서, 당신이 해결해야 할 문제가 그것이라면, 이 중 하나는 원칙적으로 그 문제를 확인할 것입니다. 하지만, 이 모두가 데이터 품질 솔루션이라는 것은 실제로 데이터 품질 문제를 해결해주지 않을 수 있다는 뜻입니다.

이러한 솔루션들이 언제 어떻게 사용되어야 하는지는 그것보다는 조금 더 복잡합니다.

가장 간단하면서, 데이터 품질을 문제로 생각할 수 있고, 테스트 및 모니터링을 품질 문제를 식별하는 방법으로 생각할 수 있으며, 데이터 가시성은 더 품질 문제를 해결할 수 있는 더 심도 있는 가시성과 해결 기능을 결합하고 확장하는 다양하고 포괄적인 접근 방식으로 생각할 수 있습니다.

더 간단히 말하여, 모니터링과 테스팅은 문제를 확인하고, 데이터 가시성은 문제를 확인하고 해결책을 제시함으로써 실질적인 대응이 가능합니다.

<div class="content-ad"></div>

여기 데이터 관찰이 데이터 품질 성숙도 곡선에서 어디에 위치하는지 시각화하는 빠른 그림이 있습니다.

![Data Quality Maturity Curve](/assets/img/2024-05-27-ThePastPresentandFutureofDataQualityManagementUnderstandingTestingMonitoringandDataObservabilityin2024_1.png)

이제 각 방법에 대해 조금 더 자세히 알아보겠습니다.

# 데이터 테스트

<div class="content-ad"></div>

데이터 품질에 대한 전통적인 두 가지 방법 중 첫 번째는 데이터 테스트입니다. 데이터 품질 테스트(또는 간단히 데이터 테스트)는 사용자 정의 제약 조건이나 규칙을 사용하여 데이터 집합 내에서 특정 알려진 문제를 식별하는 감지 방법으로, 데이터 무결성을 확인하고 특정 데이터 품질 기준을 보장합니다.

데이터 테스트를 생성하기 위해 데이터 품질 소유자는 SQL이나 dbt와 같은 모듈화된 솔루션을 활용하여 특정 문제(예: 과도한 널 비율 또는 잘못된 문자열 패턴)를 감지하는 일련의 수동 스크립트를 작성할 것입니다.

데이터 요구 사항 — 따라서 데이터 품질 요구 사항도 — 가 매우 작은 경우, 많은 팀이 간단한 데이터 테스트에서 필요한 것을 충분히 얻을 수 있을 것입니다. 그러나 데이터가 커지고 복잡해지면, 새로운 데이터 품질 문제에 직면하게 되고 이를 해결하기 위한 새로운 능력이 필요해질 것입니다. 그 시간은 빨리 다가오게 될 것입니다.

데이터 테스트는 데이터 품질 프레임워크의 필수 구성 요소로 남을 것이지만, 몇 가지 중요한 영역에서 제한이 있습니다:

<div class="content-ad"></div>

- 깊은 데이터 지식이 필요합니다 — 데이터 테스트에는 데이터 엔지니어가 1) 품질을 정의하기 위해 충분한 전문 분야 지식이 필요하고, 2) 데이터가 어떻게 실패할 수 있는지에 대한 충분한 지식이 필요합니다.
- 알 수 없는 문제에 대한 검토가 불가능합니다 — 데이터 테스트는 예상되는 문제에 대해서만 알려줄 뿐, 예상치 못한 사건에 대해서는 알려주지 않습니다. 특정 문제를 커버하기 위해 테스트가 작성되지 않은 경우, 테스트는 해당 문제를 발견할 수 없습니다.
- 확장성이 없습니다 — 30개 테이블에 대해 10개의 테스트를 작성하는 것은 3,000개 테이블에 대해 100개의 테스트를 작성하는 것과 많은 차이가 있습니다.
- 제한된 가시성 — 데이터 테스트는 데이터 자체만을 테스트하므로 문제가 데이터, 시스템 또는 해당 시스템을 제공하는 코드와 관련이 있는지 알려줄 수 없습니다.
- 해결 방법이 없습니다 — 데이터 테스트로 문제를 감지해도, 이를 해결하는 데나 영향을 받는 내용을 이해하는 데는 도움이 되지 않습니다.

어떤 규모에 있어서도, 테스트는 데이터에서 "불!"이라고 외치는 것과 같다. 그 후 아무도 어디서 이것을 본 것인지 알려주지 않고 걷어나가는 데이터 버전입니다.

# 데이터 품질 모니터링

데이터 품질 모니터링은 데이터 품질에 대한 또 다른 전통적이면서 다소 세련된 접근 방식으로, 수동 임계값 설정 또는 머신러닝을 통해 계속해서 모니터링하고 데이터에서 숨어있는 알 수 없는 이상 현상을 식별하는 영구적인 솔루션입니다.

<div class="content-ad"></div>

예를 들어, 데이터가 제때 도착했나요? 예상했던 행 수를 얻었나요?

데이터 품질 모니터링의 주요 이점은 알려지지 않은 알려지지 않은 사항에 대해 보다 넓은 범위의 커버리지를 제공하며, 모든 데이터셋마다 테스트를 작성하거나 복제하여 공통 문제를 수동으로 식별해야 하는 데이터 엔지니어들을 해방시켜줍니다.

어느 면에서는, 데이터 품질 모니터링이 테스트보다 전체적인 측면에서 더 ganzonden입니다. 시간이 흘러도 해당 메트릭을 비교하고 팀이 이미 알려진 문제의 데이터에 대한 단일 단위 테스트에서 보지 못할 패턴을 발견할 수 있도록 해줍니다.

유감스럽게도, 데이터 품질 모니터링은 몇 가지 중요한 측면에서 부족함이 있습니다.

<div class="content-ad"></div>

- 컴퓨팅 비용 증가 - 데이터 품질 모니터링은 비용이 많이 듭니다. 데이터 테스트와 마찬가지로 데이터 품질 모니터링은 데이터를 직접 쿼리하지만, 알려지지 않은 알려지지 않은 사항을 식별하기 위해 넓게 적용되어야 하므로 큰 컴퓨트 비용이 듭니다.
- 가치창출 시간이 느림 - 모니터링 임계값은 머신 러닝으로 자동화할 수 있지만, 먼저 각 모니터를 직접 구축해야 합니다. 이는 데이터 환경이 시간이 지남에 따라 확장됨에 따라 각 문제에 대해 많은 양의 코딩을 하고 그 모니터를 수동으로 확장해야 한다는 것을 의미합니다.
- 제한된 가시성 - 데이터가 다양한 이유로 손상될 수 있습니다. 테스트와 마찬가지로 모니터링은 데이터 자체만을 살펴보기 때문에 이상 사항이 발생했음을 알려줄 뿐, 그 이유를 알려주지는 않습니다.
- 해결책이 없음 - 모니터링은 테스트보다 더 많은 이상 사항을 감지할 수는 있지만, 여전히 어떤 것이 영향을 받았는지, 누가 그것을 알아야 하는지 또는 그 중 어느 것이 중요한지를 알려줄 수 없습니다.

게다가, 데이터 품질 모니터링이 경고를 전달하는 데에만 더 효과적일 뿐 관리하지는 않는다는 점 때문에 여러분의 데이터 팀은 시간이 지남에 따라 실제로 데이터 신뢰성을 향상시키기보다 경보 피로를 경험할 가능성이 훨씬 더 큽니다.

# 데이터 관측성

이것이 데이터 관측성입니다. 위에서 언급된 방법들과는 달리 데이터 관측성은 종합적인 공급업체 중립적 솔루션을 의미하며, 확장 가능하고 실행 가능한 완전한 데이터 품질 커버리지를 제공하도록 설계되었습니다.

<div class="content-ad"></div>

소프트웨어 엔지니어링의 최고의 실천 방법을 모티브로 한 데이터 관찰은 데이터 품질 관리의 종단간 AI 지원 접근법으로, 데이터 품질 문제에 대한 "무엇, 누가, 왜, 어떻게"를 단일 플랫폼 내에서 해결하기 위해 설계되었습니다. 이는 기존 데이터 품질 방법의 한계를 보완하기 위해 테스트와 완전 자동화된 데이터 품질 모니터링을 결합하여 단일 시스템으로 확장한 후, 그것을 데이터, 시스템 및 코드 수준으로 확장하여 데이터 환경을 커버합니다.

중요 사건 관리 및 해결 기능 (자동 열 수준 라인형 및 경보 프로토콜과 같은)과 결합된 데이터 관찰은 데이터 팀이 수집부터 사용까지 데이터 품질 문제를 감지, 분류 및 해결할 수 있도록 돕습니다.

더불어 데이터 관찰은 데이터 엔지니어, 분석가, 데이터 소유자 및 이해 관계자를 포함한 팀 간 협업을 촉진하여 교차 기능적 가치를 제공하도록 설계되었습니다.

데이터 관찰은 전통적인 데이터 품질 실무의 단점을 다음 네 가지 핵심 방식으로 해결합니다:

<div class="content-ad"></div>

- 견고한 사건 분류 및 해결 - 가장 중요한 것은 데이터 관찰성이 사건을 빨리 해결할 수 있는 리소스를 제공합니다. 태깅 및 경보 외에도 데이터 관찰성은 자동 열 수준 계보를 통해 원인 분석 프로세스를 빠르게 처리하여 팀이 영향을 받은 것, 누가 알아야 하는지, 고치러 가야 할 곳을 한 눈에 볼 수 있도록 돕습니다.
- 완벽한 가시성 - 데이터 관찰성은 데이터 소스를 초월하여 인프라, 파이프라인 및 데이터 이동 및 변환하는 포스트 인게스션 시스템까지 확대하여 회사 전반의 도메인 팀을 위해 데이터 문제를 해결합니다.
- 가치 실현 속도 향상 - 데이터 관찰성은 ML 기반 모니터를 사용하여 설정 프로세스를 완전히 자동화하고 코딩이나 임계값 설정 없이 즉시 커버리지를 제공하여 환경에 따라 시간이 경과함에 따라 자동으로 확장되는 커버리지를 빠르게 얻을 수 있습니다 (사용자가 정의한 테스트가 쉬워지는 사용자 정의 테스트를 위한 커스텀 인사이트 및 단순화된 코딩 도구도 포함됨).
- 데이터 제품 건강 추적 - 데이터 관찰성은 전통적인 테이블 형식을 벗어나 모니터링 및 건강 추적을 확장하여 특정 데이터 제품이나 중요 자산의 건강 상태를 모니터링, 측정 및 시각화합니다.

# 데이터 관찰성과 AI

우리는 모두 "쓰레기를 넣으면 쓰레기가 나온다"는 말을 들어본 적이 있을 것입니다. 그런데, 그 말은 AI 애플리케이션에 대해 두 배로 참된 것입니다. 그러나 AI는 단순히 출력물을 제공하기 위해 더 나은 데이터 품질 관리가 필요한 것뿐만 아니라 진화하는 데이터 자산의 확장성을 극대화하기 위해 데이터 품질 관리 자체가 AI에 의해 지원되어야 합니다.

데이터 관찰성은 기업 데이터 팀이 AI에 신뢰할 수 있는 데이터를 효과적으로 제공할 수 있도록 해주는 사실상 유일한 데이터 품질 관리 솔루션이자 가능성이라고 볼 수 있습니다. 이를 달성하는 한 가지 방법은 AI로 구동되는 솔루션이기도 하기 때문입니다.

<div class="content-ad"></div>

AI를 활용하여 모니터 생성, 이상 징후 감지, 원인 분석을 통해 데이터 관찰력은 실시간 데이터 스트리밍, RAG 아키텍처 및 기타 AI 사용 사례를 위한 초스케일 데이터 품질 관리를 가능하게 합니다.

# 그렇다면, 2024년에는 데이터 품질이 어떻게 변화할까요?

기업 및 그 이상을 위한 데이터 에스테이트가 계속 발전함에 따라, 전통적인 데이터 품질 방법으로는 데이터 플랫폼이 망가질 수 있는 모든 방법을 감시할 수 없거나 그 문제를 해결하는 데 도움을 줄 수 없습니다.

특히 AI 시대에는 데이터 품질이 비즈니스 리스크뿐만 아니라 존립적인 리스크이기도 합니다. 모델로 공급되는 데이터의 전부를 신뢰할 수 없다면, AI의 출력도 신뢰할 수 없게 됩니다. AI의 빠른 규모에서는 전통적인 데이터 품질 방법으로는 이러한 데이터 자산의 가치나 신뢰성을 보호하는 데 충분하지 않습니다.

<div class="content-ad"></div>

효과적인 데이터 품질 관리를 위해서는 테스트와 모니터링이 하나로 통합된 플랫폼에 솔루션이 필요합니다. 이 솔루션은 데이터 환경 전체를 객관적으로 모니터링하고 데이터 팀이 문제를 신속히 해결할 수 있는 자원을 제공해야 합니다.

다시 말해, 최신 데이터 팀이 필요한 것은 데이터 관측성입니다.

첫 번째 단계. 감지하기. 두 번째 단계. 해결하기. 세 번째 단계. 성공하기.
