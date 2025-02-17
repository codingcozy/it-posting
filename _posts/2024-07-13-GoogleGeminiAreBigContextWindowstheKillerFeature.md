---
title: "Google Gemini 빅 컨텍스트 창이 최고의 기능일까"
description: ""
coverImage: "/assets/img/2024-07-13-GoogleGeminiAreBigContextWindowstheKillerFeature_0.png"
date: 2024-07-13 23:20
ogImage:
  url: /assets/img/2024-07-13-GoogleGeminiAreBigContextWindowstheKillerFeature_0.png
tag: Tech
originalTitle: "Google Gemini: Are Big Context Windows the Killer Feature?"
link: "https://medium.com/young-coder/google-gemini-are-big-context-windows-the-killer-feature-72ff95488fb1"
isUpdated: true
---

에
힘이 그들의 AI 제공물 주변을 지키는 데 어려움을 겪고 있다는 정보가 유출된 지 겨우 여덜 달밖에 되지 않았다. 다시 말해, 그들의 AI 제공물 주변에는 성장된 비즈니스 장점이 없었을 뿐만 아니라, 구글은 상황을 바꿀 비밀 요리도 없었습니다. 그리고 그들이 문제에 씨름하고 있을 때, 그들은 자신들과 같은 사립 자금이 투입된 AI 프로젝트와 오픈 소스 AI 모델 사이의 간격이 "놀라울 정도로" 빨리 좁아지고 있다는 것을 지켜보고 있었습니다.

이 이야기가 어떻게 끝나는지 아직은 이르지만요. 아마도 오픈 소스 AI가 초기 성공을 이어나갈지, 아니면 구글, 마이크로소프트, 애플과 같이 거대한 부자 경쟁사들이 운영하는 AI들에 의해 질식당할지, 아니면 그들의 놀라운 양의 데이터로 인해 질식당할지는 아직 알 수 없습니다. 현재, 다른 조직들이 빠른 속도로 AI 발전을 이끌어내는 가운데 여전히 충돌이 진행 중입니다. 최근에 구글은 이 분야에서 주목을 받았습니다. 새로운 LLM인 Gemini 1.5 Pro의 미리보기를 발표했을 때 입니다. 또 다른 날, 또 다른 대형 언어 모델 - 그랬던 것처럼 보였지만, 구글이 놀라운 변화를 설명했습니다.

Gemini 1.5 Pro은 컨텍스트 창을 대폭 확대했습니다. 즉, LLM이 한 번에 추적할 수 있는 데이터의 양을 의미합니다. 이전 버전에서 Gemini는 128,000 토큰까지의 컨텍스트 창을 가졌었고, 마치 GPT-4와 같았습니다. 그러나 Gemini의 새로운 컨텍스트 창은 1백만 토큰을 수용할 수 있으며, 그 변화의 영향은 엄청납니다.

하지만 우리가 LLM 능력에 미치는 컨텍스트 창의 영향에 대해 이야기하기 전에, 우리는 컨텍스트 창이 어떻게 작동하는지를 간단히 되짚어 볼 필요가 있습니다.

<div class="content-ad"></div>

# 컨텍스트 창 (요약)

간단히 말하면, 컨텍스트 창은 상호 작용 중 LLM이 기억할 수 있는 정보량을 설정하는 것입니다. 예를 들어 ChatGPT를 사용한다면, 현재 제공한 프롬프트, 대화에서 입력한 모든 내용, 그리고 ChatGPT가 다시 보낸 모든 답변으로 구성된 컨텍스트 창이 있습니다. 대화를 오래 이어가다 보면 대화의 이전 부분이 컨텍스트 창에서 빠져나가고, ChatGPT는 그 세부사항을 갑자기 잊어버릴 것입니다.

컨텍스트 창의 128,000 토큰은 크다고 생각할 수 있지만, 이 숫자는 속임수적입니다. 먼저, 평균 단어가 실제로 LLM에 분해되었을 때 1~3개의 토큰이라는 것을 고려해야 합니다. (3단어에 4개의 토큰을 규칙으로 하지만, 언어가 더 복잡하거나 법률이나 의학과 같은 전문 분야일수록 증가합니다.) 긴 문서, 지속적인 상호작용, 그리고 AI를 활용한 응용프로그램을 살펴보면 LLM이 알아야 할 모든 것을 컨텍스트 창에 담을 수 없다는 것을 빠르게 깨닫게 될 것입니다.

그러한 이유로 컨텍스트 창 제약을 우회하는 몇 가지 똑똑한 방법을 개발했습니다. 예를 들어:

<div class="content-ad"></div>

- 청킹. 큰 양의 데이터를 분할해서 LLM이 한 번에 하나씩 살펴볼 수 있습니다. 이 방법은 일부 작업(긴 문서 요약)에는 잘 작동하지만 문서 전체에 걸쳐 개념을 분석해야 하는 경우에는 그렇게 잘 동작하지 않습니다.
- 파인 튜닝. LLM을 특정 데이터로 훈련시킬 수 있습니다. 시간과 비용 외에도 문제는 새 데이터가 LLM이 이미 흡수한 훨씬 더 큰 범용 훈련 데이터 세트에 쉽게 압도된다는 것입니다. 종종 그냥 제대로 동작하지 않을 수도 있습니다. 게다가 GPT-4와 Gemini를 포함한 많은 LLM은 파인 튜닝을 전혀 지원하지 않습니다.
- 검색 증강 생성(RAG). 먼저 텍스트 콘텐츠를 임베딩이라는 특수한 표현으로 변환합니다. (임베딩은 LLM의 작동 방식 중요한 부분입니다. 본질적으로 문맥의 의미를 포착하는 숫자 표현입니다.) 임베딩을 얻으면 그것들을 벡터 데이터베이스에 넣습니다. 이제 시맨틱 검색의 마법을 사용해서 특정 내용을 검색하고 그 데이터를 LLM에 제공할 수 있습니다. 다시 말해, LLM에 중요한 정보만 전해주는 것입니다.

지금까지 나온 가장 흔한 방법은 마지막 점입니다. RAG는 효율적이고 예측 가능합니다. 즉, 크기가 크고 연관성이 적은 문서의 대량 컬렉션이 있다면 아주 잘 작동합니다. 예를 들어, 회사의 지식베이스 문서에서 정보를 추출하는 기술 지원 챗봇을 만든다고 상상해보세요. RAG로 관련 데이터를 찾아서 그것을 LLM에 프롬프트와 함께 제공합니다. 본질적으로, LLM에게 답변할 때 어디를 봐야 하는지 알려주는 것입니다.

하지만 RAG는 완벽하지 않습니다. 데이터를 준비하는 데 훨씬 더 많은 시간을 투자해야 합니다. 완전히 새 데이터 세트로 옮겨가기 쉽지 않습니다. 그리고 소설의 전체적인 주제나 코드베이스의 기능을 심도 있게 고려해야 하는 경우와 같이 한꺼번에 막대한 양의 정보를 고려해야 하는 경우에는 효과적이지 않습니다. 하지만 여러 가지 한계에도 불구하고, RAG는 오늘의 최고의 실천 방법에 상당히 가깝습니다.

적어도, Gemini 1.5 Pro가 나올 때까지는요.

<div class="content-ad"></div>

이미지 태그를 Markdown 형식으로 변경하세요.

# 놀라운 순간

Gemini 1.5 Pro가 아직 출시되지 않았지만, 현재는 엄격히 제한된 트라이얼에서 사용할 수 있습니다. 그리고 그 결과들은 눈을 떴습니다.

가장 인상적인 예시 중 일부는 Gemini가 거대한 지식 체계를 아우르는 분석을 생성하는 것을 보여줍니다. Google의 데모는 예상대로 인상적이지만, 과거에는 데모를 조작하고 예시를 엄선하는 것으로 비난받은 바 있습니다. 저는 독립적인 테스터들의 결과에 더 관심이 있으며, 그들은 결코 덜 놀라운 결과를 보고했습니다.

<div class="content-ad"></div>

예를 들어, 코너 그레넌이 300 페이지의 소설을 자이미니에게 주고, 주요 캐릭터를 설명하고 줄거리 전개를 찾아내며, 캐릭터가 특정 감정을 느낀 사례를 식별해보라고 했습니다. 자이미니는 책 전체적으로 균형 있는 주장을 개발하는 데 문제가 없었습니다. YouTube에서 인기 있는 파이어쉽 채널의 창조자인 제프 델라니는 자이미니에게 수천 개의 파일로 된 전체 코드베이스를 주고 새로운 기능을 추가해 달라고 했습니다. 자이미니는 올바른 코드를 작성하는 것뿐만 아니라, 기존 프로젝트의 스타일을 따르며, 이미 설정된 구성 요소, 라이브러리 및 규칙을 사용했습니다. 다른 데모에서는 자이미니가 애플리케이션에서 문제를 식별하고 중요한 예시를 추출하며 API 설명서를 작성하는 것도 보여줍니다.

그리고 자이미니의 거대한 컨텍스트 창문을 채울 다른 새로운 기능이 하나 더 있습니다 - 비디오. 비디오는 단어보다 다른 토큰화 방식을 취하며 훨씬 더 많은 공간을 차지합니다. 그럼에도 100만 토큰의 컨텍스트 창문은 약 1시간의 비디오를 보여주는데 충분합니다 - 영화를 살펴보고 콘텐츠에 대한 복잡한 질문에 답변할 수 있을 만큼입니다. 이것이 구글이 자이미니에게 버스터 키튼 영화에서 같은 장면에 쓰인 종이 조각에 적힌 단어 같은 특정 세부 정보를 찾아보라고 요청했을 때 한 일입니다.

# 미래의 LLM들

거대한 컨텍스트 창문이 미래의 방향일까요? 지금까지, 일반적인 지혜는 큰 컨텍스트 창문이 최선의 해결책이었다고 생각되었습니다. 우리는 그들이 연인 시간에 비싸다는 문제가 걱정되었습니다. 한 연구에 따르면, LLM은 긴 컨텍스트 창문 중간에 정보를 찾는 데 특별히 좋지 않았으며, 시작 또는 끝에 발생하는 세부 사항에서 더 잘 수행했다고 합니다. 이러한 모든 요소는 동일한 결론을 뒷받침했습니다: 컨텍스트 창문에 콘텐츠를 강제로 집어넣는 것은 단순하고 비용적으로 효과적이지 않았다는 것이죠. 모든 데이터를 한 요청에 담아내는 것이 LLM과 대화하는 올바른 방법이 될 수 없다는 것을 의미한 것입니다.

<div class="content-ad"></div>

이제 미래가 갑자기 변할 것 같아요. 대규모 컨텍스트 창이 다가오고, 이는 LLMs에게 더 강력하고 포괄적인 넓은 지식 영역에 대한 이해를 제공할 수 있을 겁니다. 작년에는 텍스트로 불가능했던 작업들이 이제 비디오로 가능해질 것입니다. 그리고 구글 리서치는 Gemini의 변형을 실험 중이며, 컨텍스트 창을 놀라운 1,000만 토큰까지 확장하고 있어요.

두 가지 사실은 분명해요. 첫째, LLM 전쟁에서 승자를 결정하는 건 멍청한 짓입니다. 그리고 둘째, 변화의 속도가 느려지는 게 아니라 오히려 가속화되고 있어요.

AI에 대해 이해하려고 노력 중이세요? 'The Year of AI' 뉴스레터에 가입해보세요. 거기에서 AI에 호기심 많은 개발자가 1년 동안 데이터 과학에 대해 얼마나 많은 것을 배울 수 있는지 보여드릴 거에요. 또는 'Young Coder' 뉴스레터를 팔로우해서 매월 새로운 기사 링크를 받아보세요.
