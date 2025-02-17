---
title: "제1부 저렴하게 집에서 필라멘트 제작하기"
description: ""
coverImage: "/assets/img/2024-06-19-Part1Makeyourfilamentathomeforcheap_0.png"
date: 2024-06-19 05:50
ogImage:
  url: /assets/img/2024-06-19-Part1Makeyourfilamentathomeforcheap_0.png
tag: Tech
originalTitle: "Part 1: Make your filament at home for cheap"
link: "https://medium.com/endless-filament/make-your-filament-at-home-for-cheap-6c908bb09922"
isUpdated: true
---

플라스틱은 어디에나 있고 저렴한데도 우리는 1kg 필라멘트 스풀에 $20을 지불하고 있습니다. 하지만 이 스풀에는 750그램의 필라멘트만 들어있고 나머지는 빈 스풀의 무게입니다. 제 차고에서 싼 필라멘트를 만드는 방법을 찾기 시작했지만 최근 코로나바이러스로 인해 제 도시의 모든 지역 상점이 필라멘트를 다 팔아치웠고, 아마존과 같은 전자 상거래 웹 사이트들은 정부의 제한으로 인해 필라멘트 스풀을 포함하지 않는 중요한 상품만 배송할 수 있어 필라멘트를 배달해주지 않았습니다. 그래서 저는 생각하기 시작했습니다...

# 많은 노동이 필요할까요!?

사실 아닙니다. 한 번 부품을 조립하면 — 3D 프린터와 정확히 같이 작동합니다. 사실, 3D 프린터보다 조작하기가 훨씬 쉽습니다. 왜냐하면 여기서는 계속해서 동일한 것을 만들기 때문에 3D 프린팅과 달리 슬라이서 조정이나 디자인 변경 또는 지지물을 올바른 위치에 전략적으로 배치해야 하는 다른 모델을 인쇄하려고 할 때 필요한 것이 없습니다. 여기서는 출력 문제, 베드 레벨링, 지지물 요구사항이 없습니다.

조립하는 것은 3D 프린터보다 쉽습니다. 왜냐하면 정밀 조정 및 정렬이 필요한 이동 축이 없기 때문입니다.

<div class="content-ad"></div>

3D 프린터는 균일한 폭/높이의 필라멘트를 누르기 위해 필라멘트를 사용합니다. 반면, 익스트루더는 플라스틱 펠렛을 사용하여 필라멘트를 압출합니다.

기계를 만들면 초기 압출 공정을 조정하는 데 4-8분이 걸립니다. 그 후에는 일괄 크기에 따라 한 번에 10-20 kg의 필라멘트를 얻게 됩니다.

# 필라멘트 익스트루더의 투자 수익률

대부분의 사람들은 필라멘트 익스트루더의 투자 수익률을 계산할 때 실수를 저지르므로, 필라멘트 익스트루더의 투자 수익률을 계산한다면 다음을 염두에 두세요:

<div class="content-ad"></div>

- 대부분의 사람들은 3D 프린터나 필라멘트 구입에 대한 긍정적인 투자 수익을 보지 못할 것입니다.
- 1kg 스풀은 실제 필라멘트 750그램만 포함하고 있습니다.
- 나일론12와 같은 강한 소재는 1kg 스풀 당 35-45달러이며, 펠릿은 25kg 봉지에 3-4달러에 팔 수 있습니다.
- Ekstruder는 전기 모터, 기어박스, 온도 조절기, 열전대와 같은 표준 부품으로 만들어졌으며 이러한 부품들은 중고 가치가 있습니다. Ekstruder를 쉽게 분해하여 부품을 판매하거나 전체 장치를 판매하거나 다른 프로젝트에 부품을 활용할 수 있습니다.
- 이미 사용한 필라멘트의 중고 가치는 얼마나 될까요? 아마도 제로 또는 음의 가치일 것입니다. 반면, Ekstruder는 중고 가치가 좋은 부품들로 구성되어 있습니다.

이러한 사항을 염두에 두면 ROI간격이 빠르게 좁아지고 투자 금액을 상환하는 속도가 실제보다 빨라질 것입니다.

# 압출 스크류는 어떻게 작동합니까?

이해를 돕기 위해 위에 링크된 동영상을 시청하는 것이 매우 중요합니다. 만약 나사 상단에서 일정한 물 흐름을 유지하고 싶다면, 어떻게 이를 달성할 수 있을까요? 당연히 나사의 회전 속도를 일정하게 유지합니다. 예를 들어, 만약 나사가 정확히 5RPM으로 회전한다면, 시간당 정확히 5리터의 물을 얻을 것입니다. 그러나 RPM이 5RPM에서 6RPM으로 변경된 다음 다시 5RPM으로 변경된다면, 시간당 다른 5리터의 물, 그리고 6리터의 물, 그리고 다시 5리터의 물이 흐를 것입니다.

<div class="content-ad"></div>

필라멘트에 대해서도 마찬가지에요! 스크류가 플라스틱을 노즐을 통해 밀어내는 동안 필라멘트가 일정한 양으로 나와야 한다면, 스크류 회전 속도도 일정해야 합니다.

그렇죠, 용융 필라멘트는 껌처럼입니다. 만약 필라멘트가 노즐로 일정한 양으로 나오면, 용융 필라멘트를 일정한 RPM으로 끌어내기 위해 핀치 롤러를 설정해야 합니다. 그렇게 하면 일정한 신축이 가능해져 일정한 지름이 유지될 거예요.

# 하지만 제 필라멘트를 1.75mm로 정확히 원해요. 전문 회사 제품을 구입하는데 집착하겠습니다.

상용 필라멘트를 사용하려고 하시지만 1.75mm와 정확히 일치하는 필라멘트는 없다는 걸 명심하세요. 이베이나 아마존에 올라온 대부분의 필라멘트는 ± 0.02mm 허용치가 표기돼 있습니다. 즉, 지름은 (-0.02mm) 1.73mm부터 (+0.02mm) 1.77mm까지 변동할 수 있다는 뜻이죠. 하지만 이게 필라멘트 라벨이나 상품 설명에 표기된 내용이며, 실제로는 허용치가 훨씬 나쁠 수 있어요.

<div class="content-ad"></div>

PID(Proportional Integral Derivative) 직경 제어 없이도 제작한 ekstruder로 ±0.03mm의 정밀도를 얻었습니다. 이로 인해 완벽한 출력물을 얻으면서 뚜렷한 결함은 거의 발견되지 않았습니다.

# 그렇다면 왜 좋은 가격대의 필라멘트 ekstruder가 없을까요?

네, 다른 사람들로부터 필라멘트를 짜내는 것이 어렵다는 이야기를 무수히 많이 들었습니다. 그들이 자주 인용하는 이유는 유튜브에서 소형 데스크톱 ekstruder를 구매하고 일정한 직경으로 필라멘트를 짜내지 못한 사람들 때문입니다.

그러한 ekstruder의 일반적인 문제는 충분한 역동력(마력/토크)이 부족하다는 점입니다. 따라서 움직임이 불규칙해지면 모터가 부분적으로나 완전히 멈추게 되어 역동력이 일정하지 않아 용융 플라스틱이 다른 속도로 나오게 되어 직경의 불일치가 발생합니다.

<div class="content-ad"></div>

# 왜 그들은 기계에 강력한 모터를 포함시키지 않는 걸까요?

우선 1마력의 인덕션 모터는 8-10kg를 중량하며 기어박스도 비슷한 무게입니다. 그러니까, 강력한 모터와 기어박스를 추가하면 총 중량은 20kg가 될 것입니다. 나사와 배럴은 추가로 10kg입니다.

이제, 30kg 중량이 포함된 압출기를 판매하려면 이미 국제 배송비로 $300이 소요됩니다($100 당 10kg의 항공 운송료를 사용).

만약 나와 똑같은 압출기를 $600에 만드는 회사가 있다고 해봅시다. 이에 $300의 배송료를 더해도 가격은 이미 $900이 되어 버립니다 — 이렇게 하면 얼마나 많은 취미로 개인이 그걸 사겠어요? 또한 새로운 압출기에 사용된 모터/기어박스/교류 드라이브를 넣을 수 없습니다 — 얼마나 많은 사람이 그것을 사겠어요? $900은 회사 이윤 마진과 노동비를 포함하기 전 가격입니다.

<div class="content-ad"></div>

그 모든 것을 추가하면 동일한 압출기의 최종 비용이 $1500 이 넘어가서 더 이상 경제적이지 않아집니다.

이것은 DIY 경로가 훨씬 더 저렴한 것 중 하나입니다!

오해하지 마세요, 프런트로드 세탁기는 무게가 150kg이지만 소비자에게 배송되는 총 비용은 150kg 미니밀링기의 비용에 비해 훨씬 적습니다. 왜냐하면 근처 이웃 중 대부분의 사람들이 세탁기가 필요하지만 많은 사람들이 밀링기가 필요하기 때문입니다. 이로 인해 회사들이 근처 창고에 세탁기를 대량으로 비치하기가 더 쉽고 저렴해집니다.

# 플라스틱 조달

<div class="content-ad"></div>

필라멘트가 더 이상 구할 수 없어지기 전에, 저는 얼굴 방호대를 출력하고 기부했어요.

도시 내 플라스틱 공급업체들에게 전화를 걸어보니, ABS 추출 등급 플라스틱 펠렛을 1kg 당 $1.40에 공급할 수 있다고 말했어요. 최소 구매량은 25kg입니다.

자동차 제작 소매업체에게 그들의 플라스틱 공급업체 연락처를 요청할 수도 있고, 이들이 당신을 위해 공급 업체를 통해 추가 구매할 의사가 있을 수도 있어요.

이러한 펠렛은 보통 추출 공정을 통해 파이프, 막대, 시트를 제조하는 데 사용됩니다. 어떤 플라스틱 공급업체에서나 구할 수 있어요.

<div class="content-ad"></div>

![image](/assets/img/2024-06-19-Part1Makeyourfilamentathomeforcheap_0.png)

## 지구 지키기

장기 계획은 재활용업체로부터 재생 플라스틱 펠릿을 구매하여 버진 플라스틱 펠릿과 60:40 비율로 혼합하고 생산된 필라멘트를 전자 상거래 웹사이트에서 판매하는 것입니다. 또한 지역 사회가 자신들의 플라스틱 폐기물을 필라멘트로 재활용할 수 있도록 도와주기 위해 기계를 만들 수 있습니다. 가끔 재활용한 플라스틱은 구조적 특성을 잃기도 합니다. 그래서 버진 플라스틱과 혼합하는 것이 중요하지만 약간 약한 플라스틱은 강도가 크게 필요하지 않은 3D 프린팅 부품에도 적합합니다. 그러나 100% 버진 플라스틱으로 필라멘트를 만들면 생산된 필라멘트는 우수한 강도를 가집니다.

## 왜 ABS인가요?

<div class="content-ad"></div>

아마도 추출하기 가장 쉬운 플라스틱 중 하나일 것이며 어디에서나 구할 수 있습니다. 이 플라스틱으로 필라멘트 추출 방법을 익힌 후에 PLA로 넘어갈 거예요.

그리스 연구자들이 ABS 필라멘트 재활용의 영향을 결정했습니다.

# PLA는 어떤가요?

드디어 성공했어요. 현지 공급 업체는 PLA 펠릿을 판매하지 않았지만 대부분 PLA 필라멘트는 NatureWorks Ingeo를 사용하여 만들어진다는 사실을 알게 되었어요. 그들은 제게 Ingeo 3D870 등급을 25kg당 $2.75에 판매하기로 했고, 최소 구매량은 25kg입니다. 저희가 해야 할 일은 이 양식을 완성하는 것뿐이에요: [양식 링크](https://natureworks.wufoo.com/forms/zzcwkzh1m84da3/). 근처를 둘러보면 NatureWorks의 현지 유통업체를 찾을 수도 있습니다. 그러면 교육용 샘플을 요청하는 것이 아니라 문제없이 구매할 수 있어요. 그래도 저는 아직 대학생이라 샘플을 얻는 것이 쉬웠어요. 물건은 네브래스카주 Blair에서 배송되며 배송비는 별도로 청구됩니다.

<div class="content-ad"></div>

# Extruder

이제 필요한 것은 이 펠렛에서 필라멘트를 만들어낼 수 있는 기계입니다. 원칙적으로 extruder는 매우 간단합니다. 아래 산업용 extruder 다이어그램을 참고해보세요. 저희의 extruder는 냉각 팬 및 다이를 빼고 이것과 똑같을 것입니다. extruder를 만드는 데 필요한 구성 요소는 몇 개뿐인 것을 볼 수 있습니다.

![extruder](/assets/img/2024-06-19-Part1Makeyourfilamentathomeforcheap_1.png)

이 작업은 Extrusion이라는 과정을 통해 이루어집니다. 펠렛을 entee funnel이라고도 하는 hopper에 넣습니다. 거기서 펠렛은 나사에 의해 밀려 들어가 밀립니다. 그러면 열매 운동에 의한 나사 이동과 barrel 벽에 가해지는 열에 의해 압축되어 녹습니다.

<div class="content-ad"></div>

마침내, 노즐을 통해 강제로 밀어 넣고 차가운 물에 두 개의 롤러에 의해 끌려갑니다. 지름을 제어하는 것은 끌어당기는 속도이므로, 제조된 필라멘트의 지름을 공급하고 끌어당기는 모터 속도를 제어하는 PID 컨트롤러가 필요합니다. 풀러에는 NEMA 23 모터가 필요합니다.

필라멘트를 감는 스풀을 회전시키는 필라멘트 감아모터에도 또 다른 NEMA 23 모터가 필요합니다.

나사를 구동하기 위해서는 이 과정에 대한 고출력과 저속이 필요하며, 그것이 기어박스의 역할입니다. 기어박스는 모터의 속도를 줄이고 토크를 증가시킨 후에 나사에 연결됩니다.

나사 공급업체에게 이 과정에 `100 rpm만 필요하다고 말을 듣고, 가공된 플라스틱 5kg 당 1마력의 모터가 있어야 한다고 알려받았습니다.

<div class="content-ad"></div>

시스템이 소비하는 총 전력은 얼마인가요? 나는 히터와 모터가 소비하는 전력만 측정했는데, 3킬로와트를 소비하고 있는 것 같아요. 5kg 필라멘트를 생산하기 위해 전기를 사용하면 대략 50센트 정도 드는 것 같아요. 만약 PLA를 만든다면, 전환할 때 동일한 전력을 사용하여 2.5kg PLA 필라멘트만 생산할 수 있으므로 두배로 비용이 들어요.

이 시스템을 사용하여 5kg ABS 필라멘트의 총 비용은 $7.50 입니다 (전력 및 펠릿 가격 포함).

이 기계를 부품으로 조립한 가격은 $600-700 정도 들었어요. 조립하는 것은 어렵지 않아요. 단지 지역에서 부품을 구하고 무거운 물품에 대한 비싼 운송 비용을 피하기만 하면 돼요. 필요한 대부분의 것들은 거의 모든 곳에서 지역적으로 구할 수 있어요.

# 필라멘트 허용도

<div class="content-ad"></div>

좋은 냉각(냉수), 나사의 일정한 속도, 일정한 용융 온도, 그리고 풀러 롤러용 좋은 PID 컨트롤러 튜닝이라면 직경에서 최상의 일관성을 달성할 수 있습니다. 충분한 모터 토크나 열 처리가 없다면 모터가 멈출 수 있고 나사 속도가 변할 수 있습니다. 온도를 일정하게 유지하면 점도 일관성을 유지할 수 있습니다. 압력/온도의 소량의 변동은 풀러 롤러가 통제하여 목표 직경 달성을 돕습니다.

고분자는 특정 열을 높게 가지고 있어 냉각이 오래 걸립니다. 필라멘트를 충분히 빨리 냉각하지 않으면 후에 심어질 수 있어 필라멘트 직경이 일정하지 않게 될 수 있습니다.

도움이 필요하시면 인스타그램에서 연락해주세요: "alex4core"

업데이트: 순수 이익으로 140,000달러를 달성했습니다.

<div class="content-ad"></div>

# Part 2
