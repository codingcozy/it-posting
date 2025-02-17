---
title: "데이터 폭풍 속을 해마하는 여정 정교한 레이크하우스 플랫폼 구축하기"
description: ""
coverImage: "/assets/img/2024-05-27-NavigatingtheDataDelugeAJourneytoCraftingaSophisticatedLakehousePlatform_0.png"
date: 2024-05-27 12:55
ogImage:
  url: /assets/img/2024-05-27-NavigatingtheDataDelugeAJourneytoCraftingaSophisticatedLakehousePlatform_0.png
tag: Tech
originalTitle: "Navigating the Data Deluge: A Journey to Crafting a Sophisticated Lakehouse Platform"
link: "https://medium.com/@menis_77397/navigating-the-data-deluge-a-journey-to-crafting-a-sophisticated-lakehouse-platform-7a1d7a147149"
isUpdated: true
---

![이미지](/assets/img/2024-05-27-NavigatingtheDataDelugeAJourneytoCraftingaSophisticatedLakehousePlatform_0.png)

목요일 오후 늦은 시간, 우리는 깨달음을 얻었습니다. 어두운 사무실에서 깜박이는 화면들을 둘러싸고, 두 명의 예리한 데이터 분석가 동료와 데이터 과학자로 구성된 헌신적인 팀, 그리고 나, 데이터 엔지니어는 PostgreSQL과 MySQL 데이터베이스에서 데이터를 조인하려고 깊이 파고들고 있었습니다. 이 작업은 간단할텐데 어쩌면 서로 다른 부서에서 오는 불일치된 데이터 구조와 충돌하는 스키마로 애를 쓰고 있었습니다. 이러한 이질적인 데이터 세트를 수동으로 맞추려고 할수록 복잡성이 압도되는 느낌이었습니다. 혼돈스러운 정보 동기화 시도마다 실패할 때마다 공기는 분노로 더 두꺼워졌습니다. "이렇게 일할 수는 없어," 살짝 중얼거렸던 저의 목소리엔 스트레스가 느껴졌습니다. 우리의 현재 시스템이 현실에 부합하지 않다는 것은 명백했습니다—우리는 흩어진 데이터 정복 뿐만 아니라 이 넓은 데이터 정글을 이해할 수 있는 통합 플랫폼이 필요했던 것입니다. 이 순간이 우리에게 중대한 변화가 필수적이라는 것을 알게 된 시점이었고, 큰 변화가 곧 찾아올 것임을 알게 된 시점이었습니다.

이 여정을 시작하면서, 저희는 우리 회사의 의사 결정 프로세스의 기반이 되는 견고한 데이터 플랫폼 아키텍처를 만들었습니다. 이 블로그 글에서는 다양한 데이터를 단일하고 강력한 분석 엔진으로 통합하는 것뿐만 아니라 지속적으로 발전하고 시간이 지남에 따라 더 많은 데이터 소스를 통합하는 유연하고 확장 가능한 데이터 인프라를 구축하는 과정에서 우리가 직면한 인사이트와 도전에 대해 탐구할 것입니다.

대용량의 원시 데이터를 원래 형식 그대로 저장할 수 있는 유연성으로 기업들에게 빠르게 적응하고 효율적으로 확장할 수 있는 도구로써 데이터 레이크가 부각되었습니다. 그러나 계속 진행함에 따라 데이터 관리에 더 구조적인 접근이 필요하다는 것을 깨달았고, 그로 인해 레이크하우스 구조를 채택하게 되었습니다. 이 하이브리드 모델은 데이터 레이크의 확장성과 유연성을 데이터 웨어하우스의 관리 기능과 결합하여 데이터 전략을 향상시킵니다. 이 이야기는 이러한 기술을 활용하기 위해 우리가 취한 실질적인 단계를 살펴보며, 데이터 레이크를 레이크하우스 프레임워크로 통합함으로써 데이터 주도 기업에게 혁신적인 자산이 될 수 있는 방법을 밝힐 것입니다.

<div class="content-ad"></div>

## 레이크하우스 이전의 데이터 전략

레이크하우스를 개발하기 전에, 데이터 관리는 간단했지만 우리의 요구사항이 증가함에 따라 비효율적으로 변했습니다. 처음에는 BI용 Apache Superset을 사용하여 3개의 주요 데이터 소스를 관리했는데, 처음에는 최소한의 복잡성으로 우리의 요구사항을 충족시켰습니다.

그러나 우리의 데이터 요구사항이 증가함에 따라 시스템의 한계가 나타나기 시작했습니다. 두 가지 다른 소스에서 데이터를 조인해야 할 필요가 발생했을 때 중대한 도전이 발생했습니다. 당시 우리의 솔루션은 매우 효율적이지 못했습니다: 필요한 데이터를 한 소스에서 다른 소스로 수동으로 복제했습니다. 이 프로세스는 시간이 많이 걸릴 뿐만 아니라 데이터를 동기화하기 위해 빈번한 업데이트가 필요했기 때문에 오류를 발생시킬 가능성도 있었습니다.

또한 다양한 팀과 프로젝트가 발전함에 따라 Superset 내에서 여러 데이터셋이 생성되었는데, 각각이 특정한 분석 요구에 맞게 조정되었습니다. 불행히도, 이로 인해 여러 데이터셋에 중복 변환 요소가 코딩되어 복잡성이 증가했을 뿐만 아니라 이러한 변환을 유지하고 업데이트하는 것이 점점 더 부담스러워졌습니다.

<div class="content-ad"></div>

## 데이터 아키텍처 결정: Lake, Warehouse 또는 Lakehouse?

저희 데이터 인프라에 적합한 아키텍처를 선택하는 것은 중요한 결정이었습니다. 세 가지 주요 옵션 중에서 선택을 고민했습니다: 데이터 레이크, 데이터 웨어하우스 및 레이크하우스. 각각에 대한 간단한 개요를 살펴보겠습니다:

• **데이터 레이크**: 데이터 레이크는 원시 형식으로 방대한 양의 데이터를 저장합니다. 다양한 소스에서 대량의 다양한 데이터를 처리하는 데 이상적이며 높은 유연성과 확장성을 제공합니다. 그러나 구조화된 데이터 환경의 처리 효율성 일부가 부족합니다.

• **데이터 웨어하우스**: 이것은 질의 및 분석에 최적화된 구조화된 형식으로 데이터를 저장하는 시스템입니다. 데이터 웨어하우스는 구조화된 데이터에 대한 빠른 쿼리 성능에 뛰어나지만 변경사항 및 새로운 데이터 유형의 수용에 있어서 덜 유연할 수 있습니다.

<div class="content-ad"></div>

• Lakehouse: 데이터 레이크와 데이터 웨어하우스의 장점을 결합한 하이브리드 모델입니다. 데이터 레이크의 넓은 저장 공간과 유연성을 제공하면서 데이터 웨어하우스의 효율적인 쿼리 기능을 갖추고 있습니다.

신중한 고려 끝에 저희는 여러 가지 이유로 레이크하우스 아키텍처를 도입하기로 결정했습니다:

1. 유연성: 레이크하우스 아키텍처는 필요한 적응성을 제공했습니다. 기존의 데이터 웨어하우스는 새로운 데이터 소스나 유형을 빠르게 통합하는 것이 어려워 변경에 제한이 있고 느립니다.

2. 단순화된 아키텍처: 처음에는 기존의 ETL 프로세스를 데이터 웨어하우스와 데이터 레이크에 별도로 구축하는 것을 고려했지만, 두 개의 별도 시스템을 유지할 명확한 이유를 찾지 못했습니다. 레이크하우스 모델은 강력한 쿼리 및 저장 기능을 하나의 보다 관리하기 쉬운 시스템으로 통합한 간소화된 접근 방식을 제공합니다.

<div class="content-ad"></div>

다음은 주요 구성 요소에 대한 개요입니다:

Our Data Lakehouse stack

우리의 레이크하우스 아키텍처는 AWS 기술과 오픈 소스 솔루션의 최선을 활용하여 데이터를 효율적으로 관리하고 분석하는 것을 목표로 합니다.

이미지를 Markdown 형식으로 변경했습니다.

![Lakehouse Overview](/assets/img/2024-05-27-NavigatingtheDataDelugeAJourneytoCraftingaSophisticatedLakehousePlatform_1.png)

<div class="content-ad"></div>

**데이터 저장:**

우리는 데이터 저장을 위해 AWS S3를 활용하며, 환경을 개발 및 프로덕션용 2개의 전용 버킷으로 구성합니다. 메달리온 아키텍처를 채택하여 각 버킷 내에 bronze, silver 및 gold 세 가지 독립적인 레이어(폴더)를 설정했습니다. 각 레이어는 데이터 관리 수명주기에서 특정 목적을 제공합니다. 메달리온 아키텍처는 데이터를 세 개의 레이어로 분류하는 레이크하우스 시스템에 사용되는 계층화된 데이터 처리 모델입니다:

- Bronze Layer (Raw Layer): 이 기본 레벨에서는 다양한 소스로부터 도착한 대로 데이터를 정확히 저장하여 JSON, CSV 등의 원래 형식으로 보존합니다. 이 레이어는 주로 데이터 엔지니어링 팀이 디버깅 및 데이터 무결성 확인을 위해 액세스하는 데 중요하며 데이터 과학자가 초기 인사이트를 얻고 데이터 품질을 측정하기 위해 탐색 분석을 시작하는 중요한 역할을 합니다. 초기 인사이트는 더 나은 데이터 처리 전략을 안내하는 데 중요합니다.
- Silver Layer (Cleansed Layer): 데이터가 실버 레이어로 이동하면 필요한 클렌징 및 변환 프로세스를 수행합니다. 여기서 우리는 불일치를 수정하고 데이터를 풍부하게하여 구체적인 비즈니스 규칙을 적용하여 구조화되고 유용하게 만듭니다. 우리의 분석 엔지니어는 이 클렌징 된 데이터와 작업하여 복잡한 변환을 실행하고 내부 분석을 이끄는 자세한 보고서를 생성합니다. 더 나아가 이 레이어는 우리의 데이터 과학자가 정교한 모델을 구축하는 데 의존하는 정돈된 데이터 환경을 제공합니다.
- Gold Layer (Aggregated Layer): 이 곳에서 데이터는 가장 높은 가치를 얻으며, 비즈니스 수준의 집계 및 핵심 성능 지표로 변환됩니다. 신속한 검색 및 고속 분석을 위해 최적화된 골드 레이어는 주로 의사 결정자를 위해 액세스됩니다. 이들은 회사 전반의 전략 및 운영에 영향을 미치는 실행 가능한 인사이트를 위해 정제된 데이터에 의존합니다. 더불어 이 레이어는 기업 수준의 보고서 및 대시보드의 기반 역할을 합니다.

실버 및 골드 레이어에서는 쿼리 성능을 최적화하기 위해 데이터 파일을 Parquet 파일로 저장합니다. Parquet의 효율적인 열 지향 저장 형식 덕분에 쿼리 성능이 최적화됩니다. 또한, 이러한 Parquet 파일 위에서 Apache Iceberg를 활용하여 레이크하우스 아키텍처에 여러 가지 중요한 기능을 제공합니다. Apache Iceberg를 사용하면 데이터 레이크를 전통적인 데이터베이스처럼 다루되 더 큰 유연성과 확장성을 갖습니다. 스냅샷, 트랜잭션, 업서트 및 삭제와 같은 복잡한 작업을 지원함으로써 데이터 레이크를 더 동적이고 다재다능한 시스템으로 변환할 수 있습니다.

<div class="content-ad"></div>

데이터 카탈로그:

저희의 데이터 카탈로그 관리에는 비용 효율성, 다른 AWS 서비스와의 깊은 통합, 그리고 직관적인 메타데이터 관리 기능으로 인해 AWS Glue Catalog를 선택했습니다. AWS Glue Catalog는 중앙 메타데이터 저장소로 기능하며, 이를 통해 각종 AWS 서비스 간의 데이터 자산을 보다 쉽게 관리하고 접근할 수 있습니다. AWS Glue Crawler를 활용하여 S3에 저장된 데이터를 자동으로 발견하고 분류하여 데이터 카탈로그 테이블을 손쉽게 생성하고 업데이트할 수 있습니다.

하지만 AWS Glue Catalog는 운영 요구에 맞게 데이터 검색을 용이하게 하는 측면에서 제한이 있음을 인지하고 있습니다. 잘 통합되어 비용 효율적이지만 세련된 데이터 카탈로그의 세부 기능 중 일부를 지원하지 않습니다. 특히 대규모 데이터 작업에 필수적인 향상된 검색 및 발견 도구와 같은 기능을 지원하지 않습니다. 이는 모델링을 위해 다양한 데이터세트에 빠르게 액세스해야 하는 데이터 과학자, 비즈니스 결정에 신속한 통찰을 얻어야 하는 데이터 분석가, 그리고 철저한 데이터 탐색에 의존하여 포괄적인 보고서를 작성하는 비즈니스 인텔리전스 전문가를 포함한 여러 팀 멤버에 영향을 줄 수 있습니다. 앞으로는 저희 조직의 중요한 역할들의 요구를 충족시키기 위해 데이터 검색을 지원하는 더 편리하고 포괄적인 데이터 카탈로그 솔루션을 탐구할 계획입니다.

데이터 액세스 및 쿼리 엔진:

<div class="content-ad"></div>

AWS Athena는 주요 쿼리 엔진으로 사용되며 AWS Glue 카탈로그와 원활하게 통합됩니다. 이 간편한 설정을 통해 데이터 레이크를 효과적으로 쿼리할 수 있어 Athena는 우리 데이터 아키텍처의 중요한 구성 요소입니다. Athena를 사용하는 주요 장점 중 하나는 비용 효율성입니다. Athena는 쿼리 중 스캔된 데이터 양에 따라 요금이 부과되기 때문에 현재 우리의 쿼리는 과도한 데이터 양을 스캔하지 않아 비용을 상당히 낮게 유지할 수 있었습니다.

그러나 우리는 데이터 레이크 사용을 확대함에 따라(특히 애플리케이션 내 차트를 통한 직접 데이터 쿼리 통합이 예정된) Athena와 관련된 비용이 증가할 수 있다는 점을 알고 있습니다. 이러한 잠재적 시나리오에 대비하기 위해 Trino로 전환을 고려 중이며, 이는 EKS에서 실행되어 AWS Glue 메타스토어에 연결될 것입니다. Athena와 Trino 사이의 기본적인 유사성으로 인해 이 마이그레이션은 간단할 것으로 예상됩니다.

현재 Athena에서 두 가지 서로 다른 워크그룹을 활용하고 있습니다 - SQL 쿼리를 위한 하나와 Spark(Python) 연산을 위한 다른 하나입니다. 앞으로, 우리는 이러한 설정을 세분화하여 변환, 고객 분석 등과 같은 다양한 비즈니스 요구에 대해 별도의 워크그룹을 생성하여 운영 효율성과 비용 관리를 향상시킬 계획입니다.

데이터 거버넌스:

<div class="content-ad"></div>

AWS Lake Formation은 저희 데이터 거버넌스에 중요한 역할을 합니다. 레이크하우스 아키텍처에서 데이터 보안과 권한 관리를 크게 향상시킵니다. 이는 PHI 및 민감한 데이터를 다루는 데 핵심적인 엄격한 접근 제어를 시행하는 데 도움이 됩니다.

강력한 접근 제어를 위한 LF-Tags 구현: 데이터가 안전하게 액세스되고 엄격한 정책을 준수하는 데 필요한 접근 권한을 정교하게 제어하기 위해, 우리는 데이터베이스 및 테이블 수준에서 권한을 세밀하게 제어하기 위해 LF-Tags를 활용합니다. 우리의 태그 전략은 체계적으로 설계되어 있으며, 데이터베이스는 일반적으로 태그가 지정되며, 더 구체적인 요구 사항에 따라 테이블 수준에서 권한을 관리합니다. 우리가 사용하는 가능한 태그에는 다음과 같은 것들이 있습니다:

- 환경: dev, prod
- 부서: app, internal, devops, hr, customers, infra, sales, ds
- PHI: true
- 데이터 레이크 레이어: gold, silver, bronze
- 클라이언트 대면: true (데이터를 고객에게 노출할 수 있는지 여부를 나타냄)

각 데이터베이스와 테이블에 여러 태그를 적용하여 세밀한 역할 기반 접근 제어를 가능하게 합니다. 예를 들어, 우리 애플리케이션에서 데이터를 쿼리하는 고객을 위한 역할은 client_facing: true, data_lake_layer: gold, 그리고 environment: prod와 같은 태그 조합을 통해 액세스 권한을 부여받을 수 있습니다.

<div class="content-ad"></div>

최초에 AWS Lake Formation을 설정하는 것은 간단하지 않았습니다. 이 플랫폼은 강력하지만 직관적이지 않았고, 권한 행동을 우리의 거버넌스 요구에 맞게 조정하는 데 상당한 노력과 시간이 걸렸습니다. 이러한 도전을 극복하기 위해서는 가파른 학습 곡선이 필요했는데, 다양한 구성을 실제로 실험해야 했고, 우리가 필요로 하는 상세한 액세스 제어를 효과적으로 구현하고 관리하는 방법을 이해해야 했습니다.

![이미지](/assets/img/2024-05-27-NavigatingtheDataDelugeAJourneytoCraftingaSophisticatedLakehousePlatform_2.png)

데이터 수집:

우리는 단순하게 사용할 수 있고 기관 전체의 데이터를 수집해야 할 필요가 있는 미래의 요구를 예측하여 다양한 커넥터를 지원하는 플랫폼을 찾았습니다. 두 플랫폼인 Airbyte(오픈 소스 솔루션)와 Rivery(SaaS 솔루션)을 비교하는 POC를 진행한 후, 몇 가지 설득력있는 이유로 Airbyte를 선택했습니다.

<div class="content-ad"></div>

먼저, 저희의 결정은 데이터 양에 따라 청구되지 않는 비용 효율적인 솔루션에 더 기울였습니다. 저희는 증가하는 비용을 걱정하지 않고 자유롭게 데이터를 가져오길 선호했습니다. 게다가 Airbyte의 개발 도구는 특히 인상적이었습니다. 플랫폼의 Connector Builder SDK는 Connector Builder UI와 로우코드 커넥터 개발 환경이 모두 포함되어 있어 필요한 간편함과 유연성을 제공했습니다. 이 기능 덕분에 우리는 우리의 특정 요구에 맞게 데이터 커넥터를 쉽게 구축하고 맞춤화할 수 있었습니다.

Airbyte는 대규모이자 활발한 커뮤니티를 자랑하지만 제품에 몇 가지 어려움을 겪었습니다. 처음에는 데이터 수집 속도가 느렸습니다. 특히 PostgreSQL에서 20GB를 2일 이상으로 전송하는 데 시간이 걸렸습니다. 먼저 AWS-data-lake 목적지를 사용해 보았지만 느리고 지속적인 동기화를 지원하지 않았습니다. 이 문제를 해결하기 위해 이 문제를 고치기위한 pull request를 제출했지만 3개월이 걸렸습니다. 더 나은 해결책을 찾기위해 여러 다른 목적지를 실험해 보았습니다. Parquet을 사용할 때 타임스탬프가 struct로 형식화되는 짜증나는 문제가 있는 S3 목적지가 있었습니다. 이 구체적인 문제는 2년째 해결되지 않은 상태로 있는데, 이는 지원 측면에서 중요한 차이점을 보여줍니다. 유망한 Iceberg 목적지는 AWS Glue Catalog를 지원하지 않았습니다. 그래서 AWS-Glue 목적지를 시도했지만 JSON 출력만 지원해서 비효율적이라는 것을 발견했습니다.

최종적으로 이러한 옵션 중 어느 것도 우리의 요구 사항을 완전히 충족시키지 못했기 때문에, 우리는 자체적으로 사용자 정의 AWS-data-lake 목적지를 개발하기로 결정했습니다. 우리는 원래 코드를 복제하고 우리의 요구 사항에 맞게 특별히 맞춤화하여 데이터 수집 프로세스를 크게 향상시킨 맞춤형 솔루션을 만들었습니다.

이러한 어려움에도 불구하고 Airbyte는 효과적으로 우리의 요구 사항을 모두 충족시켰습니다. 오늘날, Airbyte를 사용하여 약 15가지 다른 데이터 소스를 데이터 레이크에 성공적으로 통합했으며, 데이터 수집 능력과 전체 데이터 전략을 크게 향상시켰습니다.

<div class="content-ad"></div>

데이터 처리:

저희의 데이터 처리 워크플로우는 dbt Core에 의해 강력하게 주도되며, ELT (추출, 로드, 변환) 접근 방식을 사용합니다. 모든 데이터가 브론즈층에서 시작되어 점진적으로 실버층과 골드층으로 변환됩니다.

저희는 dbt Athena 어댑터를 사용하고 있으며, SQL 및 Python (PySpark) 모델을 지원합니다. 이 다양성은 더 복잡한 변환을 효과적으로 처리하는 데 중요합니다. dbt-Athena 어댑터는 활기찬 커뮤니티의 혜택을 받고 있으며, 정기적인 업데이트로 계속 발전하고 있습니다. 처음에는 Python Athena 통합을 채택하는 데 약간 주저했었는데, 그 당시의 혁신성과 제한된 추적 레코드 때문이었습니다. 그러나 철저한 테스트와 유효성 검사를 거친 후에는 어떠한 문제도 발생하지 않았고, 안정성과 효율성을 확인하며 우리의 프로덕션 환경에 성공적으로 구현했습니다.

dbt에서 테이블 속성을 구성하는 것은 직관적이고 유연하며, 우리의 데이터 관리 능력을 크게 향상시킵니다. 예를 들어, 증분 테이블을 널리 사용하는데, 이는 새 데이터 또는 변경된 데이터만 효율적으로 가져오는 데 중요합니다. Iceberg 테이블 형식을 활용하여 병합 증분 전략을 채택하면 데이터세트를 중복 처리 없이 원활하게 업데이트할 수 있습니다. 또한, dbt에서 데이터 파티션을 관리하는 것도 간단해졌습니다. 파티션은 테이블 속성 내에서 직접 선언할 수 있습니다. 아래는 우리의 골드층 테이블에 대한 테이블 속성 구성 예시입니다. 우리가 재료화 전략, 파티셔닝 및 데이터 형식을 어떻게 지정하는지 보여주고 있습니다:

<div class="content-ad"></div>

{ config(
materialized='incremental',
incremental_strategy='merge',
unique_key=['session_id'],
partitioned_by=['day'],
table_type='iceberg',
format='parquet'
) }

우리는 dbt에 대해 매우 만족하고 있습니다; 이 도구는 우리의 데이터 변환을 어떻게 관리하는지에 혁명을 일으켰습니다. 이 도구는 견고한 버전 관리, 코드의 재사용성 및 데이터 흐름의 명확한 문서화를 제공하여 복잡한 변환 작업을 관리하고 레이크하우스 아키텍처 전반에서 데이터 무결성을 유지하는 것을 크게 간소화합니다.

dbt와의 성공을 토대로, 우리는 현재 데이터 관리 역량을 더욱 강화하기 위해 새로운 도구를 탐색 중입니다. Montara.io가 강력한 기능 세트를 제공하여 워크플로우를 최적화하는 우리의 dbt Git 리포지토리와 직접 통합되었습니다. Montara는 자동 CI/CD, 팀원들이 dbt 전문 지식이 적은 경우에도 모델을 작성하고 테스트할 수 있는 사용자 친화적인 UI를 제공하며 데이터 계보 표시, 데이터 카탈로그 및 관찰 가능성과 같은 가치 있는 도구를 제공합니다.

Montara에 감명을 받았습니다; 이 도구는 우리의 dbt 워크플로우를 크게 간소화시켜 팀 전체에서 데이터 변환을 보다 접근 가능하고 관리하기 쉽게 만듭니다. 이 도구가 비교적 새로운 것이며 여전히 발전 중이므로 가끔씩 일부 문제와 기능의 빈틈을 겪기도 하지만, 우리의 경험은 전반적으로 매우 긍정적입니다. Montara 팀은 우수한 지원을 제공하며 우리와 긴밀히 협력하여 발생하는 어려움을 신속하게 해결하고 계속되는 제품 향상에 우리의 피드백을 통합합니다. 이 협력적인 접근은 문제를 신속하게 해결할 뿐만 아니라 Montara.io가 우리의 데이터 인프라 요구와 완벽하게 일치하도록 발전하도록 보장합니다.

<div class="content-ad"></div>

분석 및 BI 도구:

Apache Superset은 저희가 선택한 분석 및 비즈니스 인텔리전스 도구로, 오픈 소스와 강력한 데이터 시각화 능력으로 유명합니다. 다른 BI 도구와 비교했을 때 유연성과 비용 효율성을 강점으로 삼아 Superset을 선택했습니다. 다양한 사용자 정의 옵션과 사용자 친화적 인터페이스를 통해 우리 팀은 대시보드와 보고서를 자신들의 필요에 맞게 맞춤화할 수 있으며, 특히 Athena를 주 데이터 원본으로 사용하는 저희 독특한 분석 환경에 특히 적합합니다.

데이터 분석가들은 저희 회사의 다양한 부서를 위한 대시보드를 만들기 위해 주로 Superset을 사용합니다. 더불어, Superset의 기능을 활용하여 차트를 애플리케이션에 직접 임베드하여 고객에게 유용한 통찰을 제공합니다.

현재, 일부 차트는 브론즈 계층의 데이터에 직접 접근하여 실시간으로 변환 작업을 수행합니다. 그러나 더 이상 원시 데이터 쿼리의 부하를 줄이기 위해 이 접근 방식을 수정 중이며, 최종적으로 LF-tags를 사용하여 브론즈 계층의 액세스를 제한할 계획입니다.

<div class="content-ad"></div>

Superset은 대시보딩에 편리하고 효과적인 도구라고 생각하지만, 시간이 지남에 따라 생성된 데이터셋이 증가하면 어느 정도 어수석해질 수 있습니다. Superset의 각 데이터셋은 개별적으로 구성되어 있어 대시보드의 수와 복잡성이 증가함에 따라 중복과 관리 도전이 발생할 수 있습니다. 그럼에도 불구하고, 이러한 어려움에도 불구하고, Superset은 우리의 요구 사항을 잘 충족시켜 주며 조직 전반에서 데이터를 시각화하고 상호 작용하는 다재다능한 플랫폼을 제공합니다.

오케스트레이션과 워크플로우 관리

Apache Airflow는 데이터 환경 내에서 워크플로우를 조정하고 관리하는 데 중요한 역할을 합니다. 오픈 소스 도구인 Airflow는 유연성, 확장성, 그리고 강력한 커뮤니티 지원을 제공하여 우리의 운영 요구에 필수적인 요소를 제공합니다. Airflow를 활용하여 모든 데이터 파이프라인이 데이터 레이크로 정확하게 트리거되어 데이터의 신선도와 신뢰성을 유지하도록 합니다.

현재, 저희는 저희 레이크하우스 운영에 필수적인 세 가지 주요 DAGs (방향이 있는 비순환 그래프)를 관리하고 있습니다. 첫 번째 DAG는 AirbyteOperator를 활용하여 동기화를 위해 필요한 모든 업무를 트리거하여 브론즈 레이어에 데이터를 효율적으로 삽입하는 작업을 담당합니다. 두 번째 DAG는 dbt 변환을 실행하여 데이터를 처리하고 실버 및 골드 레이어로 옮기는 업무를 담당합니다. 세 번째 DAG는 전체 워크플로를 감독하며 데이터 처리의 원활한 흐름을 유지하기 위해 순차적으로 삽입 DAG 및 이후에 dbt DAG를 트리거합니다.

<div class="content-ad"></div>

또한, 이러한 워크플로우 내에 Slack 알림을 통합했습니다. 이 설정은 DAG(작업 방향성 비순환 그래프) 실패 시 실시간 알림을 제공하여 지속적인 운영 및 데이터 무결성 유지를 위해 즉각적인 모니터링과 대응이 가능하게 합니다.

## 결론: 전략적 이점을 위한 데이터 활용

마지막으로, 데이터 레이크하우스 아키텍처를 구축하고 정제하는 우리의 여정은 도전적이고 보람찼습니다. 우리는 데이터 관리 역량을 혁신한 여러 도구와 기술을 성공적으로 통합하여, 다양한 데이터를 통합하여 동적 의사 결정을 지원하는 견고한 분석 엔진으로 변화시켰습니다. Apache Superset, AWS S3, AWS Glue Catalog, Apache Airflow, 그리고 dbt를 활용한 우리의 사용은 복잡한 데이터 과제에 대응하기 위해 첨단 기술을 채용하는 데 드러난 우리의 의지를 보여줍니다.

이러한 도구들은 우리의 운영 효율을 향상시키는데 그치지 않고 회사 전반에서 더 통찰력있는 데이터 분석과 보고의 길을 열었습니다. 우리의 데이터 인프라를 계속 발전시키면서, 우리는 데이터 능력을 더욱 향상시킬 수 있는 새로운 기술과 방법을 탐구하는 데 헌신하겠습니다.

<div class="content-ad"></div>

저는 비슷한 여정을 걸어가고 있는 독자들로부터의 피드백과 질문을 환영합니다. LinkedIn에서 저와 연락하셔서 더 자세한 토론을 나누거나 아이디어를 교환해 주세요.
