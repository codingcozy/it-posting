---
title: "RAG 평가 향상하기 FaaF와 ARES의 시너지 효과 및 구조화된 출력 방식 사용"
description: ""
coverImage: "/assets/img/2024-06-23-ElevatingRAGEvaluationTheSynergyofFaaFandARESthroughStructuredOutput_0.png"
date: 2024-06-23 18:43
ogImage:
  url: /assets/img/2024-06-23-ElevatingRAGEvaluationTheSynergyofFaaFandARESthroughStructuredOutput_0.png
tag: Tech
originalTitle: "Elevating RAG Evaluation: The Synergy of FaaF and ARES through Structured Output"
link: "https://medium.com/ai-in-plain-english/elevating-rag-evaluation-the-synergy-of-faaf-and-ares-through-structured-output-be2e2556dfdd"
isUpdated: true
---

인공 지능 소프트웨어가 이 기사의 텍스트 문법, 흐름 및 가독성을 향상시키는 데 사용되었습니다.

Retrieval Augmented Generation (RAG) 시스템은 자연어 처리 (NLP)에서 유망한 접근 방식으로 나타났으며 정보 검색과 언어 생성 기술을 통합하여 생성된 응답의 품질과 관련성을 향상시키는 것을 목표로 합니다.

이러한 시스템은 질문 응답, 대화 시스템 및 콘텐츠 생성을 포함한 다양한 응용 프로그램에서 상당한 잠재력을 보여주었습니다. RAG 시스템은 대규모 지식 베이스에서 관련 정보에 액세스하기 위해 검색의 힘을 활용하고 언어 모델의 생성 능력과 결합하여 더 정확하고 맥락적으로 관련성이 높고 정보를 제공하는 응답을 생성할 수 있습니다.

그러나 RAG 시스템의 성능을 평가하는 것은 특히 원인 재현력을 평가하는 데 독특한 도전을 제기합니다. 왜냐하면 소스 자료에서 관련 정보를 검색하고 정확하게 전달하는 능력을 평가하는 것이 중요하기 때문입니다.

<div class="content-ad"></div>

사실적 기억은 RAG 시스템 성능에 있어 중요한 측면이며, 생성된 응답의 신뢰성과 신뢰도에 직접적인 영향을 미칩니다. 관련 사실을 부정확하게 가져오거나 불완전하게 가져오면 잘못된 결과물이나 오도하는 결과물로 이어질 수 있어 시스템의 유용성과 신뢰성이 떨어집니다.

RAG 시스템에 대한 전통적 평가 방법은 종종 인간 주석이나 휴리스틱 프롬프트를 의존하는데, 이는 여러 가지 제약사항이 있습니다. 인간 주석은 유용한 통찰력을 제공하지만, 시간이 많이 소요되며 비용이 많이 들며 개인적 편향과 불일치가 있을 수 있습니다.

반면에 휴리스틱 프롬프트는 입력 공간의 다양한 변화와 미묘한 차이를 충분히 포착하지 못할 수 있어 시스템 능력의 불완전한 평가로 이어질 수 있습니다.

게다가 이러한 방법들은 일반적으로 대규모 및 자동화된 평가가 필요한 현실 세계에서의 실용성과 신뢰성이 부족할 수 있습니다.

<div class="content-ad"></div>

이러한 도전에 대응하고 RAG 시스템을 더 효과적으로 평가하기 위해 연구자들은 이를 위해 특별히 설계된 새로운 평가 프레임워크를 제안해왔습니다. 최근 논문에서 주목을 받고 있는 두 가지 중요한 접근 방식은 팩트를 함수로써 (FaaF)와 ARES (자동 검색 보완 생성 평가 시스템)입니다. 두 프레임워크 모두 RAG 시스템의 보다 효율적이고 신뢰할 수 있으며 통찰력 있는 평가를 제공하려고 하지만 방법론과 초점에서 차이가 있습니다.

카트라니디스 등이 제안한 팩트를 함수로써(FaaF)는 RAG 시스템에 대한 사실 확인 및 사실 회상 평가를 위한 새로운 접근 방식을 제안합니다. FaaF 뒤에 있는 핵심 아이디어는 JSON 객체를 사용하여 사실을 호출 가능한 함수로 나타내어 전통적인 프롬프트 기반 방법에 비해 보다 구조화되고 효율적인 다중 사실 평가를 가능하게 합니다. 구조화된 표현과 프로그래밍 언어와 같은 인터페이스의 힘을 활용함으로써 FaaF는 RAG 평가의 해석 가능성, 모듈성 및 확장성을 향상시키기 위해 노력합니다.

반면에 사드-팔콘 등이 제안한 ARES는 RAG 평가에 보다 포괄적인 접근 방식을 취하며, 문맥 상관성, 답변 충실도 및 답변 관련성과 같은 여러 차원을 고려합니다. ARES는 대규모 언어 모델(Large Language Models, LLMs)을 사용하여 합성 쿼리-패스지-답변 쌍을 생성하고 이를 통해 RAG 구성 요소를 평가하기 위해 LLM 판단자를 세밀하게 조정합니다.

그것은 기계 생성 및 인간 주석 데이터를 활용하여 신뢰 구간 및 순위를 위한 사람 선호도 확증 세트를 활용하는 예측 기반 추론(Prediction-Powered Inference, PPI)를 채택합니다.

<div class="content-ad"></div>

FaaF와 ARES는 접근 방식과 초점에서 차이가 있지만, 둘 다 RAG 평가에서 구조화된 출력의 중요성을 강조합니다. JSON 표현과 프로그래밍 언어와 비슷한 인터페이스를 사용하여 이러한 프레임워크는 일반 텍스트 프롬프트보다 신뢰성이 더 높고 모듈식이며 확장 가능한 평가를 가능하게 합니다.

RAG 평가에서 구조화된 출력의 이점은 Pydantic과 같은 데이터 유효성 검사를 위한 라이브러리 사용과 유사한데요. Python에서 데이터 유효성 검사를 위해 Pydantic과 같은 라이브러리를 사용하는 것과 유사하게, 유형 안전성, 자동 변환, 사용자 정의 유효성 로직, 오류 처리 등의 장점을 제공합니다.

# Facts as a Function (FaaF)이란?

<div class="content-ad"></div>

FaaF는 Katranidis 등이 2024년에 발표한 "RAG 시스템의 평가를 위한 함수로서의 사실" 논문에서 소개된, 팩트 검증 및 사실 회상 평가에 대한 혁신적인 접근 방식입니다.

FaaF의 핵심 아이디어는 사실을 JSON 객체를 사용하여 호출 가능한 함수로 표현함으로써, 전통적인 프롬프트 기반 방법과 비교하여 보다 구조화되고 효율적인 다중 사실 평가를 가능케 한다는 것입니다.

JSON 대 프롬프트: FaaF는 언어 모델(LM)에게 사실을 전달할 때 자연어 프롬프트 대신 JSON 표현을 활용합니다. 이 접근 방식을 통해 LM은 함수 변수 간의 독립성을 학습하고, 변수 메타데이터와 타입 힌트를 통해 더 나은 제약을 제공하며, 예상 출력 형식에 대한 준수를 위한 가파른 경사를 가능하게 합니다. JSON을 사용함으로써, FaaF는 LM이 사실과 그 관계들의 구조화된 성격을 더 잘 파악할 수 있도록 하고자 합니다.

텍스트 생성물을 단위로: FaaF는 관련된 모든 사실을 한 개체 함수로 캡슐화하여 생성된 텍스트를 단일 단위로 취급합니다. 이를 통해 각 사실을 개별적으로 판단하는 대신 단일 LM 호출로 다중 사실을 평가함으로써 효율성을 크게 향상시킵니다. 생성된 텍스트를 전체적으로 고려함으로써, FaaF는 RAG 시스템의 출력물의 전반적인 사실 일관성과 일관성을 포착할 수 있습니다.

<div class="content-ad"></div>

아웃소싱 판단: FaaF는 LM(Language Model)로부터 일부 결정론적 판단을 아웃소싱하는 개념을 도입합니다. 예를 들어, 구문 분석 함수는 LM 응답 범위를 이진 True/False 형식으로 매핑하여 LM이 명시적으로 진실 여부를 판단하는 부담을 줄입니다. 이 관심 분리를 통해 더 유연하고 해석 가능한 평가가 가능해지며, LM은 불확실성을 표현할 수 있으면서 최종 결정은 사전 정의된 함수 논리에 의해 이루어집니다.

FaaF는 이러한 아이디어를 구체화하여 사실 명세서 목록을 JSON 객체로 매핑하는 과정을 정의합니다. LM 평가자(LMeval)는 입력 텍스트를 기반으로 이러한 필드를 채우는 역할을 하며, 구문 분석 함수는 LMeval 출력을 처리하여 사실을 확인합니다. 이 구조화된 방식은 FaaF가 RAG 시스템에서 사실 회상의 보다 명확하고 효율적인 평가를 제공할 수 있도록 합니다.

# FaaF와 ARES 비교:

ARES(Automated Retrieval-Augmented Generation Evaluation System)는 RAG 시스템을 평가하기 위한 또 다른 주목할만한 프레임워크로, Saad-Falcon 및 그 동료가 "ARES: An Automated Evaluation Framework for Retrieval-Augmented Generation Systems" 논문에서 제안했습니다. FaaF와 ARES 모두 RAG 평가를 개선하고자 하지만, 두 접근 방식과 초점에 차이가 있습니다.

<div class="content-ad"></div>

## 평가 차원:

- FaaF는 사실적 기억에 중점을 둡니다 — 필요한 정보가 RAG 응답에서 정확하게 검색되고 전달되는 정도를 측정합니다. 이는 RAG 시스템이 소스 자료에서 관련된 사실을 통합하고 전달하는 능력을 명확히 평가하기 위한 목적을 갖고 있습니다.
- 반면에 ARES는 RAG 시스템을 context relevance(맥락 중요성), answer faithfulness(답변 충실도), answer relevance(답변 관련성) 세 가지 차원에서 평가합니다. 이는 단순히 사실적 정확성뿐만 아니라 생성된 응답의 적합성과 일관성을 고려하는 종합적인 접근을 취합니다. 주어진 맥락 및 질문과 관련하여 생성된 응답의 확실성도 고려합니다.

## 접근 방식:

- FaaF는 JSON 객체를 사용하여 사실을 호출 가능한 함수로 나타내고 입력 텍스트를 기반으로 함수 필드를 채우기 위해 LM 평가자를 사용합니다. 구문 분석 함수는 LM 평가 출력을 처리하여 사실을 확인하며, 구조화되고 모듈화된 평가 프로세스를 가능하게 합니다.
- 반면에 ARES는 LLMs를 사용하여 합성 쿼리-담화-답변 쌍을 생성하고, 이러한 합성 데이터에서 LLM 평가자를 세밀하게 조정하여 RAG 구성 요소를 평가합니다. 이는 기계 생성 및 인간 주석된 데이터를 활용하여 확신 구간과 순위를 위해 인간 선호 검증 세트와 함께 예측을 지원하는 추론(PPI)를 수행합니다.

<div class="content-ad"></div>

## 데이터 효율성:

- FaaF는 초기 데이터셋(예: WikiEval) 이상의 추가 인간 주석이 필요하지 않아 더 많은 데이터 효율성을 가지며 구현하기 쉽습니다.
- ARES는 선호도 유효성 검사 세트를 위해 작은 인간 주석 집합(150~300 데이터 포인트)이 필요하며, 전문 지식이 필요한 특수 도메인에서 특히 도전적이고 자원이 소모될 수 있습니다.

## 일반화 능력:

- FaaF는 기본적으로 단일 데이터셋(WikiEval)에서 테스트되었으며 사실적 기억 평가에 중점을 두고 있습니다. 유망하지만 다른 데이터셋 및 평가 차원으로의 일반화 가능성은 아직 탐구되지 않았습니다.
- ARES는 KILT, SuperGLUE 및 AIS 벤치마크의 여덟 데이터셋에서 강력한 성능을 보여주며 RAG 시스템의 여러 차원을 평가합니다. 이는 다양한 도메인 및 평가 기준에 걸쳐 일반화 가능성과 견고성이 높다는 것을 시사합니다.

<div class="content-ad"></div>

# FaaF 및 ARES의 상보적 성격:

FaaF와 ARES는 각각의 방법 및 초점에 차이가 있지만, 그들이 상호 배타적이 아니라 오히려 RAG 시스템을 평가하는 보완적인 프레임워크임을 인식하는 것이 중요합니다. 각 프레임워크는 강점과 한계가 있으며, 이들을 결합하여 연구자와 프랙티셔너들은 자신들의 RAG 모델의 성능과 한계에 대한 보다 포괄적인 이해를 얻을 수 있습니다.

FaaF는 사실 기억에 대한 명시적 초점과 사실 표현에 대한 구조화된 JSON 기반 방식으로, RAG의 결과물의 사실적 정확성을 평가하기 위한 효율적이고 해석 가능한 프레임워크로 만들어졌습니다. 단일 LM 호출로 여러 사실을 평가하고, 결정론적 판단을 구문 논리에 위탁함으로써, 보다 간편하고 모듈화된 평가 과정이 가능해졌습니다.

그 반면, ARES는 맥락 관련성, 답변 충실도 및 답변 관련성을 고려한 다차원 평가로, RAG 성능에 대한 더 포괄적인 평가를 제공합니다. 합성 데이터 생성 및 세밀하게 조정된 LLM 판단자들의 사용은 보다 확장 가능하고 자동화된 평가 프로세스를 가능케 하며, 인간의 선호도 확인 세트의 포함은 평가 지표를 인간의 판단과 일치시킴을 보장합니다.

<div class="content-ad"></div>

FaaF와 ARES를 함께 사용하면 두 프레임워크의 강점을 활용하여 RAG 시스템을 보다 깊이 이해할 수 있습니다. 예를 들어, FaaF를 사용하여 RAG 출력물의 사실적 기억을 빠르게 평가하여 검색된 정보의 빈틈이나 모순을 식별할 수 있습니다. 이후에 ARES를 사용하여 보다 포괄적인 평가를 실시할 수 있는데, ARES는 생성된 응답의 문맥적 적합성, 충실성 및 전반적인 품질에 대한 통찰력을 제공할 수 있습니다.

또한, FaaF와 ARES의 보완적 성격은 통합 및 확장 가능성에도 이어집니다. FaaF의 구조화된 JSON 기반 출력물은 ARES 평가 파이프라인에 쉽게 통합되어 RAG 평가의 넓은 맥락 내에서 사실적 기억을 보다 세밀하게 평가할 수 있도록 합니다. 마찬가지로, ARES에서 사용되는 합성 데이터 생성 및 LLM 판단 세밀 조정 방법은 FaaF의 효율성과 일반화 가능성을 향상시키기 위해 적용될 수 있어서, 더 넓은 데이터셋과 도메인에 적용 가능하도록 만듭니다.

# 인공지능 언어 앱에서 구조화된 출력의 중요성 :

구조화된 출력은 Facts as a Function (FaaF) 및 ARES 프레임워크에서 강조하는 바와 같이, 검색 증강 생성 (RAG) 시스템의 평가에서 중요한 역할을 합니다. JSON 객체와 프로그래밍 언어와 유사한 인터페이스와 같은 구조화된 표현을 사용함으로써, 이러한 접근 방법은 전통적인 일반 텍스트 프롬프트와 비교하여 더 신뢰성이 있고 모듈식이며 확장 가능한 평가를 가능케 합니다. RAG 평가에서 구조화된 출력의 장점은 다양하며, 이는 평가 프로세스의 품질과 효율성을 현저히 향상시킬 수 있습니다.

<div class="content-ad"></div>

신뢰성과 일관성: 구조화된 출력은 사실, 쿼리 및 생성된 응답을 나타내는 잘 정의된 형식을 강제합니다. 일관된 구조를 준수함으로써 FaaF 및 ARES와 같은 평가 프레임워크는 평가 프로세스가 신뢰성 있고 재현 가능하다고 보장할 수 있습니다. 구조화된 형식은 모호성을 제거하고 자유 형식의 텍스트 표현에서 발생할 수 있는 오해 또는 일관성 부족의 위험을 줄입니다. 이 일관성은 다양한 RAG 시스템 간 보다 정확한 비교를 가능하게 하며 표준화된 평가 기준의 개발을 촉진합니다.

조기 문제 감지: 구조화된 출력은 생성된 응답의 문제와 불일치를 조기에 감지할 수 있습니다. 출력의 구조 및 데이터 유형을 미리 정의된 스키마나 모델에 대해 유효성 검사함으로써 평가 프레임워크는 기대 형식에서의 어떠한 이탈도 빠르게 식별할 수 있습니다. 이 조기 감지 메커니즘은 평가 파이프라인에서 오류(예: 누락된 필드 또는 잘못된 필드)가 더 이상 전파되는 것을 방지합니다. 이러한 문제를 조기에 발견함으로써 연구원과 실무자들은 신속히 처리하여 디버깅 프로세스에서 시간과 노력을 절약할 수 있습니다.

모듈화 및 조립성: 구조화된 출력은 RAG 평가에서 모듈화 및 조립성을 촉진합니다. 평가 프로세스를 사실 기억, 문맥 관련성 또는 답변 성실성과 같은 특정 측면에 집중하는 별도 구성 요소로 분해함으로써 구조화된 출력은 RAG 시스템 성능에 대한 보다 세분화된 목표적인 평가를 가능하게 합니다. 이 모듈화 접근법은 연구자들이 개별 구성 요소를 독립적으로 평가할 수 있도록 하여 시스템의 특정 영역에서의 강점과 약점을 식별하기 쉽게 합니다. 뿐만 아니라 구조화된 출력의 조립성은 여러 평가 지표나 프레임워크를 결합하여 더 포괄적인 RAG 성능 평가를 제공하는 평가 파이프라인을 생성할 수 있습니다.

확장성과 적응성: 구조화된 출력은 RAG 평가 프레임워크의 확장성과 적응성을 촉진합니다. 잘 정의된 인터페이스와 데이터 모델을 활용함으로써 연구자들은 쉽게 새로운 평가 지표, 데이터 집합 또는 도메인별 요구 사항을 통합하여 기존 평가 프레임워크를 확장할 수 있습니다. 출력의 구조화된 성격은 핵심 평가 프레임워크에 중대한 수정을 요구하지 않고 추가 구성 요소나 모듈을 원활하게 통합할 수 있습니다. 이 확장성은 연구자들이 평가 프로세스를 자신의 특정 요구에 맞게 맞추고 변화하는 연구 문제와 응용 분야에 적응할 수 있도록 합니다.

<div class="content-ad"></div>

데이터 유효성 검증 라이브러리와의 통합: RAG 평가에서 구조화된 출력의 이점은 Python의 Pydantic과 같은 데이터 유효성 검증 라이브러리가 제공하는 것과 유사합니다. Pydantic을 사용하면 Python 유형 어노테이션을 활용하여 데이터 모델 또는 스키마를 정의하여 데이터의 구조와 유형을 유효성 검사할 수 있습니다. 유형 안정성, 자동 유형 변환, 사용자 정의 유효성 검사 논리, 정보를 제공하는 오류 메시지 등의 장점을 제공합니다. 구조화된 출력을 데이터 유효성 검증 라이브러리와 통합함으로써 RAG 평가 프레임워크는 이러한 강력한 기능을 활용하여 평가 데이터의 무결성과 일관성을 보장할 수 있습니다.

예를 들어, 입력 쿼리, 검색된 단락, 생성된 응답에 대한 Pydantic 모델을 정의함으로써, 평가 프레임워크는 지정된 스키마에 대해 데이터를 자동으로 유효성 검사할 수 있습니다. 이 유효성 검사 과정은 유형 불일치, 필드 손실 또는 잘못된 값 등을 잡아내어 데이터 품질 문제에 대한 조기 피드백을 제공합니다. 또한, Pydantic의 사용자 정의 유효성 검사 논리 지원을 통해 연구자들은 도메인별 제한 사항이나 규칙을 정의하여 평가 프로세스를 더 개선할 수 있습니다.

명확한 오류 메시지 및 디버깅: 구조화된 출력은 Pydantic과 같은 데이터 유효성 검증 라이브러리와 함께 사용될 때 평가 과정 중 문제가 감지될 때 명확하고 유익한 오류 메시지를 생성할 수 있습니다. 이러한 오류 메시지는 문제의 특정 위치와 성격을 정확히 지정하여 연구자들이 RAG 시스템이나 평가 파이프라인 자체의 문제를 식별하고 디버깅하기 쉽게 만듭니다. 출력의 구조적 특성은 더 정확한 오류 보고를 가능하게 하여 문제 해결에 필요한 시간과 노력을 줄이고 RAG 시스템 개발 및 정제의 빠른 반복 주기를 가능하게 합니다.

상호 운용성 및 프레임워크 간 비교: 구조화된 출력은 RAG 평가에서 상호 운용성을 증진시키고 프레임워크 간 비교를 용이하게 합니다. 공통 구조화된 형식을 채택함으로써 다른 평가 프레임워크는 데이터와 결과를 더 쉽게 교환할 수 있습니다. 이 상호 운용성은 연구자들이 여러 프레임워크에서 얻은 통찰력을 결합하여 각 접근 방식의 장점을 활용하여 RAG 시스템 성능에 대한 더 포괄적인 이해를 얻을 수 있도록 합니다. 또한, 구조화된 출력은 다른 평가 프레임워크 간 직접적인 비교를 가능하게 하여 연구 커뮤니티 내에서 협력과 지식 공유를 촉진합니다.

<div class="content-ad"></div>

다른 도구 및 워크플로와 통합: 구조화된 출력은 RAG 평가 프레임워크를 NLP 파이프라인의 다른 도구 및 워크플로와 완벽하게 통합할 수 있도록 합니다. JSON과 같은 구조화된 형식으로 평가 데이터를 표현함으로써, 평가 프레임워크는 데이터 처리 라이브러리, 시각화 도구 및 보고 시스템과 쉽게 상호 작용할 수 있습니다. 이 통합 기능은 평가 프로세스를 간소화하고 데이터 준비, 모델 학습, 평가 및 결과 분석을 포함하는 최종 결과 워크플로를 만들 수 있게 합니다. 이러한 출력의 구조화된 성격은 자동화와 재현성을 용이하게 하여 연구자가 견고하고 효율적인 평가 파이프라인을 구축할 수 있도록 합니다.

# 결론:

RAG 평가에서 구조화된 출력의 중요성을 과소 평가할 수 없습니다. JSON 객체 및 프로그래밍 언어와 유사한 인터페이스와 같은 구조화된 표현을 채택함으로써, FaaF 및 ARES와 같은 평가 프레임워크는 일반 텍스트 프롬프트 대비 보다 신뢰할 수 있고 모듈식이며 확장 가능한 평가를 가능하게 합니다. 구조화된 출력의 장점은 다재다능하며 초기 문제 발견 및 모듈화부터 확장성 및 Pydantic와 같은 데이터 유효성 검사 라이브러리와의 통합까지 다양합니다.

구조화된 출력은 일관성을 촉진하고 모호성을 줄이며 표준화된 평가 기준의 작성을 가능하게 합니다. 개별 RAG 구성 요소의 타겟팅된 평가를 허용하며, 새로운 도메인 및 요구 사항으로 평가 프레임워크의 확장과 적응을 용이하게 하며, 효과적인 디버깅을 위한 명확한 오류 메시지를 생성합니다. 더불어, 구조화된 출력은 상호 운용성을 촉진하며, 프레임워크 간 비교를 가능하게 하며, NLP 파이프라인의 다른 도구 및 워크플로와 원활하게 통합할 수 있습니다.

<div class="content-ad"></div>

`Retrieval Augmented Generation` 분야가 계속 발전함에 따라 평가 프레임워크에서 구조화된 출력물의 채택은 최신 기술의 발전에 중요한 역할을 할 것입니다. 구조화된 표현과 데이터 유효성 검사 라이브러리의 이점을 활용하면 연구원과 실무자는 보다 견고하고 신뢰할 수 있으며 통찰력있는 평가 방법론을 개발할 수 있습니다. 결과적으로, 더 효과적이고 신뢰할 수 있는 RAG 시스템을 만들어 다양한 자연어 처리 응용 프로그램 및 그 이상을 혁신할 수 있습니다.

# 친근한 언어로 설명 🚀

In Plain English 커뮤니티의 일원이 되어 주셔서 감사합니다! 마지막으로:

- 작성자를 좋아요하고 팔로우 하세요 👏
- 팔로우하기: X | LinkedIn | YouTube | Discord | Newsletter
- 다른 플랫폼 방문하기: Stackademic | CoFeed | Venture | Cubed
- PlainEnglish.io에서 더 많은 콘텐츠 확인하기
