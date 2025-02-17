---
title: "AI의 역사 파트 1 인공지능의 기원과 발전"
description: ""
coverImage: "/assets/img/2024-06-27-AHistoryofAIPart1_0.png"
date: 2024-06-27 19:02
ogImage:
  url: /assets/img/2024-06-27-AHistoryofAIPart1_0.png
tag: Tech
originalTitle: "A History of AI (Part 1)"
link: "https://medium.com/on-technology/a-history-of-ai-part-1-146aebb2388c"
isUpdated: true
---

## 인공지능 연구 논문

이 기사는 제가 인공지능의 역사를 소개하는 연속 기사 시리즈 중 첫 번째로, 이 분야에서 가장 중요한 연구 논문들을 검토해 소개합니다.

- 퍼셉트론

퍼셉트론: 뇌 내 정보 저장 및 조직화를 위한 확률 모델, Frank Rosenblatt (1958)

<div class="content-ad"></div>

이 논문은 더 복잡한 신경망(예: 심층 신경망) 및 기계 학습 알고리즘의 개발을 위한 기초를 마련했습니다. 기계가 데이터로부터 학습할 수 있는 방법을 보여주었습니다.

퍼셉트론은 인공 신경망의 기본 단위입니다. 입력 데이터를 기반으로 가중치를 조정하여 학습하고 결정을 내릴 수 있습니다.

# 역전파

오류를 역전파함으로써 표현을 학습하는 것, David E. Rumelhart, Geoffrey E. Hinton & Ronald J. Williams (1986)

<div class="content-ad"></div>

이 논문은 역전파 알고리즘을 소개함으로써 인공 신경망 분야를 혁신하였습니다. 이 알고리즘은 다층 신경망(다층 뉴런으로 이루어진 신경 네트워크)을 학습할 수 있도록 하여 딥 러닝의 발전을 이끌었습니다.

역전파는 신경망을 학습시키는 학습 절차로, 실제 출력 벡터와 목표 출력 벡터 사이의 차이를 최소화하도록 연결 가중치를 조정합니다.

그 중요성은 내부 은닉 유닛이 작업 도메인의 중요한 측면을 나타내도록 하는 유용한 새로운 기능을 생성할 수 있는 능력에 있으며, 퍼셉트론 수렴 절차와 같은 이전 방법과 구별됩니다.

효율적인 역전파 구현은 대게 미분법의 연쇄 법칙을 통해 가능하며, 네트워크의 가중치를 조정하는 데 필요한 그래디언트를 체계적으로 계산할 수 있게 합니다.

<div class="content-ad"></div>

# 의사 결정 트리

의사 결정 트리의 유도, J. R. 퀸란 (1986)

이 논문은 ID3 알고리즘을 소개하여 결정 트리를 구축하는 데 중요한 방법으로 사용되었고, 결정 트리 알고리즘을 개선하여 소음이나 불완전한 데이터를 처리하는 연구를 촉진하는 데 영향을 미쳤습니다.

의사 결정 트리는 입력 데이터의 특징에서 유도된 규칙의 계층 구조에 기반하여 결정을 내리는 분류 및 회귀 작업에 사용되는 모델입니다.

<div class="content-ad"></div>

결정 트리를 효율적으로 합성하는 것은 정확도와 계산 자원을 최적화하는 방식으로 트리를 구성하는 것을 의미하며, 소음 및 불완전한 정보를 효과적으로 처리합니다.

ID3(반복 이분화기 3)는 정보 이득을 최대화하는 속성을 기반으로 데이터를 재귀적으로 분할하는 탑다운, 탐욕적 방법을 사용하여 결정 트리를 생성하는 알고리즘입니다.

정보 이득은 데이터 집합을 분류하는 데 속성의 효과를 측정하는 데 사용되며, 데이터 집합이 해당 속성을 기반으로 분할될 때 엔트로피(불확실성)의 감소를 양적으로 측정합니다. 정보 이득을 최대화하는 것은 엔트로피의 최대 감소를 제공하는 속성을 선택함으로써 결정 트리의 정확도를 향상시키는 것을 의미합니다.

# Hidden Markov Models

<div class="content-ad"></div>

음성인식의 숨겨진 마르코프 모델 및 선택된 응용 프로그램에 대한 교재, L.R. 라비너 (1989)

이 논문은 숨겨진 마르코프 모델(HMMs)에 대한 포괄적이고 실용적인 가이드를 제공하여 연구자와 실무자가 음성인식 및 기타 분야에서 이를 더 쉽게 접근하고 이해할 수 있도록했습니다.

이산 마르코프 체인은 현재 상태에만 의존하며 이전 상태에 의존하지 않는 상태 시퀀스로 구성된 확률 과정인 확률적 과정입니다.

숨겨진 마르코프 모델(HMM)은 모델링되는 시스템이 감지되지 않은(숨겨진) 상태로 마르코프 프로세스를 따른다고 가정하는 통계 모델로, 관찰된 데이터가 이러한 숨겨진 상태와 확률적으로 연결되어 있다는 직관을 가지고 있습니다.

<div class="content-ad"></div>

HMM의 세 가지 기본 문제는 다음과 같습니다: 평가 문제(관측된 시퀀스의 확률 계산), 디코딩 문제(숨겨진 상태의 가장 가능성 있는 시퀀스 결정), 학습 문제(데이터로부터 모델 매개변수 추정).

Rabiner은 음성 신호를 숨겨진 상태의 시퀀스로 모델링하여 음성 인식에 HMM을 적용했습니다. 이를 통해 언어의 최소 음성 단위인 음소를 나타내는 숨겨진 상태의 시퀀스로 연속된 말의 확률적 디코딩 및 인식이 가능해졌습니다.

# 다층 피드포워드 네트워크

다층 피드포워드 네트워크는 1989년 Kurt Hornik, Maxwell Stinchcombe, Halbert White에 의해 제안된 보편적 근사자입니다.

<div class="content-ad"></div>

이 논문은 신경망의 범용 근사 능력에 대한 이론적 기반을 수립하여, 심지어 단순한 신경망 구조조차 복잡한 함수를 원하는 정확도로 근사할 수 있다는 것을 입증했습니다. 이로 인해 다양한 응용 프로그램에서 신경망의 광범위한 사용과 개발이 가능해졌습니다.

표준 다층 피드포워드 네트워크는 노드 사이의 연결이 순환을 형성하지 않는 인공 신경망의 한 종류로, 입력 레이어, 하나 이상의 은닉 레이어 및 출력 레이어로 구성됩니다.

보렬 측정 가능 함수는 한 위상 공간의 요소를 다른 위상 공간으로 매핑하는 함수로, 어떤 보렬 집합의 역사 이미지도 보렬 집합이 되도록 하는 함수입니다. 직관적으로 보렬 측정 가능성은 함수가 예측 가능하고 측정 가능한 방식으로 작동함을 보장합니다.

임의의 압축 함수는 신경망에서 사용되는 활성화 함수의 한 유형으로, 실수 값 입력을 유계 출력에 매핑하여 일반적으로 입력을 유한 범위로 압축합니다. 이 함수에는 시그모이드 또는 tanh 함수가 포함됩니다.

<div class="content-ad"></div>

유니버설 근사기는 충분한 자원(예: 신경망의 충분한 숨겨진 유닛과 같은)가 주어진 경우, 어떤 함수든 원하는 수준의 정확도로 근사할 수 있는 모델 또는 수학적인 함수입니다.

# 서포트 벡터 머신

Bernhard E. Boser, Isabelle M. Guyon, 그리고 Vladimir N. Vapnik (1992)의 최적의 마진 분류기를 위한 훈련 알고리즘입니다.

본 논문은 서포트 벡터 머신(Support Vector Machines, SVMs)을 소개했는데, 이는 클래스 간의 여백을 최대화하고 모델 복잡성을 자동으로 조절하여 광범위한 응용 프로그램(예: 광학 문자 인식)에서 일반화 및 견고성을 향상시킬 수 있는 분류 작업의 기본 도구로 자리 잡았습니다.

<div class="content-ad"></div>

서포트 벡터 머신(Support Vector Machine, SVM)은 분류 및 회귀에 사용되는 지도 학습 알고리즘으로, 서로 다른 클래스 간의 간격을 최대화하는 최적의 초평면을 찾습니다.

SVM 알고리즘은 지원 패턴을 이용해 클래스 간 간격을 최대화하는 초평면을 식별하고, 커널 함수를 사용하여 비선형 분류 문제를 다룰 수 있습니다.

간격은 의사결정 경계(서로 다른 클래스를 구분하는 선 또는 표면)와 가장 가까운 훈련 패턴 간의 거리를 나타내며, 일반적으로 더 큰 간격은 더 나은 일반화를 이끌어냅니다. 지원 패턴은 의사결정 경계에 가장 가까이 위치한 훈련 패턴으로, 경계의 위치와 방향에 직접적인 영향을 미칩니다.

Leave-one-out 방법은 교차 검증 기술 중 하나로, 모델은 특정 훈련 패턴을 제외하고 학습되며, 이 프로세스는 각 패턴에 대해 반복되어 모델의 일반화 성능을 추정합니다.

<div class="content-ad"></div>

VC-차원(밥닉-체르보넨키스 차원)은 일련의 함수 집합의 용량 또는 복잡성을 측정하는 것으로, 모델에 의해 완벽하게 분류된 포인트의 최대 개수를 나타냅니다.

## Bagging

백팩 예측자, 레오 브레이먼(1996)

이 논문은 앙상블 방법론의 개념을 도입하여 예측 정확도를 향상시키는 여러 모델을 결합하는 방법에 영향을 주었으며, 부트스트랩 반복 및 예측자 불안정성의 중요성을 강조함으로써 기계 학습 분야에 상당한 영향을 미쳤습니다.

<div class="content-ad"></div>

기계 학습에서의 앙상블 방법은 단일 모델 사용보다 전체 예측 정확도와 견고성을 향상시키기 위해 여러 모델을 결합하는 기술입니다.

배깅 (부트스트랩 집계)은 예측기의 여러 버전을 생성하고 이를 사용하여 정확도를 향상시킨 집계 예측기를 만드는 방법입니다.

배깅은 데이터의 서로 다른 하위 집합에서 훈련된 각 모델의 여러 버전을 평균화하여 예측의 분산을 줄이고 노이즈를 제거하며 과적합을 완화하기 때문에 작동합니다.

부트스트래핑은 데이터 집합에서 대체 샘플링을 통해 여러 새로운 훈련 세트를 생성하는 통계적 방법이며, 부트스트랩 복제본은 이러한 새로운 훈련 세트 중 하나를 의미합니다.

<div class="content-ad"></div>

# 합성곱 신경망

Yann LeCun, Léon Bottou, Yoshua Bengio, and P. Haffner이(가) 쓴 article인 "Gradient-based learning applied to document recognition" (1998)

이 논문은 합성곱 신경망(CNNs)의 우수한 성능을 증명하여 2차원 모양을 인식하는 데 특히 필기 문자 인식에 영향을 미쳤고, 복잡하고 다중 모듈 시스템을 교육하기 위한 그래프 변환 신경망(GTNs) 개념을 소개하여 문서 인식 및 다른 실용적인 응용 분야의 발전을 이끌었습니다.

합성곱 연산은 입력(예: 이미지)에 필터를 적용하여 입력의 특정 측면(예: 이미지의 가장자리)을 강조하는 출력 feature map을 생성하는 수학적 과정입니다.

<div class="content-ad"></div>

합성곱 신경망(CNNs)은 그리드 형태의 위상을 가진 데이터, 예를 들어 이미지와 같은 데이터를 처리하고 분석하기 위해 특별히 설계된 심층 신경망의 한 종류입니다. 합성 계층을 사용하여 공간적으로 계층화된 특징들을 자동적으로 적응적으로 학습합니다.

고차원 패턴이라는 용어는 많은 속성 또는 특징을 가진 데이터로, 이로 인해 분류나 분석이 복잡하고 어렵습니다. 예를 들어 손글씨 문자와 같은 것이 있습니다.

그래프 변환 네트워크(GTNs)는 경사 기반 방법을 사용하여 전체적인 성능 척도를 최적화하기 위해 여러 모듈 시스템을 전역적으로 훈련시키는 학습 패러다임의 한 종류입니다.

전역 훈련은 시스템의 여러 구성 요소 또는 모듈을 통합된 목표를 사용하여 동시에 훈련시키는 프로세스로, 시스템 전체를 단독 부분이 아닌 통합적으로 최적화할 수 있도록 합니다.

<div class="content-ad"></div>

읽어 주셔서 감사합니다! 피드백을 환영합니다! 특히 중요한 연구를 놓치지 않았는지 생각하신다면 더욱 감사하겠습니다.

![A History of AI Part 1](/assets/img/2024-06-27-AHistoryofAIPart1_0.png)
