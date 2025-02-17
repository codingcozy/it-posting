---
title: "SQL에서는 쉽지만 NoSQL에서는 어려운 다대일 관계 설정 방법"
description: ""
coverImage: "/assets/img/2024-06-22-Many-to-ManyOneRelationshipsareSimpleinSQLbutHardinNoSQL_0.png"
date: 2024-06-22 17:31
ogImage:
  url: /assets/img/2024-06-22-Many-to-ManyOneRelationshipsareSimpleinSQLbutHardinNoSQL_0.png
tag: Tech
originalTitle: "Many-to-Many One Relationships are Simple in SQL, but Hard in NoSQL"
link: "https://medium.com/gitconnected/many-to-many-one-relationships-are-simple-in-sql-but-hard-in-nosql-2b3cfeeb70eb"
isUpdated: true
---

![img](/assets/img/2024-06-22-Many-to-ManyOneRelationshipsareSimpleinSQLbutHardinNoSQL_0.png)

- 소개
- 일대다 관계
  - 참조 패턴
  - 내장 패턴
  - 부분 내장 패턴
- 다대다 관계
  - 중간 컬렉션
  - 양방향 및 단방향 다대다 관계
- 결론

# 소개

본 글에서는 SQL 및 NoSQL에서 일대다 및 다대다 관계를 모델링하는 방법의 차이점을 살펴볼 것입니다. 또한 NoSQL (문서 지향 데이터베이스)에서 사용되는 다양한 패턴을 탐구하고, 언제 어떤 것을 적용해야 하는지 이해해 보겠습니다.

<div class="content-ad"></div>

# 일대다 관계

우리가 Article과 Comment 엔티티를 가진 애플리케이션을 개발하고 있다고 상상해 봅시다. 또한 요구사항은 다음과 같습니다:

- 하나의 글에는 하나 이상의 댓글이 포함될 수 있습니다.
- 하나의 댓글은 하나의 글에만 속할 수 있습니다.

위 요구사항은 두 엔티티 간에 일대다 관계를 사용해야 함을 의미합니다.

<div class="content-ad"></div>

SQL 데이터베이스에서는 보통 Articles 및 Comments 두 테이블을 생성하고 외래 키(Comments 테이블에)를 생성하여 일대다 관계를 설정합니다. 클라이언트 코드는 이후 이 두 테이블을 조인하여 댓글이 달린 기사를 가져와야 합니다.

![이미지](/assets/img/2024-06-22-Many-to-ManyOneRelationshipsareSimpleinSQLbutHardinNoSQL_1.png)

NoSQL 데이터베이스에서는 일대다 관계를 정의하는 데 더 많은 옵션이 있습니다. 참조, 삽입 또는 혼합 방식 중 하나를 선택할 수 있습니다.

참조 및 삽입 사이에서 선택하는 것은 NoSQL 문서 데이터베이스와 작업할 때 개발자들이 하는 주요 선택사항 중 하나입니다.

<div class="content-ad"></div>

## 참조 패턴

NoSQL에서 참조 패턴을 사용하는 것은 SQL에서 일대다 관계를 정의하는 것과 비슷합니다. 우리는 기사와 댓글의 두 개의 별도의 JSON 컬렉션을 정의하고, 그들 사이의 관계를 ID를 사용하여 수립할 수 있습니다:

```js
//기사 컬렉션 (부모)
[
  {
    id: 4,
    title: "SQL에서는 다대다/일대다 관계가 간단합니다...",
    content: "...",
    author: "...",
    postedAt: "...",
  },
][
  //댓글 컬렉션 (자식)
  {
    id: "...",
    articleID: 41,
    content: "...",
    author: "...",
    rating: "...",
  }
];
```

이러한 방식으로 문서를 참조할 때, 기사에 댓글 ID의 배열을 포함하는 것도 고려할 수 있습니다. 그러나 이것은 최적의 해결책이 아닐 수 있습니다. 왜냐하면 기사에는 많은 수의 댓글이 포함될 수 있어서, 문서에는 많은 댓글 ID 배열이 포함될 수 있기 때문입니다.

<div class="content-ad"></div>

참조 패턴을 사용할 때, 보통 앱은 기사와 관련 댓글을 검색하기 위해 두 번의 쿼리를 수행해야 합니다. 그러나 MongoDB와 같은 문서 지향 데이터베이스는 컬렉션을 단일 읽기 쿼리에서 조인할 수 있는 기능을 제공합니다.

참조 패턴을 사용해야 하는 경우에 대한 일반적인 고려 사항:

✅ 자식 문서가 크거나 많은 경우. 또한 문서 데이터베이스의 문서 당 크기 제한을 고려해야 합니다. 참조 패턴은 이러한 제한을 피하는 데 도움이 됩니다.

✅ 부모 문서와 그 자식 문서가 거의 동시에 읽히거나 쓰이지 않는 경우. 자식 문서가 앱에서 부모 문서와 별도로 사용되는 경우, 이를 서로 다른 컬렉션에 저장함으로써 읽기 및 쓰기 작업이 간편해집니다.

<div class="content-ad"></div>

✅ 문서 데이터베이스에서 쿼리 기능이 제한적이기 때문에 복잡한 중첩 계층 컬렉션을 만드는 것을 피하는 것이 좋습니다.

✅ 자식 문서는 다른 컬렉션의 다른 유형의 상위 문서에 의해 참조되어야 하며, 데이터 일관성 관리를 간소화하기 위해 참조가 사용될 수 있습니다.

## 임베디드 패턴

반면에, 코멘트 배열은 아티클 문서에 완전히 임베드될 수 있습니다:

<div class="content-ad"></div>

```js
// 글 모음
[
  {
    id: 41,
    title: "매니-투-매니/원 관계는 SQL에서 간단합니다...",
    content: "...",
    author: "...",
    postedAt: "...",
    comments: [
      {
        id: "...",
        content: "...",
        author: "...",
        rating: "...",
      },
    ],
  },
];
```

먼저, 포함은 연관된 댓글이 있는 글을 하나의 간단한 조회 작업으로 검색할 수 있도록 해줍니다.

포함 패턴을 사용해야 하는 경우에 대한 일반적인 고려 사항:

✅ 응용 프로그램이 부모 문서와 별도로 자식 문서를 검색(또는 업데이트)할 필요가 없는 경우(도메인 주도 설계의 집합 및 집합 루트 개념을 상기하세요).

<div class="content-ad"></div>

✅ 부모와 자식 문서를 한 번의 원자적 쓰기 작업으로 업데이트해야 하는 능력이 필요합니다 (대부분의 문서 지향형 데이터베이스에서 쓰기 작업은 보통 단일 문서 수준에서만 원자적입니다).

✅ 내장 문서는 작고, 그 수도 많지 않습니다 ("하나 대 소수" 관계).

✅ 자식 문서의 업데이트는 자식 문서가 생성된 후에 드물게 발생하거나 전혀 발생하지 않습니다.

## Partial Embedded Pattern

<div class="content-ad"></div>

세 번째 방법은 참조 및 포함 패턴의 조합입니다. 부모 문서를 검색할 때 자식 문서의 하위 집합만 정기적으로 읽어야 할 경우 사용할 수 있습니다.

예를 들어, 글을 검색할 때 사용자에게 표시할 수 있는 최상위 댓글만 검색해야 할 수 있습니다. 다른 댓글은 나중에 필요할 때 검색하거나 전혀 필요하지 않을 수 있습니다.

```js
//Article collection (Parent)
[
  {
    id: 41,
    title: "Many-to-Many/One Relationships are Simple in SQL...",
    content: "...",
    author: "...",
    postedAt: "...",
    comments: [
      //Only 1 of 2 comments included
      {
        id: 1,
        content: "...",
        author: "...",
        rating: 10,
      },
    ],
  },
][
  //Comment collection (Child)
  ({
    id: 1,
    articleID: 41,
    content: "...",
    author: "...",
    rating: "...",
  },
  {
    id: 2,
    articleID: 41,
    content: "...",
    author: "...",
    raing: 3,
  })
];
```

부분 포함된 패턴은 성능을 향상시키기 위해 단일 읽기 작업에서 글과 최상위 댓글을 검색하는 애플리케이션에 사용될 수 있으며 모든 댓글을 별도의 컬렉션에 저장하는 이점 중 일부를 유지할 수 있습니다. 그러나 일부 자식 문서가 두 군데에 나타나기 때문에 응용 프로그램은 일관성을 보장하기 위해 추가 작업을 수행해야 할 수 있습니다.

<div class="content-ad"></div>

# 다대다 관계

우리가 프로젝트와 직원 엔티티를 가지고 있다고 상상해봅시다. 아래는 그들에 대한 요구 사항입니다:

- 여러 직원이 하나의 프로젝트에서 일할 수 있습니다.
- 동일한 직원이 동시에 여러 다른 프로젝트에 할당될 수 있습니다.

여기서 우리는 다대다 관계가 필요합니다.

<div class="content-ad"></div>

많은-대-많은 관계란 한 테이블의 여러 레코드가 다른 테이블의 여러 레코드와 관련이 있다는 것을 의미합니다.

SQL에서는 추가 테이블을 사용하여 많은-대-많은을 정의합니다:

![Many-to-Many Relationship](/assets/img/2024-06-22-Many-to-ManyOneRelationshipsareSimpleinSQLbutHardinNoSQL_2.png)

EmployeeToProjectAssignment 중간 테이블에는 외래 키뿐만 아니라 할당 이벤트에 대한 자세한 정보(이유, 날짜 등)를 제공하는 추가 속성도 포함될 수 있다는 점에 유의하십시오.

<div class="content-ad"></div>

NoSQL에서는 두 개의 컬렉션 간의 다대다 관계를 정의하는 여러 가지 방법이 있습니다:

## 중간 컬렉션

첫 번째 옵션은 SQL과 유사한 중간 컬렉션을 생성하는 것입니다:

```js
//프로젝트 컬렉션
[
  {
    id: 41,
    title: "전자 상거래",
    priority: "...",
    dueDate: "...",
  },
][
  //직원 컬렉션
  {
    id: 82,
    name: "존 도우",
    email: "...",
    role: "...",
  }
][
  //EmployeeToProjectAssignment (중간) 컬렉션
  {
    id: 1,
    projectID: 41,
    employeeID: 82,
    reason: "...",
    date: "...",
  }
];
```

<div class="content-ad"></div>

중간 컬렉션을 사용할 수 있는 경우:

✅ 다른 속성 (예: 이유, 날짜 등)을 외래 키 외에도 관계에 특정한 많은 속성을 저장해야 할 때

✅ 많은 문서가 관련된 다대다 관계인 경우 중간 컬렉션을 사용하면 문서 크기 제한을 피할 수 있음

✅ SQL에서 NoSQL로 테이블을 빠르게 마이그레이션해야 하는 경우? 중간 SQL 테이블에서 중간 NoSQL 컬렉션으로 데이터를 마이그레이션하는 것이 구현하기 가장 쉬운 방법일 수 있습니다.

<div class="content-ad"></div>

## 양방향 및 단방향 다대다 관계

다대다 관계를 정의하는 다음 옵션은 각 직원 문서에 프로젝트 ID 목록을 삽입하고 각 프로젝트 문서에 직원 ID 목록을 삽입하는 것입니다:

```js
//프로젝트 컬렉션
[
  {
    id: 41,
    title: "전자 상거래",
    priority: "...",
    dueDate: "...",
    employees: [1, 2],
  },
][
  //직원 컬렉션
  ({
    id: 1,
    name: "존 도",
    email: "...",
    role: "...",
    projects: [41],
  },
  {
    id: 2,
    name: "제인 도",
    email: "...",
    role: "...",
    projects: [41],
  })
];
```

식별자를 포함하는 대신 문서 전체를 포함하는 것도 고려할 수 있습니다. 포함할 내용의 선택은 일대다 관계에 대해 설명된 것과 유사하며, 따라서 반복하지 않겠습니다.

<div class="content-ad"></div>

하지만 참조 또는 포함을 사용하여 다대다 관계를 정의할 때 더 고려해야 할 흥미로운 점이 또 있습니다:

이전의 JSON 예시로 돌아갑시다. 프로젝트 컬렉션에서 employees 배열을 완전히 제거해도 두 컬렉션 간의 다대다 관계가 유지될 수 있습니다. 프로젝트 문서가 검색되면 응용 프로그램에서 관련 직원을 찾기 위해 추가 작업을 수행해야 합니다(직원 컬렉션을 스캔하고 프로젝트 배열을 확인함).

이 방법으로 다대다 관계를 모델링하는 것은 한쪽의 문서 수가 많고 다른 쪽은 매우 적은 경우 선택할 수 있습니다. 예를 들어, 단일 프로젝트에 많은 직원이 참여할 수 있지만, 직원은 한 번에 1~2개의 프로젝트만 작업할 수 있습니다.

그러나 이 경우 문서 크기뿐만 아니라 고려해야 할 사항은 두 컬렉션/엔티티가 응용 프로그램에서 어떻게 사용될지도 중요합니다.

<div class="content-ad"></div>

다른 예시를 상상해봅시다. 국가와 공식 언어 엔티티 간의 다대다 관계입니다. 이 응용 프로그램의 사용 사례가 특정 국가에서 어떤 언어가 사용되는지에만 관심이 있다면 그 반대는 아니라면, 공식 언어 문서에 국가 배열을 저장하는 것은 단순히 중복일 뿐입니다. 국가 문서에 언어 배열을 저장하는 것이 충분합니다.

# 결론

SQL 및 NoSQL 데이터베이스에서 엔티티간 관계를 정의하기 위해 가장 일반적으로 사용되는 두 가지 방법을 비교해보았습니다. 유연한 문서 데이터베이스의 성격으로 인해, NoSQL은 SQL에 비해 일대다 및 다대다 관계를 정의하는 데 더 많은 옵션을 제공합니다.

특정 사례에 가장 적합한 옵션을 선택하려면 응용 프로그램 사용 사례, 데이터 액세스 패턴, 필요한 일관성 수준, 문서 크기 제한 및 기타 요소를 고려해야 합니다.

<div class="content-ad"></div>

읽어 주셔서 감사합니다. 내용이 마음에 드셨다면 아래 이야기도 확인해보세요:

🔔 그리고 Buy Me a Coffee에서 제를 지원해 주시는 걸 고려해 주세요.
