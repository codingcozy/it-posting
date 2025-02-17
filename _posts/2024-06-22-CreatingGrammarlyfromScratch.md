---
title: "Grammarly를 처음부터 만드는 방법 한글로 상세하게 알아보기"
description: ""
coverImage: "/assets/img/2024-06-22-CreatingGrammarlyfromScratch_0.png"
date: 2024-06-22 21:20
ogImage:
  url: /assets/img/2024-06-22-CreatingGrammarlyfromScratch_0.png
tag: Tech
originalTitle: "Creating Grammarly from Scratch"
link: "https://medium.com/ai-advances/creating-grammarly-from-scratch-f3a12f140bd1"
isUpdated: true
---

LLM (Language Model)의 완전한 구현과 API, 프런트 엔드, 그리고 간편한 모니터링을 통해.

![이미지](/assets/img/2024-06-22-CreatingGrammarlyfromScratch_0.png)

참고: 이 Grammarly 복제품은 덴마크어로 제작되었습니다. 제작된 정확한 모듈은 덴마크어에 특화되어 있지만, 방법론과 구현은 다른 언어로 전환 가능해야 합니다.

내 지식상, 다른 언어를 위한 Grammarly의 완전한 복제본을 만들어 다른 사람들이 배울 수 있도록 그 과정을 문서화한 사람은 없는 것 같아요. 적어도 제가 찾은 바로는요. 그래서 제가 직접 시도해 보기로 결정했어요. 쉽지는 않지만 안정적이고 가치 있는 상태로 이끌어낼 수 있을 거라고 생각해요.

<div class="content-ad"></div>

이 글은 좀 길 거에요. 최대한 장을 나눠서 구성했어요. 필요한 부분을 읽고, 흥미 없는 부분은 건너뛰셔도 돼요. 시작해볼까요?

이 내용을 읽을 때, 프로젝트가 완성되기까지 약 18개월이 걸렸다는 걸 염두에 두시면 좋아요. 그래서 어떤 부분은 빨리 끝난 것처럼 보일지라도, 한 달 또는 두 달이 걸렸다고 가정하셔도 돼요 :-).

# 0. 아이디어

Grammarly의 완벽한 복제품을 만드는 것은 불가능하고 목표도 아니에요. 제가 흥미를 느끼는 건 핵심 기능을 재구축해보고 그 작동 방식을 파악하는 거에요. 그래서 여기서의 주요 목표는 다음을 이해하는 것이에요:

<div class="content-ad"></div>

- 철자 교정, 간단한 문법 규칙, 그리고 문장부호에 도움이 되는 간단한 체커를 만들기
- 더 많은 문제를 더 나은 방식으로 해결하기 위해 큰 모델 구축하기 (철자 교정, 문장부호, 또는 다른 것)
- 사용자가 프로젝트와 상호 작용할 수 있는 간단한 UI 개발하기
- 모든 것을 웹과 클라우드에서 작동하도록 연결하기

# 1. 시작하는 곳은 어디인가요?

어떤 것을 개발하기 전에, 이 프로젝트를 어떻게 구축해야 하는지 정의합시다.

실시간으로, 실수를 했던 것은 구조, 아키텍처 등에 대한 고려 없이 이 프로젝트를 완성했었다는 것입니다. 이는 큰 실수였습니다! 그래서 그 문제를 가장 먼저 해결하고, 전체 코드베이스를 2~3번 완전히 다시 작성하는 것을 줄이겠습니다.

<div class="content-ad"></div>

각 올바른 항목을 모듈로 만들어 추가, 수정 또는 삭제하기 쉽도록 구성하는 것이 아이디어입니다. 그러나 어떤 모듈이 가치를 제공할까요? 이 주제에 대해 조사한 후, 한 보고서가 주요 문제들(덴마크어)은 다음과 같습니다(특정 순서 없음):

- 구두점(주로 “,” 및 “.”)
- 대문자
- 철자
- 오잘된 시제
- 주제 부재
- 관사
- 복합어

그리고 제가 추가한 일부 작은 문제점들:

- 과도한 공백
- 중복 단어
- 명확성?

<div class="content-ad"></div>

쉬운 내용부터 시작해봐요...

# 1.1 구조 및 유틸리티

첫 시작은 간단한 모듈을 구축하는 것입니다. 이렇게 하면 구조가 작동하는지 확인한 후에 어떠한 중요한 모듈을 만들기 전에 다시 작성해야할 수도 있는 불편함을 먼저 확인할 수 있습니다. 백엔드는 Python으로 구축될 것입니다. 다른 언어로 하는 것이 더 빠를 수도 있지만, 그것이 Grammarly의 경우라고 하더라도 이미 존재하는 패키지를 사용해서 백엔드를 상당히 간단하게 만들 수 있습니다! 처음에 다룰 주제는:

- 대소문자
- 과도한 공백
- 두 번 반복되는 단어

<div class="content-ad"></div>

아직 모듈을 개발하기에 앞서, 외부 구조를 먼저 만들어봅시다. 모듈은 찾은 오류 목록을 반환할 것이므로, 이를 위한 클래스를 만들어보겠습니다. Error와 ErrorList 클래스가 만들어졌으며, 각 오류에 대한 기능과 오류 목록을 함께 추가해야 할 필요가 있습니다(utils/error_handling.py에서 확인 가능). Error 클래스는 다음과 같은 main 메서드로 요약됩니다:

```js
def to_list(self, include_type=False):
    self.is_healthy()
    if self.wrong_word == self.right_word:
        print("ALERT: Error has the same wrong and right word, therefore skipped")
        print(self.to_finalized_list())
        return None
    if include_type:
        return [self.wrong_word, self.right_word, self.indexes, self.description, self.get_type()]
    return [self.wrong_word, self.right_word, self.indexes, self.description]
```

그렇다면 오류의 유형은 무엇일까요? 같은 위치에 여러 오류가 발생하는 문제를 해결하는 데 도움이 됩니다. Grammarly는 동일한 단어에 여러 오류를 보여주지 않고 결합하기 때문에, 우리도 이와 같이 해야 합니다. error_concatenator()는 오류를 함께 결합하는 방법입니다. 이는 지루하고 번거로운 작업이지만 보람있는 과정이며, 다음과 같이 오류를 변환합니다:

```js
    [
        ",", "", [18,19],
        "'that' 앞에 쉼표가 있어서는 안 됩니다", "del_punc"
    ]
    +
    [
        "paul walker", "Paul Walker", [8,19],
        "'Paul Walker'는 대문자로 시작해야 합니다", "add_cap"
    ]

    =>

    [
        "paul walker,", "Paul Walker",
        [8,19],
        "'that' 앞에 쉼표가 있어서는 안 됩니다. 'Paul Walker'는 대문자로 시작해야 합니다",
        "add_cap"
    ]
```

<div class="content-ad"></div>

이제 색인에 대해 이야기해 봅시다. 일부 모듈은 문자에 대해 작동해야 하고, 일부는 단어에 대해 작동해야 합니다. 또 다른 문제는 일부 모듈이 예측을 하기 전에 다른 모듈에 종속될 수 있다는 것입니다. 그래서 우리는 앞단에서 오류를 쉽게 강조하기 위해 단어 인덱스를 캐릭터 인덱스로 변환하는 방법이 필요합니다. 그리고 이러한 인덱스는 각 모듈이 수정하는 입력 문장과 다를 수 있는 입력 문장을 가리켜야 합니다.

이를 달성하기 위해 IndexFinder 클래스가 만들어졌습니다. 초기화할 때 입력 문장이 제공됩니다. IndexFinder는 그런 다음 모듈 사이에서 전달되며, 필요한 경우 그들의 오류를 기반으로 문장을 변경할 수 있습니다. 필요할 때마다, 단어 인덱스를 입력 문장의 캐릭터 인덱스로 변환할 수 있습니다.

실제 모듈을 만들기 전에, 주 스크립트를 실행하여 먼저 작업해 보겠습니다. 이것은 상당히 쉽습니다. 필요한 모듈을 가져와 초기화한 후, Flask와 같은 마이크로웹 프레임워크와 함께 작동하도록 만들어야 합니다. index 함수는 다음과 같이 보여야 합니다:

```js
app = Flask(__name__)
CORS(app)
@app.route("/", methods=["POST"])

def index():
    data = request.get_json()
    input = data["sentence"]
    output = correct_input(input)
    return jsonify(output)
```

<div class="content-ad"></div>

올바른 입력 함수를 사용하면 우리가 원하는 대로 문장을 수정할 수 있습니다. CORS는 프론트엔드가 백엔드에 연결할 수 있도록 하는 데 필요합니다. Flask는 완전한 프로덕션 환경에는 적합하지 않을 수 있지만, 지금은 작동해야 합니다. 만약 이를 배포하고 적절한 트래픽을 받는다면, 이 부분은 개선되어야 할 것입니다.

## 1.2. 얼마나 어려울까요?

첫 번째 모듈은 과도한 공백입니다. 일부 공간(그리고 여러분의 시간)을 보존하기 위해 코드에 대해서는 자세히 설명하지 않겠습니다. 모든 모듈의 아이디어와 기능을 어떻게 달성할 것인지에 대해 설명하겠습니다. 이 모듈은 매우 간단합니다. 앞뒤로 나열된 공백을 제거하고 싶습니다. 앞에서부터 뒤로 모든 문자를 확인합니다. 공백이 나타나면 삭제하라고 제안합니다. 뒤에서부터 앞으로 반복합니다. 그런 다음 각 문자를 확인합니다. 여러 개의 공백이 있다면 하나의 공백으로 바꾸라고 제안합니다.

다음은 복합어입니다. 문장에서 "I really really like a a cake"와 같이 적용할 수 있습니다. 이겢 수 있는 단순한 오류들 중에는 발견하기 어려운 경우도 있습니다. 또한 같은 단어가 두 번 연속으로 나타나야 하는 경우도 있을 수 있습니다. 이를 찾으려면 대량의 텍스트를 조사해야 합니다. 덴마크어에서는 Gigaword를 사용했지만, 영어에서는 Wikipedia, nltk 및 Spacy를 포함한 다양한 옵션이 있습니다. 대량의 텍스트를 여러 번 조사해야하니 적절한 것을 찾으시길 바랍니다. 신문, 연구 보고서 등과 같이 이상적인 고품질로부터 가져오는 것이 좋습니다.

<div class="content-ad"></div>

이제 이를 살펴보고, 한 단어가 두 번 연속으로 나타나는 모든 이벤트를 저장하고 확인에서 제외하세요. 또한, 이름을 수정하고 싶지 않은 경우가 있으니 명명된 entity 목록을 가져와서 제외하세요. 이 모듈로는 여기까지입니다.

이 섹션의 마지막 모듈은 대소문자화입니다. 앞서 말한 명명된 entity 목록을 가져와야 합니다. 이제 모든 단어를 살펴보고, 이전 단어가 마침표를 가지고 있다면, 이미 대문자화 되어 있지 않다면 대문자화를 제안하세요. 만약 단어가 명명된 entity 목록에 있다면 대문자화를 제안하세요. 또한, 이 모듈은 기준을 충족하지 않는 단어는 대문자화하지 말아야 합니다. 이제 이 모듈은 문장이 그 모듈의 결과로 변경될 수 있기 때문에 구두점 이후에 있어야 할 중요한 사항입니다.

# 1.3 Named Entity Recognition

이제, 앞에서 언급한대로, 명명된 entity가 무엇인지 파악해야 합니다. 또한, 각 단어의 품사를 알아내야 합니다. 다행히도, 이것은 새로운 것이 아니며 이미 여러 NLP 라이브러리에서 구현되어 있으므로 빠르게 가져와서 사용하면 충분할 것입니다. 영어 모델은 Huggingface, nltk 및 Spacy에서 사용 가능하니 선호도에 따라 선택하세요.

<div class="content-ad"></div>

메인 함수의 시작 부분에 NER 및 POS 태거(각각 다를 수 있습니다)를 실행하여 나중에 사용할 수 있도록 해보세요. 대문자 및 복합 단어 모듈에서 NER가 예상대로 작동하는지 확인해보세요.

# 1.4 이제 재미있는 부분으로: 모델 훈련

아니면 거의 그쯤이죠. 모델을 훈련하기 전에 데이터가 필요합니다. 이전에 언급한 소스들을 기억하시나요? 이제 그것들을 잘 활용할 시간입니다. 중요한 점은 충분한 양뿐만 아니라 품질이 매우 뛰어난 텍스트를 찾는 것입니다. 문법 오류가 극히 낮은 것을 확인하려면 직접 일부 내용을 확인해보세요.

우리가 만드는 데이터셋은 선택한 모델에 적합해야 합니다. 처음 해결해야 할 문제는 구두점입니다. 따라서 무엇을 하기 전에 사용할 적절한 모델을 결정해야 합니다.

<div class="content-ad"></div>

# 1.5 적합한 모델 선택

딥러닝 모델의 NLP 공간은 번창하고 있으므로 사용할 수 있는 모델이 많습니다. 적어도 영어로는 그렇죠. 일반적으로 이 문제를 다루는 두 가지 방법을 볼 수 있습니다 (다른 생각이 떠오르면 저에게 연락해 주세요!)

- Seq-2-seq: 모델에 문장을 제공하면 모델이 문장에 구두점과 함께 반환합니다. 데이터셋은 문장 간에 있어야 하며 품질이 높은 많은 데이터가 필요합니다. 구두점을 찾아 잠재적 제안의 인덱스를 반환하는 것이 어려울 수 있습니다.
- BERT: 모델에 문장을 제공하면 분류된 결과를 반환합니다. 더 적은 데이터가 필요하지만 추론 속도가 느릴 수 있어 합리적인 계산 시간을 위해 더 작은 모델이 필요하지만 정확성을 유지할 만큼 충분히 커야 합니다. (Dandelion과 DistilBERT만 덴마크어로 제공되지만 RoBERTa, DistilBERT, Electra 등을 사용할 수 있습니다.)

Sep-2-sep를 통해 결과가 불충분하고 학습 시간이 지나치게 소요되어 덴마크어 미리 훈련된 BERT로 이동하기로 결정했습니다. 이후 데이터셋은 비교적 간단하게 생성할 수 있었습니다. (2024년 2월 현재, GPT의 성장이 엄청나기 때문에 실제로 seq-2-seq가 적합한 해결책이 될 수 있으므로 꼭 Huggingface를 확인해보세요!)

<div class="content-ad"></div>

데이터셋을 생성하기 전에, 스코프를 결정해 보겠습니다. 여기서 스코프란 입력 문장의 크기를 의미합니다. 좌측에 x개 단어, 우측에 y개 단어를 제공합니다. 중간 단어 뒤쪽에서 문장부호를 예측합니다. 실시간으로 올바른 스코프를 알아내는 방법은 하나뿐인데, 그것은 '테스트'입니다! 하지만 그것은 저렴하지 않습니다. 제가 작은 실험을 통해 무슨 일이 일어나는지 확인해 보았습니다. 스코프가 작을수록 추론이 빠르고 훈련도 빠릅니다만, 정확도는 낮아집니다. 그렇기에 그것은 선이 아주 섬세합니다.

저는 처음에 BERT로 실험을 진행했지만(대부분의 결과를 여기에 남겼습니다), 빠른 추론을 위해 distilBERT로 빨리 전환하였습니다. 보통 왼쪽부터 더 많은 정보가 필요하지만, 오른쪽에서도 약간의 정보가 필요합니다. 높은 정확도를 얻기 위해, 그리고 여전히 빠른 추론을 위해 15-5가 적당한 스코프로 보입니다. 따라서 다음과 같은 문장이 주어진다면:

데이터셋은 다음과 같이 보여져야 합니다 (여기서는 3-3의 스코프를 보여주기 위해). 대문자와 문장 부호를 모두 삭제해야 합니다. 왜냐하면 이것을 알게 된다면 정확도가 왜곡되고 실제 문장을 수정할 때 적용되지 않을 수 있기 때문입니다.

![그림](/assets/img/2024-06-22-CreatingGrammarlyfromScratch_1.png)

<div class="content-ad"></div>

표 태그를 Markdown 형식으로 변경해보세요.

바로 이해하셨으면 좋겠네요.

# 1.6 훈련

사용한 데이터셋은 약 46,000,000개의 요소가 있었습니다. BERT의 저자들은 미세 조정을 위해 2~4회의 에폭이 최선이라고 언급하고 있습니다. 저는 2회의 에폭이 충분하다는 것을 발견했고, 3회 훈련을 할 경우 정확도가 매우 미세하게(~0.1%) 상승했지만 중요하지 않다고 판단했습니다. 비용에 비해 이점이 크지 않아 2회로 결정했습니다.

<img src="/assets/img/2024-06-22-CreatingGrammarlyfromScratch_2.png" />

<div class="content-ad"></div>

distilBERT은 Jarvislabs에서 6개의 A100을 대여하여 약 10시간 동안 합쳐서 약 120달러를 지불하고 학습되었습니다. 학습에 사용된 스크립트는 FineTuneModels/FineTuneBert에서 찾을 수 있습니다. 이것은 확실히 가장 저렴하거나 최선의 방법은 아니었지만 (2024년 2월 기준으로, 더 작은 규모의 학습 크기로 이러한 모델을 세밀하게 조정할 수 있는 더 저렴한 방법이 있어야 하므로 사용 가능한 옵션을 탐색할 시간을 갖는 것이 좋습니다), 작업을 완료하는 데 성공했습니다.

# 1.7 모듈로 구현하기

추론은 물론 학습과는 약간 다르지만 구현하기 어렵지 않습니다. 여기에 전체 모듈을 구현했습니다. 가장 중요한 것은 모델의 출력을 softmax로부터 argmax하는 것입니다. 3개의 값이 있는 softmax에서 가장 높은 값을 가져와야 예측할 수 있습니다. 입력 문장에서 데이터셋을 생성해야 하지만 그 외에는 어렵지 않아야 합니다:

```js
def get_predictions(self, data : string):
    dataset, split_indexes = self.get_dataset(data)
    tokenized_data = self.tokenizer(dataset, padding=True, truncation=True)
    final_dataset = Dataset(tokenized_data)
    raw_predictions, _, _ = self.trainer.predict(final_dataset)
    maxed_predictions = np.argmax(raw_predictions, axis=1)
    return maxed_predictions
```

<div class="content-ad"></div>

1. 입력문에서 데이터셋을 생성합니다, 2) 토큰화합니다, 3) 텐서 데이터셋으로 형식을 맞춥니다 (올바르게 구현하는 것이 어려울 수 있습니다. Utilities/model_utils.py 상단을 살펴보세요), 4) 모델을 실행하고, 5) 예측값을 최대화합니다.

# 1.8 추가 모듈

아직 몇 가지 모듈이 빠져 있습니다. 이 게시물의 크기를 줄이기 위해 (그래, 아마 이미 늦었을지도 모르겠네요 😅?!) 간단히 다루겠습니다.

잘못된 동사형: 이 접근 방식은 구두점과 완전히 동일했습니다. 덴마크어에서 현재형 동사의 주요 문제는 현재형 동사가 끝에 무성자음 "r"이 있어서 듣기 어려울 수 있다는 점입니다. 이를 해결하기 위해 동사가 알려지지 않은 상태에서 새 데이터셋이 생성되었습니다. 따라서 이번에는 데이터셋이 다음과 같이 보일 것입니다 (여기에 표시된 것 보다 더 많은 범위로)

<div class="content-ad"></div>

![Grammarly from scratch](/assets/img/2024-06-22-CreatingGrammarlyfromScratch_3.png)

동사의 형태를 나타내는 값입니다. 이 방법은 상당히 좋은 결과를 보여줬어요:

![Grammarly from scratch](/assets/img/2024-06-22-CreatingGrammarlyfromScratch_4.png)

이 경우, 잘못된 예측의 비율은 약 1%로 저한테는 조금 높았어요. 그래서 저는 신뢰 수준이 95% 이상인 경우에만 예측을 사용했어요 (이 모델들에 대한 확신은 아니지만 어느 정도의 추정이라고 할 수 있어요). 이렇게 하니 잘못된 예측의 비율을 약 0.4%로 줄일 수 있었고, 정확도는 2 pp만큼 감소했어요 (와우)! 🎉

<div class="content-ad"></div>

맞춤법 검사는 각자 큰 프로젝트이며 이곳에서 다루기에는 너무 많습니다. 나중에 이에 관해 다른 게시물을 작성할 계획이 있습니다. 여러 가지 방법을 시도해 봤어요: 간단한 맞춤법 검사기, n-gram, 단어 임베딩 및 GPTs 등을 사용했습니다. 결국 Peter Norvig의 간단한 맞춤법 검사기 공식과 덴마크어 철자 관련 특정 문제를 혼합하여 철자 문제의 위치를 잘 추측할 수 있었습니다. 참고로 이 공식은 놀라울 만큼 훌륭하니 꼭 읽어보시기를 추천드립니다.

주제 부족은 좀 더 현대적인 문제이지만, 이것을 조사해보는 것은 재미있게 생각했습니다. 보다 공식적인 텍스트를 작성할 때는 주어 부족이 결코 존재해서는 안 됩니다. 이 문제에 대한 만족스러운 해결책을 찾지 못했지만, 현재 주요 기능은 문장 구조가 몇 가지 하드코딩된 빈번한 구조와 일치하는지 확인하는 것입니다. 그렇다면 주어가 누락된 것을 쉽게 결정하고 제안할 수 있습니다.

기사는 덴마크어에서 영어나 기타 언어와 마찬가지로 어렵습니다. 가장 큰 문제는 일반성과 중성을 구분하여 명사를 사용해야 하는 시점의 차이입니다 (대부분의 언어는 남성과 여성을 사용하지만 본질적으로는 같은 문제입니다). 다행히, 앞서 설명한 POS 태거가 품사 분석할 때 이를 처리하기 때문에 현재 문장과 일치하는 POS 객체에서 정보를 찾아 확인하는 것만으로 간단합니다.

# 2. 프론트엔드

<div class="content-ad"></div>

휴, 그것은 힘들었죠. 이제 사용자들이 모듈을 직접 시도하고 데이터를 얻을 수 있는 곳이 필요합니다. 이것은 웹 사이트나 플러그인 중 어딘가에 배포되어야 합니다. 이것은 백엔드와 함께 어딘가에 배포되어야 합니다.

# 2.1 간단한 웹페이지

이를 수행하는 여러 가지 방법이 있습니다. React나 Angular가 그 예입니다만, 저는 순수한 html, css 및 js로 수행하기로 결정했습니다. 이것은 최고의 방법은 아니지만 사용자가 테스트할 수 있는 간단한 웹 사이트로서 제작될 것입니다(이 웹사이트는 원래 덴마크어로 되어 있었고, Google이 번역을 수행했기 때문에 완벽하지 않을 수 있습니다):

![웹페이지 이미지](/assets/img/2024-06-22-CreatingGrammarlyfromScratch_5.png)

<div class="content-ad"></div>

![이미지](/assets/img/2024-06-22-CreatingGrammarlyfromScratch_6.png)

도메인을 구입하고 Github 레포지토리에 연결하였으며, Github 페이지를 통해 사이트를 런칭했어요. 정적 사이트를 개발하는 장점이에요. 만일 몇 가지 프레임워크를 사용한다면, Vercel은 호스팅할 수 있는 방법일지도 모르겠어요.

한 가지 집중한 점은 지속적인 수정과 텍스트를 작은 조각으로 나눌 때에 있었어요. 처음에는 서비스가 너무 느리다는 피드백이 있었어요. 이는 주로 BERT로 인한 문장부호로 어렵게 최적화된 이유에 있었어요. 대신 입력을 작은 조각으로 나누기로 결정하여 수정이 시간을 두고 사용자에게 제공되도록 하기로 했어요. 이는 사용자 경험을 향상시키는 것으로 보였어요. 텍스트가 변경되었는지 지속적으로 확인하여 사용자가 텍스트를 변경하고 웹페이지의 텍스트 편집기에서 실시간 피드백을 받을 수 있도록 했어요.

# 2.2 전부 함께 모으기

<div class="content-ad"></div>

그래서 이를 호스팅할 곳이 필요합니다. 프론트 엔드는 무료로 Github 페이지에 호스팅되어 있습니다. 백엔드에는 몇 가지 옵션이 있습니다. 문제는 Azure, AWS 또는 GCP를 사용하는 경우 함수 앱 / 람다 함수 / 클라우드 함수가 될 수 없다는 것입니다. 모델 및 큰 사전이 작동하려면 이러한 모듈을로드해야 하기 때문입니다. 이는 약 15초 정도 소요되므로 각 요청마다 일어날 수 없습니다.

VM을 임대하는 것이 저의 선택이었습니다. 구글이 가장 낮은 가격을 제공했기 때문에 그 과정이 전부 구글에 달렸습니다(월 200달러). 이에 대한 더 나은 해결책이 있을 것이라고 생각되므로 여기에는 개선할 공간이 분명히 있습니다. Google VM에 간단한 Flask 앱을 설정하는 것은 비교적 쉽지만, 새 코드를 업로드하고 프로덕션 환경에 배포하기 위해 일부 gcp cli 명령어를 찾고 있을 수 있습니다. 그래서 다음 사항을 염두에 두세요:

        gcloud builds submit --tag _bucket_or_vm_name_
        gcloud run deploy --image _bucket_or_vm_name_ --platform managed

*bucket_or_vm_name*라는 부분은 'gcr.io/grammatiktakbackend/index'와 같이 나타나야 합니다. 프론트 엔드가 요청을 보낼 수 있도록 Python 스크립트에서 `CORS(app)`를 사용하여 Cors를 활성화해야 합니다. 보안상의 이유로 요청의 경우 프론트 엔드만 화이트리스트에 추가하는 것이 좋습니다. GCP를 사용할 때 이는 그들의 플랫폼에서 수행할 수 있습니다.

<div class="content-ad"></div>

# 2.3 프로덕션에서의 드리프트와 정확성에 대해 얘기해 볼까요?

웹사이트 하단에 피드백을 남길 수 있는 옵션이 있다는 것을 눈치 채셨을 수도 있습니다. 우리는 프로덕션에서의 드리프트 문제와 모듈이 실제로 얼마나 잘 작동하는지 정확히 모르는 문제를 함께 겪고 있습니다. 먼저, ModuleTracker가 만들어져 각 모듈(시간 및 수정사항)을 요청별로 추적하고 결과를 프론트 엔드로 다시 전송하기 전에 저장소에 업로드합니다. 저장소로는 Google Firestore를 사용했습니다. 사용된 저장소에 비해 비용이 비싸지만 유연하고 확장 가능한 NoSQL 데이터베이스입니다.

피드백에 대해서는 높은 보안을 보장하기 위해 정보를 백엔드로 보내고 그 후 저장소로 전송합니다. 이미 활성화되어 있는 저장소에 연결이 빠르게 이뤄지며 VM의 비용을 증가시키지 않지만 최적화가 필요한 지점입니다.

마지막으로, 마지막 수정이 처리될 때 수락되거나 거부된 수정사항에 대한 정보를 전송할 수 있습니다. 이제 이 모든 준비가 끝났으니, 어떤 모듈이 가치를 제공하고 수용 가능한 시간 내에 그것을 수행하는지 측정하기 위해 데이터를 쉽게 추출할 수 있습니다. 이제 분석하고, 그리고 모듈을 개선하거나 삭제하거나 추가하여 서비스를 향상시킵니다.

<div class="content-ad"></div>

# 3.1 Word 추가 기능

웹 사이트 외에도 서비스를 통합하여 사용할 수 있는 방법을 찾았습니다. 그래서 Grammarly가 워드에서 작동하는 것과 같은 방식으로 Word 추가 기능을 개발하기로 결정했습니다. Google 문서의 API는 굉장히 느립니다. 그래서 처음에는 Google 문서에 구현할 수 있는 방법이 없었습니다. Word 추가 기능은 로컬에서 작동하지만, 공개적으로 사용할 수 있도록 하는 노력을 하지는 않았습니다. 다시 시도해본다면, 여러 앱과 함께 작동할 수 있는 데스크탑 응용 프로그램을 개발하겠다고 생각합니다. 이렇게 하면 Word와 작업할 때 더 유연성을 제공할 수 있을 것입니다. 추가 기능 프레임워크가 약간 구식이고 오래되었다고 느껴집니다.

# 3.2 고품질 데이터셋

고품질의 덴마크어 데이터셋이 많지 않기 때문에 제가 직접 텍스트를 리뷰하여 모듈 테스트에 사용하기 위한 데이터를 만들었습니다. 훈련 데이터셋은 /DataProcessing 폴더에서 파일을 실행하여 생성할 수 있습니다. 모듈의 오류 수정에 사용되는 데이터셋 및 사전은 /GrammatiktakBackend/Datasets에서 찾을 수 있습니다. 테스트 데이터셋은 GrammatiktakDatasets 리포지토리에서 찾을 수 있습니다.

<div class="content-ad"></div>

# 4. 마무리

크레딧: 많은 사람들 덕분에 이 프로젝트가 성사되었습니다. 그들은 자신의 지식, 모델 및 데이터를 모두가 사용하기 쉬운 형식으로 자유롭게 제공했습니다. 그들에게 큰 감사를 표하고 싶습니다! 그들은 이 프로젝트에 참여하지 않았으며 이 프로젝트와 관련된 어떤 일에 대해서도 책임을 지지 않습니다.

- Leon Derczynski & Manuel R. Ciosici, ITU, Copenhagen: NLP 개발을 위해 Gigaword.dk에서 뛰어난 대량의 덴마크어 텍스트 컬렉션을 공유한 분들에게 감사드립니다.
- Anita Ågerup Jervelund, dsn.dk: 덴마크어 초/중등학교의 철자 및 문법 오류에 대한 지식을 이 멋진 보고서로 공유해준 분께 감사드립니다.
- certainly.io, Certainly, Malte Højmark-Bertelsen: 덴마크어 NLP 커뮤니티를 위해 널리 사용 가능한 Danish BERT를 개발하고 교육한 분들에게 감사드립니다.

내 글을 이렇게 멀리까지 읽어 주시는 분이 있을지 잘 모르겠네요. 만약 이 글을 끝까지 읽으신 분이 있다면, 정말 감사합니다! 궁금한 점이 있으시면 트위터로 연락해주세요. 앞으로의 모든 일에 행운을 빕니다!
