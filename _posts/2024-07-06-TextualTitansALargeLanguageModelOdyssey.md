---
title: "언어 모델의 진화 대형 언어 모델 오디세이"
description: ""
coverImage: "/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_0.png"
date: 2024-07-06 03:45
ogImage:
  url: /assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_0.png
tag: Tech
originalTitle: "Textual Titans: A Large Language Model Odyssey"
link: "https://medium.com/walmartglobaltech/textual-titans-a-large-language-model-odyssey-d36eab1e2743"
isUpdated: true
---

지금 이제 인공지능이 전하는 메시지가 허구적인 캐릭터라고 해도, 그게 바로 요즘 AI가 시도하는 것 아닐까요? 재밌는 사실을 알고 싶나요? 위 이미지도 AI가 생성했다는 걸요.

자연어 처리(NLP)와 언어 모델은 소매 및 전자상거래를 혁신하는 데 중요한 역할을 합니다. 이러한 기술들은 개인 맞춤형 제품 추천, 고객 서비스용 챗봇, 고객 리뷰의 감성 분석, 효율적인 검색 알고리즘 구현을 가능하게 합니다. NLP는 거대한 양의 텍스트 데이터를 분석함으로써 소매업체가 고객 선호도를 이해하고 트렌드를 예측하며 가격 전략을 최적화하는 데 도움을 줍니다. 언어 모델은 맞춤형 응답을 제공하고 사용자 경험을 향상시킴으로써 고객 상호작용을 향상시킵니다. 게다가 NLP는 사기 탐지, 재고 관리 및 공급망 최적화에도 도움이 됩니다. 요컨대, NLP와 언어 모델을 활용하면 소매업체가 경쟁적 전자상거래 환경에서 고객 만족도를 향상시키고 영업 활동을 최적화함으로써 수익 성장을 이끌어낼 수 있습니다.

<div class="content-ad"></div>

## 여명

인공지능 학습(Generative AI)은 기존 기계 학습의 하위 개념이며, 인공지능 학습 모델은 인간들이 처음에 생성한 대규모 데이터셋에서 통계적 패턴을 찾아 이러한 능력을 학습했습니다. 생성 인공지능 모델은 텍스트, 이미지, 음악, 심지어 음성과 같은 다양한 출력물을 생성할 수 있습니다. 대형 언어 모델은 생성 인공지능의 한 종류로, 특히 두드러집니다. 이 모델들은 방대한 양의 텍스트 데이터로 교육을 받고 입력을 기반으로 사람과 유사한 텍스트를 생성할 수 있습니다.

자연어 처리(NLP)는 처음에 비해 크게 발전해 왔습니다. TF-IDF(Term Frequency-Inverse Document Frequency) 및 마르코프 체인과 같은 전통적 모델은 다른 초기 NLP 모델입니다. TF-IDF 모델은 문서 내 단어나 문서 집합에서 용어의 중요성을 측정하는 데 사용되었지만, 문맥과 구문의 이해를 갖추지 못했습니다. 마르코프 체인 모델은 이전 단어에 기반하여 문장에서 다음 단어의 확률을 예측하는 데 사용되었습니다. 그러나 이 모델은 즉시 선행 단어만을 고려하므로 장기 의존성 이해에 한계가 있었습니다.

RNN은 그 시대에 강력했지만, 생성 작업에 잘 수행하기 위해 필요한 계산량과 메모리 제약 때문에 제한되었습니다. 모델이 본 바로 이전 단어 하나만 보았을 경우, 예측은 매우 어려워집니다. 텍스트에서 선행 단어를 더 많이 많이 보기 위해 RNN 구현을 확장하는 경우, 모델이 사용하는 자원을 크게 확장해야 합니다. 다음 단어를 성공적으로 예측하기 위해서는 이전 몇 단어만 보는 것 이상의 것이 필요합니다. 모델은 문장 전체나 심지어 문서 전체를 이해해야 합니다. 문제는 여기에 있습니다. 언어는 복잡합니다. 많은 언어에서 한 단어는 여러 의미를 가질 수 있습니다.

<div class="content-ad"></div>

임무 를 Long Short-Term Memory (LSTM) 네트워크의 도입 으로 해결 되었어요. LSTM 은 특별한 유형 의 RNN 으로, 장기 간 의존성 을 학습하 고 정보 를 오랜 기간 기억 할 수 있어요. 특히 NLP 에서는 단어 나열 을 통해 맥락 이해 에 도움 이 됩니다. 이 덕분 에 NLP 작업 의 성능 이 크게 향상 되었고, 좀 더 인간 같은 언어 이해 를 가져다 주었어요.

# 에우레카!!!

트랜스포머 구조 가 "주의 가 필요해" 라는 개념 으로 나타나, RNN 보다 큰 성능 향상 을 가져왔어요. 순차 형 모델 인 RNN 이나 LSTM 과 달리, 트랜스포머 는 모든 데이터 포인트 를 병렬 로 처리 해서 큰 텍스트 데이터 를 더 효율 적으로 처리 할 수 있어요. 또한 떨어진 데이터 포인트 를 직접적으로 관련 지어 시퀀스 의 장기 의존성 문제 를 해결 합니다.

<div class="content-ad"></div>

트랜스포머는 BERT, GPT-4, T5와 같은 최첨단 NLP 모델의 기반이 되며 기계 번역, 텍스트 요약 및 기타 언어 작업의 발전을 이끌어내고 있습니다. 그들의 복잡성에도 불구하고, 문맥을 처리하고 확장성을 유지하는 능력으로 인해 AI에서 핵심 도구로 자리 잡았습니다.

트랜스포머는 초점 토큰 주변의 용어를 살펴 뜻을 창출하는 능력을 갖고 있습니다. 트랜스포머는 Self-Attention이라는 기술을 사용하며 이를 통해 한 용어로부터 다른 용어까지의 Attention 가중치가 계산됩니다. Attention 가중치는 문구 내에서 집중해야 할 토큰에 중요성을 더하여 실제 의미를 반영하는 데 도움을 줍니다.

![image](/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_3.png)

트랜스포머 아키텍처에는 토크나이저, 인코더 및 디코더 세 가지 주요 구성 요소가 있습니다.

<div class="content-ad"></div>

토큰화는 문장이나 구를 토큰이나 숫자 값의 시퀀스로 변환되는 것을 의미합니다. 토큰화는 단어들을 수학적 연산을 수행하기 위해 숫자 값으로 변환하는 과정입니다. 각 토큰은 임베딩 레이어를 통해 고정 길이 벡터 표현을 만들기 위해 전달됩니다. 이러한 임베딩은 높은 차원 공간에서 각 토큰의 문맥을 나타내는 것으로 이해됩니다. 토큰에 대한 생성된 임베딩은 인코더와 디코더로 보내집니다. 변압기 아키텍처는 데이터를 병렬로 처리할 수 있는 능력 때문에 잘 확장됩니다. 토큰의 상대적인 위치를 유지하기 위해 위치 인코딩도 인코더와 디코더 유닛으로 보내집니다. 이러한 유닛은 어텐션 가중치를 계산하는 셀프 어텐션 유닛을 포함하고 있습니다. 이 어텐션 가중치는 구문 내의 다른 용어에 대한 중요성의 표현입니다. 추가적으로, 인코더와 디코더는 모두 멀티헤드 어텐션 메커니즘을 활용합니다. 이 방법론은 여러 시각에서 어텐션 가중치를 찾기 위해 여러 셀프 어텐션 유닛을 사용하여 모델이 다중 의미적 언어 표현을 탐색하는데 도움이 되며, 심지어 언어적 모호성까지 고려할 수 있습니다. 어텐션 레이어에서 출력은 완전 연결 피드포워드 네트워크(Fully Connected Feed Forward Network)로 이동됩니다. 디코더 유단의 피드 포워드 네트워크에서의 출력은 순서에서 다음 토큰에 대한 확률 점수입니다. 모델 토크나이저 사전의 각 토큰에 해당하는 점수가 생성됩니다. 이 점수는 소프트맥스 레이어에 의해 처리되어 다음 예측된 토큰을 결정합니다.

![image](https://cdn.example.com/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_4.png)

추론 단계에서 디코더는 인코더의 셀프 어텐션과 피드포워드 네트워크의 출력을 사용하여 입력 시퀀스의 의미론적 및 문맥적 지식을 얻습니다. 입력 토큰이 제공되거나 중단 조건이 도달할 때까지 루프를 통해 완전한 시퀀스를 생성합니다.

# 친척들

<div class="content-ad"></div>

오리지널 트랜스포머 아키텍처에는 여러 자연어 처리 작업에 사용되는 2가지 변형이 있습니다. 다양한 학습 목표로 훈련된 이러한 변형들은 있습니다.

![이미지](/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_5.png)

인코더만 있는 아키텍처 모델은 오리지널 트랜스포머 아키텍처의 인코더 유닛만 포함하고 마스크 된 언어 모델링 기술을 사용하여 훈련됩니다. 이러한 모델은 토큰에 대한 양방향 컨텍스트를 가지고 있으며 시퀀스 내 사전에 오는 토큰에만 제한되지 않습니다. 이러한 모델들은 텍스트 분류 및 엔티티 인식과 같은 작업에 유용합니다. 예시: BERT, ALBERTA

![이미지](/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_6.png)

<div class="content-ad"></div>

디코더만 있는 아키텍처 모델인 Auto Regressive 모델은 원래의 트랜스포머 아키텍처에서 디코더 유닛만 포함하고 인과적 언어 모델링을 사용하여 훈련됩니다. 이러한 모델은 이전 토큰 세트만 볼 수 있으며 주로 텍스트 생성 작업에 중점을 둡니다. 이러한 모델은 모델을 훈련하기 위해 사용된 언어 사전의 토큰의 통계적 분포를 성립하려고 합니다. 단방향 조회만을 사용하는 훈련 제약 때문에 이러한 모델은 다양한 작업을 수행하고 제로샷 학습 작업을 효과적으로 수행할 수 있습니다. 예시: GPT, Llama

# 불안한 평온

대규모 언어 모델은 수십조 개의 토큰에 대해 수 주 또는 수 개월 동안 훈련되어 컴퓨팅 파워가 많이 소모됩니다. 이러한 기초 모델이라고 하는 수십억 개의 매개변수를 가진 모델은 언어 이외의 신기한 특성을 나타내며 연구자들은 복잡한 작업을 분해하고 추론 및 문제 해결 능력을 발견하고 있습니다. 우리가 언어 모델과 상호 작용하는 방식은 기타 기계 학습 및 프로그래밍 패러다임과 매우 다릅니다. 그런 경우에는 형식화된 구문을 사용하여 컴퓨터 코드를 작성하여 라이브러리와 API와 상호 작용합니다. 반면, 대규모 언어 모델은 자연어 또는 사람이 쓴 지침을 취할 수 있고 사람이 하는 것과 같이 작업을 수행할 수 있습니다.

![Textual Titans: A Large Language Model Odyssey](/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_7.png)

<div class="content-ad"></div>

전통적인 기계 학습 및 딥 러닝 시스템과의 상호 작용은 미리 정의된 구문을 따르는 프로그래밍 언어와 컴퓨터 코드를 통해 이루어집니다. 그에 반해 LLMs와 상호 작용하는 것은 자연 언어를 사용하고 특히 특정 작업을 수행하기 위한 명령 형식으로 이루어집니다.

추론 또는 예측 단계에서 LLM에 대한 완전한 입력을 프롬프트라고 합니다. 프롬프트에는 사용자 질문과 선택적으로 질문에 대답해야 하는 맥락이 포함될 수 있습니다. 모델 성능을 향상시키고 모델로부터 원하는 출력을 얻기 위해 프롬프트에 맥락을 포함하는 것은 In-context learning이라고 합니다. 모든 LLM에는 소비할 수 있는 단어나 토큰의 수에 제한이 있으며 이를 맥락 창으로 참조합니다. 모델의 출력은 "완료"로, 이는 주어진 프롬프트를 기반으로 LLM에서 추론을 수행하는 과정으로 생성된 텍스트와 원래 프롬프트로 구성됩니다. 완료는 LLM이 다음 단어 생성 작업에 작용하면서 진행됩니다. 질문이 포함된 프롬프트인 경우 LLM은 해당 답변을 생성합니다.

# 크기가 중요할 때도 있습니다

대형 언어 모델은 방대한 데이터 양으로 교육을 받으면서 다양한 지식과 주관적 이해력을 암시적으로 얻게 됩니다. 모델의 크기가 증가함에 따라 정보의 폭과 이해의 경향도 향상됩니다. 교육 과정 중 학습된 매개변수의 많은 숫자는 전문적인 교육 없이도 복잡한 작업을 수행하고 정보를 처리하는 데 도움이 됩니다. 흥미로운 점은 작은 모델이 전문화된 작업에 대해 교육되거나 세밀하게 조정될 때 잘 수행하는 경향이 있다는 것입니다.

<div class="content-ad"></div>

모델에 깊이 있는 맥락과 예제를 제공하여 작업의 결과물을 향상시키는 것을 '인컨텍스트 학습'이라고 합니다. LLMs는 수행할 작업에 대한 프롬프트로서 지시를 받습니다. 큰 모델은 사전 훈련 단계에서 다양한 주제에 대한 지식을 쌓고 제로-숏 추론에서 우수한 성능을 보입니다. 비교적 작은 모델은 작업에 대한 더 구체적인 설명이 필요하며 예제는 원하는 목표를 달성하는 데 도움이 될 수 있습니다. 프롬프트에 한 예제를 추가하는 과정은 '원샷 추론'이라고 하며 두 개 이상의 예제를 추가하는 것을 '퓨 샷 런닝'이라고 합니다. 모델의 맥락 창으로 다룰 수 있는 프롬프트의 길이는 제한이 있음을 유의해야 합니다.

![Image](/assets/img/2024-07-06-TextualTitansALargeLanguageModelOdyssey_8.png)

LLM의 능력을 확장하는 것은 외부 데이터 소스를 추가로 제공하는 것을 포함할 수 있습니다. 이는 API, 데이터베이스 등을 포함할 수 있습니다. 우리는 후속 기사에서 해당 주제에 대해 자세히 다룰 것입니다.

# 요약

<div class="content-ad"></div>

NLP가 생겨난 이후로 많은 발전을 이루었습니다. 새로운 능력들로 가장 어려운 산업 문제들을 해결하는 것이 더 쉬워졌죠.

생성적 AI 분야는 시대별로 진화하고 있으며, 엔지니어와 데이터 과학자들이 미래를 도와주는 가장 혁신적인 기술로 무장하는 것이 점점 더 중요해지고 있습니다. Google, Meta, Microsoft는 물론 Mistral AI와 HuggingFace는 거대한 모델과 혁신적인 도구를 모든 엔지니어의 손에 넣기 위해 오픈 소스 공간에서 혁명을 이끌고 있습니다. AI의 민주화는 시대적 필요라고 할 수 있겠네요.

# 참고문헌 및 크레딧:

Vaswani, Ashish 등. "Attention is all you need." 신경 정보 처리 시스템 30에서의 발전 (2017)

<div class="content-ad"></div>

"동, 청희 등. “현황 학습에 대한 조사.” arXiv 사전 인쇄 arXiv:2301.00234 (2022)"
