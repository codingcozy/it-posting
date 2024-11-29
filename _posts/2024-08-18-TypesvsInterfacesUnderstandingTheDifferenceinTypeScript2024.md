---
title: "2024년 TypeScript에서 Types와 Interfaces의 차이점을 이해하기"
description: ""
coverImage: "/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_0.png"
date: 2024-08-18 10:58
ogImage:
  url: /assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_0.png
tag: Tech
originalTitle: "Types vs Interfaces Understanding The Difference in TypeScript 2024"
link: "https://medium.com/towardsdev/types-vs-interfaces-understanding-the-difference-in-typescript-2024-0dcedae7f5e1"
isUpdated: true
updatedAt: 1723951922306
---

![Types vs Interfaces](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_0.png)

TypeScript를 처음 시작했을 때, 가장 흔히 마주하는 논쟁 중 하나는 타입과 인터페이스 사이의 전투였습니다.

저와 같다면 아마도 궁금해했을 것입니다. "같은 것을 할 수 있는 두 가지 방법이 왜 필요한 걸까요?"

이 기사에서는 우리가 타입과 인터페이스 사이의 차이를 탐구하고, 장단점을 이해하며, 무엇보다 중요한 것은 언제 어느 것을 사용해야 하는지에 대해 알아볼 것입니다.

<div class="content-ad"></div>

안녕하세요! 개발자님, 아래 내용을 Markdown 형식으로 변경해보겠습니다.

Buckle up, because this ride is going to be both informative and fun!

# The Basics: What Are Types and Interfaces? ⛄

Let’s start with the basics. In TypeScript, both types and interfaces are used to define the shape of an object.

They’re a way to describe what a particular object should look like, what properties it should have, and what types those properties should be. But while they serve similar purposes, they have some key differences that set them apart.

<div class="content-ad"></div>

## 인터페이스

인터페이스는 TypeScript의 핵심 기능입니다. 객체에 대한 계약을 정의할 수 있게 해줍니다. 다음은 간단한 예시입니다:

![User object interface](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_1.png)

이 인터페이스는 이름(문자열), 나이(숫자), 그리고 관리자 여부(부울)를 가진 User 객체를 설명합니다. 인터페이스의 장점은 확장이 가능하다는 것입니다. 기존 인터페이스를 기반으로 새로운 인터페이스를 만들 수 있습니다.

<div class="content-ad"></div>

![image](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_2.png)

이제, 직원(Employee)은 사용자(User)의 모든 속성을 포함하며 직원 ID(employeeId)를 추가로 갖습니다.

## 유형

한편, 유형은 조금 더 다재다능합니다. 기존 유형, 연합 유형, 교차 유형 및 유틸리티 유형을 결합하여 복잡한 유형을 만들 수 있습니다. 이와 같이 유형 별칭을 사용하여 동일한 사용자 객체를 정의하는 방법입니다:

<div class="content-ad"></div>

![이미지](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_3.png)

"이것은 인터페이스랑 거의 똑같아 보이죠!" 생각하실 수도 있을 거예요. 그리고 맞아요 — 맞습니다. 하지만 타입이 정말 빛을 발하는 곳은 인터페이스로는 할 수 없는 일들을 할 수 있다는 데 있습니다.

예를 들어, 유니언 타입을 생성할 수 있습니다:

![이미지](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_4.png)

<div class="content-ad"></div>

아니면 교차 유형도 있어요:

![image](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_5.png)

# 차이점: 길이 만날 때

그래서, 타입과 인터페이스는 무엇이 다른가요? 몇 가지 주요 차이점을 자세히 살펴보죠.

<div class="content-ad"></div>

## 확장성

가장 중요한 차이점 중 하나는 어떻게 확장하는지입니다. 인터페이스는 확장을 염두에 두고 만들어졌습니다. extends 키워드를 사용하여 쉽게 인터페이스를 확장할 수 있으며, 이전에 보았던 것과 같습니다.

이러한 이유로 인터페이스는 객체 지향 디자인 패턴을 사용할 때 자연스러운 선택지입니다.

반면에 타입은 더 유연하지만 확장성 면에서 덜 형식적입니다. 타입을 직접적으로 확장할 수는 없지만, 교차 타입을 사용하여 비슷한 결과를 얻을 수 있습니다:

<div class="content-ad"></div>

<img src="/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_6.png" />

그러나이 방식은 항상 인터페이스를 확장하는 것만큼 직관적이지 않을 수 있습니다.

## 병합

다른 차이점은 인터페이스는 병합 될 수 있지만, 타입은 병합될 수 없다는 것입니다. 특히 제3자 라이브러리와 작업하거나 기존 인터페이스에 추가 속성을 추가하고 싶을 때 특히 유용합니다.

<div class="content-ad"></div>

<img src="/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_7.png" />

이 예에서 TypeScript는 두 개의 사용자 인터페이스를 자동으로 하나로 병합하여 사용자가 이제 이름, 나이, 관리자 여부, 역할 및 부서 속성을 가지게 됩니다.

이 기능은 타입으로는 얻을 수 없는 것입니다. 동일한 이름으로 두 번 타입을 정의하려고 하면 중복 식별자 오류가 발생합니다.

## 사용 사례: 언제 무엇을 사용해야 할까요? 🐰

<div class="content-ad"></div>

그래서, 인터페이스를 사용해야 하는 시기와 타입을 사용해야 하는 시기는 언제인가요? 제가 접근하는 방법을 알려드리겠습니다:

인터페이스 사용 시:

- 클래스를 작성하거나 객체 지향 패턴을 사용하는 경우와 같이 확장하거나 구현해야하는 구조를 다루고 있을 때입니다.
- 선언을 병합해야 하는 경우입니다. 라이브러리 정의와 함께 작업하거나 제3자 인터페이스의 기능을 확장하려는 경우에 특히 유용합니다.

타입 사용 시:

<div class="content-ad"></div>

- 유니언 또는 인터섹션 타입을 정의해야 합니다.
- 여러 타입을 결합하거나 타입을 매핑하거나 유틸리티 타입을 사용하여 더 복잡한 타입을 만들고 싶어 합니다.
- 함수 시그니처, 튜플을 정의하거나 프리미티브와 작업하고 계십니다.

# 영향: 성능과 가독성 🌾

이론적인 측면을 다루었으니, 이제 더 실용적인 주제에 대해 이야기해보겠습니다 — 성능입니다.

TypeScript 코드의 성능에 타입 또는 인터페이스를 사용하는 것이 코드 성능에 상당한 영향을 미친다는 흔한 신화가 있습니다.

<div class="content-ad"></div>

하지만 타입과 인터페이스 사이의 선택은 코드의 가독성과 유지 관리에 영향을 줄 수 있습니다.

프로젝트가 커짐에 따라 객체 구조를 어떻게 정의하고 확장하는지에 대한 명확하고 일관된 접근 방식을 가지면 코드베이스를 더 쉽게 탐색하고 이해할 수 있습니다.

# 진화: TypeScript 2024에서 무엇이 새로운가요?

TypeScript의 가장 흥미로운 점 중 하나는 지속적으로 발전하고 있다는 것입니다. TypeScript 2024에서는 타입과 인터페이스를 사용하는 방법에 몇 가지 섬세하면서도 강력한 개선 사항이 있었습니다.

<div class="content-ad"></div>

한 가지 주목할만한 추가 사항은 템플릿 리터럴 타입의 향상된 지원이며, 이를 통해 복잡한 패턴을 정의하는 데 타입을 더욱 강력하게 만들 수 있습니다:

![TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_8](/assets/img/2024-08-18-TypesvsInterfacesUnderstandingTheDifferenceinTypeScript2024_8.png)

이 기능을 사용하면 특정 문자열 패턴을 나타내는 타입을 정의할 수 있어 타입 정의를 더욱 정밀하게 만들 수 있습니다.

또 다른 흥미로운 발전은 인터페이스를 사용하여 매핑된 타입을 더욱 원활하게 정의할 수 있는 능력인데, 이를 통해 이전에 특정 사용 사례에 대해 타입을 더욱 매력적으로 만들었던 몇 가지 간극을 줄이고 있습니다.

<div class="content-ad"></div>

# 결론: 타입이나 인터페이스? 😊

하루 마무리로 TypeScript에서 타입과 인터페이스 사이의 선택은 옳고 그름에 대한 문제가 아니라, 각 도구의 강점과 약점을 이해하고 그것들을 언제 사용해야 하는지를 파악하는 문제입니다.

나는 특히 공용, 교차 및 복잡한 타입 조작을 위해 유연성이 필요할 때 타입을 활용합니다.

코딩을 계속하고 실험을 이어나가며, 무엇보다도 TypeScript를 마스터하는 여정을 즐기세요. 🚀

<div class="content-ad"></div>

좋은 하루 보내세요!
