---
title: "포인트 클라우드 시각화 및 렌더링을 위한 블렌더 핸드북"
description: ""
coverImage: "/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_0.png"
date: 2024-06-22 16:51
ogImage:
  url: /assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_0.png
tag: Tech
originalTitle: "The Blender Handbook for 3D Point Cloud Visualization and Rendering"
link: "https://medium.com/towards-data-science/the-blender-handbook-for-3d-point-cloud-visualization-and-rendering-1700ebe69c7b"
isUpdated: true
---

## BLENDER

이 튜토리얼에서는 대량의 포인트 클라우드 데이터 세트를 조작하고 시각화하는 데 최고의 3D 도구 중 하나를 활용하는 방법에 대해 채우고자 합니다.

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_0.png)

이 도구는 Blender라고 합니다. 다양한 데이터 시각화 기술을 실험하여 복잡한 분석 시나리오에 대응할 수 있습니다. 그리고 이것이 바로 저희를 함께 모이게 한 이유입니다.

<div class="content-ad"></div>

블렌더의 확장된 데이터 시각화 능력과 결합하여 리얼리티 캡처 데이터셋(포인트 클라우드 형태)을 처리하는 최상의 기본적인 워크플로우는 무엇인가요?

🦊Florent: 리얼리티 캡처는 상당히 혼란스러울 수 있는 "새로운" 용어로, 몇몇 소프트웨어와 회사들이 이 용어에서 이름을 딴 것을 알 수 있습니다. 이 "전문 분야"를 "3D 맵핑"의 특화된 분야로 볼 수 있으며, 목표는 LiDAR나 패시브 카메라(포토그래미터리와 3D 컴퓨터 비전을 통해)와 같은 다양한 센서를 사용하여 실제 세계의 3D 기하학을 캡처하는 것입니다. 이 과정을 보여드리는 기사는 여기에서 확인하실 수 있습니다: 포토그래메트리를 활용한 3D 재구성 가이드

이 가이드에서는 아래에 설명된 9단계의 프로세스로 나누어 설명하고 있습니다.

<div class="content-ad"></div>

다음은 데이터 시각화를 위한 분석 내용으로 여러 경로 추출 시갠 제품을 생성하도록 해줍니다. 하지만 바로 시작하기 전에, 데이터 시각화에 대해 어떻게 생각하시나요?

🎵 독자분들께: 이 실전 안내서는 UTWENTE의 F. Poux 및 P. Raposo 공동 저자와 함께 작업한 결과물입니다. 트웬테 대학교 ITC 학부에서 부여된 ITC -프로젝트에서 디지털 트윈스로부터의 재정적 기여를 인정합니다. 모든 이미지는 Florent Poux의 저작권 소유입니다.

# 데이터 시각화를 위한 분석

<div class="content-ad"></div>

무언가를 생각할 때 어떤 시각적 표현을 만들어 놓는다고 느끼시나요? 희귀종인 나르월(Monodon monoceros) 같은 것을 언급한다면 이미 알고 있는 "데이터/지식 점"이 있다면, 바로 이 '바다의 유니콘'으로 불리는 이 생물의 긴 나선 모양의 엄니를 떠올리게 될 것입니다.

🦊 Florent: 요즘 나르월에 좀 관심을 갖고 있어요 🦄. 직접 본 적은 없지만, 이제 북극 바다인 캐나다와 그린란드 인근으로 가야 이 아름다운 생물들을 발견할 수 있는 기회가 된다는 걸 알았어요. 그들은 '떼'를 이루는 사교적 동물로 발견되며 굉장한 다이빙 능력을 갖고 있다고도 배워요. 1.5분 정도 밑물에 참는다고 해도 행복한데; 나르월은 1,500m(4,921피트) 깊이까지 다이빙 하며 종종 25분 이상 숨을 참을 수 있다고 해요. 정말 멋진 힘이에요!

그리고 이것은 우리에게 얼마나 본능적으로 "데이터 시각화"가 중요한지를 보여줍니다. 우리는 강력한 능력을 갖고 있어서 다양한 주제를 시각적으로 지원하여 종합하거나 표현할 수 있어요. 분석 작업의 경우, 아래에 나와 있는 것처럼 이러한 '지원'과 그 범위를 구체화할 수 있습니다.

하지만 더욱 강력한 건 현대 컴퓨팅 시스템을 통해 실제 물체를 나타내는 3D 지오메트리와 속성을 다루는 능력입니다. 실제로, 이것은 우리가 좀더 관련성을 갖고 설정한 목표에 맞는 더 나은 시각화를 만들 수 있도록 하는 필수적인 도구로 작용합니다.

<div class="content-ad"></div>

그리고 중요성에 대해 이야기할 때, 자크 베르탱(1918~2010)에 대해 들어보셨나요? 벨기에 가수 자크 브렐이나 프랑스 전 대통령 자크 시라크, 해군 장교 자크 쿠스토가 아니라 자크 베르탱에 관해 한 번 이야기해 보렐까요?

## 베르탱의 시각 변수

우리가 지리 공간 맥락에 둔 발코니 데이터 시각화에 대해 이야기하는 것은 어려운 일입니다. 그리고 베르탱의 시각 변수를 논하지 않고 싶진 않습니다. 이들은 프랑스 지도 제작자 자크 베르탱에 의해 소개된 기본적인 속성들로, 데이터를 그래픽적으로 나타내는 데 사용될 수 있습니다. 이들은 정보를 시각적으로 명확하고 효과적으로 인코딩하는 방법을 제공합니다. 아래에 이러한 변수들을 요약한 그림이 있습니다.

이 시각 변수들은 매력적인 시각화를 디자인하기 위한 구조화된 프레임워크를 제공합니다. 이러한 변수들을 전략적으로 선택하고 결합함으로써, 우리는 복잡한 정보를 효과적으로 전달하는 시각적 표현물을 만들어 낼 수 있습니다. 이를 통해 시청자가 데이터를 이해하고 해석하기 쉽게 만들어줍니다.

<div class="content-ad"></div>

🦊 플로랑: 내가 너의 마음에 이 작은 씨앗을 심음으로써, 너가 이 글을 읽으면서 다양한 렌더링 옵션들과 놀면서 변수가 데이터 시각화 제품의 목표에 전달되는 메시지에 어떻게 영향을 미치는지에 대해 어떤 평행을 유발할 수 있기를 바란다!

그리고 이제, 더 이상 말미암은 것 없이, 엄청난 시각화를 만드는 시간이다. 준비되었나요?

# 단계 1. 블렌더 환경 설정하기

우리의 환경을 설정하는 것으로 시작해보겠습니다. 이를 위해 브라우저를 열고 Blender를 검색하세요. Blender 웹사이트에 도착하면 다운로드 섹션으로 이동하여 Blender를 다운로드하세요.

<div class="content-ad"></div>

![image](https://miro.medium.com/v2/resize:fit:1400/1*Duf49e4mj8YYS2Bj9S2wJg.gif)

Blender의 버전은 적어도 3.6 이상이어야 합니다. 이 버전은 특히 포인트 클라우드에 대한 몇 가지 조정이 있습니다.

🦊 Florent: 낮은 버전을 사용 중이라면 이 튜토리얼에서 사용할 몇 가지 포인트 클라우드 가져오기 함수를 놓칠 수 있습니다. 그러나 낮은 버전을 사용한다면 함수를 직접 작성할 수 있지만, 이로 인해 이 튜토리얼의 범위가 확장되고 다른 세션에서 보여줍니다. 더 높은 버전인 4.0과 같은 경우에는 과정이 더 간단합니다.

OS에 Blender 3.6.4 이상을 성공적으로 다운로드했다면, 설치를 해보세요. 이 튜토리얼에서는 Windows를 사용하겠지만, Linux나 MacOS에서도 동일하게 작동해야 합니다. Blender를 설치했다면, 두 번째 단계로 넘어가서 3D 포인트 클라우드 데이터셋을 수집할 차례입니다.

<div class="content-ad"></div>

# 단계 2. 3D 포인트 클라우드 전처리

우리는 중요한 장면의 포인트 클라우드 데이터를 수집해야 합니다. 오늘은 제가 친구 로만 로브룩과 함께 촬영한 오래된 공장을 가져왔어요. 아래의 안내서는 포토그램메트리와 LiDAR 처리를 사용하여 데이터셋을 얻는 방법을 설명합니다.

데이터 전처리 단계를 돕기 위해, 이미 "PLY" 파일 형식으로 준비된 포인트 클라우드 데이터를 제공해드렸어요.

🦚 참고: "PLY" 파일 형식은 "다각형 파일 형식"을 나타내며 3D 기하학 데이터를 저장하는 데 널리 사용됩니다. 이 형식은 Stanford 대학의 Greg Turk와 Marc Levoy에 의해 개발되었으며 3D 모델을 정점(공간상의 점)과 다각형(일반적으로 삼각형 또는 사각형이지만, 다른 다각형 유형도 사용할 수 있음)의 집합으로 표현할 수 있습니다. 이는 다양하며 각 정점 또는 면과 관련된 데이터 속성 범위를 지원하며 색상, 법선 벡터, 텍스처 좌표 등을 포함할 수 있습니다.

<div class="content-ad"></div>

포인트 클라우드의 경우, 우리는 얼굴이 없고 점만 가지고 있습니다. 이 점들은 공간에서의 x, y, z 좌표로 정의되는 3D 점들입니다. "PLY" 파일을 준비할 때, 각 점이 연관된 하나의 추가 속성(색상)을 가지도록 합니다.

🦊Florent: "PLY" 파일은 ASCII 및 BINARY 형식으로 제공됩니다. ASCII PLY 형식은 데이터를 평문으로 표현하여 사람이 읽을 수 있지만 파일 크기가 커질 수 있습니다. BINARY PLY는 이진 인코딩을 사용하여 파일 크기를 줄이지만 사람이 읽을 수 없는 내용을 가지고 있습니다. 양식을 사용하면 파일이 어떤 내용을 포함하고 있는지 빠르게 파악할 수 있으며, 이는 각 정점의 수와 관련된 속성의 유형 등을 나타냅니다.

그러나 데이터셋을 캡처한 후, 추가 단계를 거쳤습니다: 시나리오 내의 구성 요소를 구분하기 위해 비지도 분할 체계를 적용했습니다.

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_2.png)

<div class="content-ad"></div>

초기 장면을 하위 요소로 효율적으로 분할해서 관심 지점을 담고 있는 "레이어"로 데이터를 준비할 수 있었어요.

구분된 포인트 클라우드 결과물은 드라이브 폴더에서 찾을 수 있어요. 각 클라우드는 색상이 있는 PLY 파일이에요: [드라이브 폴더](Access to the Drive Folder)에서 확인할 수 있어요. 이 폴더에는 1에서 9까지 번호가 매겨진 아홉 개의 포인트 클라우드가 들어 있어요. 각각이 장면의 일부를 갖고 있어요.

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_3.png)

이 분할된 요소를 사용하기 전에, 전체 포인트 클라우드를 하나의 entity로 내보내기도 했어요. 여기서 다운로드할 수 있어요: [포인트 클라우드 데이터 다운로드](Point Cloud Data Download).

<div class="content-ad"></div>

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_4.png)

Step 3 이동 전에 전체 포인트 클라우드 데이터 세트를 다운로드하여 전체 장면을 설정합니다.

# Step 3. Blender에 포인트 클라우드 가져오기

이제 3D 데이터 세트와 Blender가 모두 설치되었으므로 사용할 시간입니다!

<div class="content-ad"></div>

🦊Florent: 블렌더 내에서 3D 포인트 클라우드를 가져오는 것은 도전적일 수 있으며, 최상의 및 가장 빠른 방법을 찾는 데 시간이 걸렸어요. 그러나, 적어도 10시간 이상의 복잡한 시행착오를 거칠 필요 없이 작동하는 방법을 발견했답니다. Blender 버전 (3.6.4+)을 사용하면 색상 정보가 포함된 포인트 클라우드를 가져올 수 있게 되었는데, 이전에는 불가능했어요.

Blender 3.6을 실행하려면, 프로그램을 그냥 열어주세요. 안으로 들어가면 작은 팝업 창에 버전 번호가 표시되어 있을 거예요 (제 경우엔 3.6.4로 보였어요). 이 창을 닫으려면 화면 어디든 클릭하세요. Blender에 들어가면 3D 씬 안에 자신을 발견하게 될 겁니다. 이 씬에는 큐브, 카메라, 그리고 빛(보기 어려울 수 있어요)이 포함되어 있어요. 카메라 관점에서 씬을 탐색하려면 휠을 클릭하고 드래그하여 중심 지점 주변을 회전하세요. (카메라를 옆으로 이동시키려면) 휠을 끌면서 Shift 키를 누르세요.

아래와 같이 표시된 바와 같이, 시작하기 전에 큐브를 선택하고, 이 시나리오에 사용되지 않을 것이기 때문에 삭제하세요.

![image](https://miro.medium.com/v2/resize:fit:1400/1*A8Ih-UvMf1OViKKcwz7k3Q.gif)

<div class="content-ad"></div>

![이미지](https://miro.medium.com/v2/resize:fit:1400/1*3Q10Ik1O01ccdsxOVjD0Sg.gif)

그런 다음 `파일`로 가서 “실험적 Stanford .PLY” 옵션을 선택하여 아래와 같이 포인트 클라우드를 가져올 수 있습니다.

🦊Florent [업데이트]: 최신 버전의 Blender 4.0+에서는 비실험적인 Stanford PLY (.ply)를 사용할 수 있습니다. 이제 이 실험적 기능을 통합하고 RGB 정보를 읽을 수 있습니다.

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_5.png)

<div class="content-ad"></div>

이제 이전에 다운로드한 .PLY 데이터 세트를 가져올 수 있습니다. 파일을 클릭하여 가져오세요. 가져온 후 1500만 점의 포인트 클라우드를 로드하는 데 몇 초만 소요됨을 알 수 있습니다. 세부 사항을 더 잘 확인하려면 휠을 사용하여 회전 및 확대할 수 있습니다.

<img src="https://miro.medium.com/v2/resize:fit:1400/1*jsj7jy6NgZqnQ9eCFdSlqQ.gif" />

좋아요, 이 단계에서는 블렌더 내에 포인트 클라우드가 있습니다. 그런데 이제 어떻게 해야 하죠? 블렌더에서 3D 포인트 클라우드를 가장 잘 사용할 수 있는 템플릿 레이아웃을 제공해 드리겠습니다.

# 단계 4. 3D 데이터 시각화를 위한 블렌더 UI 설정

<div class="content-ad"></div>

블렌더 UI를 초기 레이아웃보다 더 잘 정리해 봅시다. 여기서는 조금 기술적이니 충분한 집중력과 에너지가 필요할 거에요!

먼저 Geometry Node Editor를 위로 옮길 거예요. 그런 다음 화면을 두 부분으로 분할할 거에요. 이를 위해 왼쪽 모퉁이에 있는 작은 십자를 클릭하고 드래그할 거에요. 오른쪽에는 우리의 geometries에 재질을 적용하는 Shader Editor를 열거에요. 이미 Properties 메뉴가 열려 있으니 그대로 남겨둘 거에요. 왼쪽에 화면을 늘려 Text Editor와 Python Console을 열 거에요. 이렇게 하면 필요한 모든 것을 손끝에 두게 될 거에요.

🦊 Florent: 그렇습니다! 잘 읽으셨어요! 우리는 Blender 내에서 Python을 사용할 수 있어요! 정말 멋진 기능이죠. 이는 이 튜토리얼의 범위를 넓혀주며 다음 집중 에피소드에서 다룰 예정이에요.

![이미지](https://miro.medium.com/v2/resize:fit:1400/1*B2Bde5Z9sSLC4oojCbjkgg.gif)

<div class="content-ad"></div>

그럼요, 이제 시작할 준비가 모두 완료되었습니다. 우리는 포인트 클라우드를 성공적으로 로드했지만 모두 검은 색으로 보입니다. 그러나 걱정하실 필요는 없어요. 곧 이 문제를 해결할 거에요. 중요한 점은 이제 카메라, 메시 및 광원이 포함된 씬 콜렉션을 갖고 있다는 것입니다.

메시를 클릭하면 각 벡터의 위치 및 RGBA 또는 투명도 정보를 가진 16.3백만 개의 벡터를 포함하는 스프레드시트 뷰어에서 확인할 수 있습니다.

현재 모든 포인트는 재질이 없기 때문에 메시가 검은색으로 보입니다(또는 선택한 경우 주황색으로 나타날 수 있습니다).

우리의 목표는 이 메시 객체를 포인트 클라우드 객체로 변환하고 각 포인트의 색상을 읽는 것입니다. 이를 위해 지오메트리 노드를 생성할 것입니다.

<div class="content-ad"></div>

🦊Florent: 간단히 적어둡니다. Control+C 및 Control+V와 같은 키보드 바로 가기는 마우스 위치에만 작동합니다. 특정 영역에서 무언가를 복사하고 붙여넣기하려면 마우스가 해당 영역에 있는지 확인하세요.

# 단계 5. 3D 도형을 위한 Geometry 노드

Blender의 Geometry 노드는 사용자가 3D 지오메트리를 절차적으로 생성하고 조작할 수 있도록 2.93 버전에서 소개된 강력한 기능입니다. 이는 개별 정점, 에지 또는 면을 수동으로 조작하지 않고도 복잡한 3D 지오메트리를 생성, 수정 및 애니메이션화할 수 있다는 것을 의미합니다. 실제로 노드 기반 절차적 워크플로우 덕분에 전통적인 모델링 기술 대신 시각적 인터페이스를 사용하여 지오메트리를 생성하고 편집할 수 있습니다. 이제 이것을 3D 포인트 클라우드로 시험해보겠습니다.

먼저 메시를 선택한 후 Geometry 노드 창으로 이동해야 합니다. 거기서 "New"를 클릭하여 지오메트리 노드를 생성합니다. 이를 간단히 설명하겠습니다. 그것은 geometry라는 두 개의 그룹 입력과 출력으로 구성됩니다.

<div class="content-ad"></div>

"지오메트리를 수정하기 위해 "메쉬를 포인트로" 노드를 추가할 거에요. 추가하면 노드가 자동으로 연결되어, 마법같은 일이 일어날 거예요. 모든 포인트에는 공 모양의 지오메트리가 부착되고, 각 공의 반지름을 0.01 (1센티미터)로 설정하여 수정할 수 있어요. 보시다시피, 모든 포인트가 노드에 표시돼 있어요.

<img src="https://miro.medium.com/v2/resize:fit:1400/1*7Ycq0Rlt2b1TT712hE7xtA.gif" />

정말 멋지죠, 하지만 한 가지 문제가 있어요 - 이 모드에서는 색상을 볼 수 없어요. 걱정하지 마세요, 이건 정상이에요! 블렌더에는 쉐이딩, 솔리드, 소재 미리보기, 그리고 렌더링 표시 미리보기와 같은 다양한 디스플레이 모드가 있어요. 우리는 와이어프레임이 없기 때문에 (메쉬가 아니기 때문에), 거기를 클릭하면 벡터(포인트)만 표시될 거예요. 우리가 솔리드 렌더링을 보려면 적절한 디스플레이 모드를 선택해야 해요.

<img src="/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_6.png" />"

<div class="content-ad"></div>

렌더링된 디스플레이 미리보기는 재질을 설정한 후에 작동합니다. 하지만 우리는 아직 재질을 하나도 가지고 있지 않기 때문에 작동하지 않습니다. 따라서 논리적으로 다음 단계는 각 포인트에 재질을 부착하는 것입니다.

# 단계 6. 색상을 위한 쉐이더 노드

Geometry Nodes에 해당하는 것으로 Shader Nodes가 있습니다. 이들은 Blender의 재료 시스템의 기본 구성 요소입니다. 서로 다른 노드를 연결함으로써 복잡한 재료를 만들 수 있습니다. 각 노드는 재료의 외관을 나타내는 특정 측면을 대표합니다.

재질은 물체가 빛과 상호 작용하는 방식을 결정하여 외관을 부여합니다. Shader Nodes는 Shader Editor에서 편집됩니다. 이는 Blender 내에서 전용 워크스페이스로, 노드를 사용하여 재료를 만들고 편집하는 시각적 인터페이스를 제공합니다. 이제 시작해보죠.

<div class="content-ad"></div>

Shader Editor에서 "새로운 재질"을 만듭니다. "새로 만들기" 버튼을 클릭하여 'material.001'이라는 이름의 재질을 만들 수 있습니다. 이 재질에는 주요 BSDF와 재질 출력이 포함되어 있습니다. 그러나 사용하기 위해서는 몇 가지 속성을 추가해야 합니다. 속성을 추가하기 위해 "추가" 버튼을 클릭하고 "속성" 옵션을 찾습니다. 그런 다음 컬러 매개변수를 선택하고 이를 우리의 주요 BSDF의 베이스 컬러 매개변수에 연결합니다.

🦊 Florent: BSDF는 양방향 산란 분포 함수를 나타냅니다. 결국에는 특정한 광선이 주어진 각도에서 반사(산란)될 확률을 결정하는 수학적인 함수입니다.

다음 단계는 색상에 대한 올바른 속성을 읽고 설정하는 것입니다. 스프레드시트 뷰에서는 더 이상 메쉬가 아닌 "Col" 속성이 있는 포인트 클라우드 유형으로 나타납니다.

<div class="content-ad"></div>

<img src="/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_7.png" />

따라서 쉐이더 편집기 필드에서 그 이름("Col")을 사용해야 합니다. 이 단계 이후에는 아무 변화가 없는 것처럼 보일 것입니다. 이는 우리가 추가할 두 가지 요소(포인트 클라우드에 재료 설정 및 렌더링 엔진 설정)가 아직 남아 있기 때문에 예상된 동작입니다. 재료 설정부터 시작해봅시다.

## 포인트 클라우드 지오메트리 노드에 재료 추가하기

우리의 지오메트리에 새 재료를 부착하려면, "Set material"이라는 새로운 노드를 지오메트리 노드에서 만들어야 합니다. 이 과정은 간단합니다. 노드를 가운데에 놓으면 자동으로 간격을 맞출 것입니다. 그러고나서 드롭다운에서 재료를 선택하면 끝입니다.

<div class="content-ad"></div>

![image](https://miro.medium.com/v2/resize:fit:1400/1*Ph-9AagMnvT_HvdXcdv0wQ.gif)

이게 전부에요. 이제 두 번째 문제를 해결하는 데로 넘어가 봅시다: 3D 포인트 클라우드를 위한 적절한 렌더링 엔진을 설정하세요.

## 3D 포인트 클라우드를 지원하는 렌더링 엔진 설정

해당 단계를 완료했다면 여전히 화면에 아무것도 보이지 않아서 답답할 수 있습니다. 포인트 클라우드를 다루고 있기 때문에 특정 유형의 후처리 렌더러 인 Cycles가 필요합니다.

<div class="content-ad"></div>

🦊 Florent: 싸이클(Cycles)은 Blender에서 사용되는 렌더링 엔진으로 현실적인 이미지를 생성하는 데 사용됩니다. 이는 빛의 행동을 시뮬레이션하는 패스 추적 렌더러로, 반사, 굴절, 그리고 전체 조명 같은 복잡한 효과를 가능하게 합니다. 싸이클은 고품질 출력으로 유명하며 Blender에서 사실적인 장면을 만드는 데 널리 사용됩니다. 저는 정말 좋아해요.

싸이클로 전환하려면 속성 영역으로 이동하고 렌더 탭을 클릭하세요. 기본 렌더 엔진은 Eevee라고 불리지만, 이를 싸이클로 변경해야 합니다. 한 번 변경하면 다른 설정을 수정할 필요는 없지만, 과도한 렌더링 시간을 피하기 위해 30초의 시간 제한 설정을 권장합니다.

![이미지](https://miro.medium.com/v2/resize:fit:1400/1*2YlfnGW6IYTLs2C07j8fGQ.gif)

이제 렌더러를 설정했으므로 최종 결과물을 보기 위해 미리보기 렌더링을 클릭할 수 있습니다. 결과가 마음에 들지 않는다면 재미있는 상황이네요. 하하, 그것은 함정이었어요!

<div class="content-ad"></div>

시각적으로 조명이 필요합니다! 재료가 빛에 반응하는 효과를 얻기 위해 장면에 조명을 추가해야 합니다. 준비되셨나요?

# 단계 7. 3D 장면 조명 및 렌더링 설정

Blender에서 조명은 장면을 현실적으로 조명하기 위해 조명 소스를 배치하고 구성하는 것을 의미합니다. 포인트, 스폿, 선, 영역, 및 방출 소재와 같은 다양한 유형의 조명을 시뮬레이션할 수 있습니다. 뿐만 아니라, 조명의 세기, 색상, 감쇠 및 그림자 속성을 조절할 수도 있습니다. 현실 세계에서 빛이 어떻게 작용하는지 이해하고 이러한 설정을 실험하는 것은 Blender에서 강렬한 시각적 결과를 얻는 데 중요합니다. 그러므로 저는 장면에서 다양한 기하학 및 조명 소스를 다루는 데 도움을 드리겠습니다.

먼저, 조명을 선택하고 움직이기 아이콘을 클릭하여 원하는 위치로 정확히 이동시킵니다. 이렇게 하면 모든 것이 부드럽고 더 현실적으로 보이게 됩니다.

<div class="content-ad"></div>

![](https://miro.medium.com/v2/resize:fit:1400/1*_CNOkMDpuqilMNLkjkKJcQ.gif)

🦊 Florent: 신이 가려진 장면의 경우에도 빛을 배치하여 더 아름답게 보이게 할 수 있어요. 우리는 조명을 베이크된 색상 위치에 배치함으로써 탁월한 사실적인 효과를 얻을 거에요.

빛을 배치한 후, 나는 특정 각도에서 장면을 보기 위해 뷰포트 렌더링을 클릭해요. 그리고 이제.... 타다! 전체 장면이 렌더링되어 놀라운 것처럼 보여요.

![](https://miro.medium.com/v2/resize:fit:1400/1*_RuwKTykijg3v-VhZ4uISQ.gif)

<div class="content-ad"></div>

거기서는 이미 하얀색인 점들에 대한 빛 효과를 수정할 수 있어요. 빛을 움직이면 실시간으로 변화를 관찰할 수 있어요.

![image](https://miro.medium.com/v2/resize:fit:1400/1*V3x1j0z6cu7gequS7LUYpg.gif)

이 흥미진진한 기능은 3D 포인트 클라우드 데이터를 메싱 단계를 거치지 않고 직접 사용할 수 있게 해줘요. 노력을 많이 들이지 않고 일관된 시간 프레임 내에서 기본으로 사용할 수 있어요. 이 마일스톤을 달성하여 축하드려요! 다음 단계는 아직 남아 있어요.

# 단계 8. 스토리보드 정의

<div class="content-ad"></div>

좋아요, 이제 무거운 주제에 들어가 봅시다. 이 새로운 기술 세트를 구체적인 응용 프로그램에 사용해 보겠습니다: 추출 경로 계획.

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_8.png)

여기가 간략한 설명입니다. 산업 연구원이 알려준 독특한 유물을 회수하기 위해 추출팀을 이끄는 중입니다. 이 고대 유물은 양 제조 공정에 대한 새로운 비밀을 밝히는 데 중요하며, 전 세계 산업 공정을 뒤집을 수 있는 가능성이 있습니다. 문제는 해당 사이트가 매우 오염되어 있으며 목표물을 회수할 시간이 60초 밖에 없다는 것입니다.

당신의 연락망 덕분에 그곳의 3D 스캔 자료를 손에 넣었고, 이제 추출의 성공을 보장하기 위한 최적의 네비게이션 지도를 작성할 차례입니다. 이를 달성하기 위해 최초로 추출 계획에 포함해야 할 다섯 가지 주요 포인트를 포함한 명세서를 설정했어요:

<div class="content-ad"></div>

- 초기 포인트 클라우드의 다양한 (3-5) 관점 뷰
- 관심 대상의 다양한 돋보인 객체로 아티팩트의 상대적인 공간 안에 잘 배치
- 객체를 추출하기 위한 정확한 "강조" (원뿔)
- 추출 경로 정의, 위쪽에서 본 보기
- 추출 경로의 다양한 시점을 퍼스트-퍼슨으로 본 뷰

데이터 시각화 전문가로서, 자크 베르탱의 작업을 회상하고 시각 변수를 활용하여 명확한 커뮤니케이션 지원을 달성하는 데 최선을 다해보세요.

# 단계 9. 3D 씬 추출 경로 계획

프로세스를 시작하기 전에, 제 Step 2 (포인트 클라우드 사전 처리)에서 분해된 하위 요소들을 다운로드하는 것을 권장합니다. 그런 다음, 모든 포인트 클라우드를 로드하고 위에서 언급한 단계를 따라 각 포인트 클라우드를 다음과 같이 얻을 수 있습니다:

<div class="content-ad"></div>

<img src="/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_9.png" />

🦊Florent: 작업 속도를 높이기 위해 몇 가지 권장 사항을 안내해드릴게요. 먼저, 포인트 클라우드를 가져오기 전에 Scene Collection 메뉴에서 새 컬렉션을 만드세요 (우클릭 `새 컬렉션`), 그 안에 모든 포인트 클라우드를 끌어다 놓을 거에요. 가져오고 나면 전체 포인트 클라우드를 선택한 후 Geometry Node Editor에서 Geometry Nodes를 복사하세요. 그런 다음 로드된 모든 포인트 클라우드를 순차적으로 선택하여 새 Geometry Node를 만들고 미리 채워진 것을 지우고 "템플릿"을 붙여 넣으세요. 이를 모든 포인트 클라우드에 대해 반복하면 준비 완료입니다.

준비되셨으면 명세서 항목 목록을 진행할 수 있어요

## 1. 포인트 클라우드 렌더링

<div class="content-ad"></div>

다양한 관점을 생성하기 위해서는 장면을 탐색하여 교차점을 명확히 보여줄 수 있는 최적의 장소를 찾아야 합니다. 예를 들어 먼저 아래에 표시된 대로 다양한 장소에 조명을 추가해야 할 수도 있습니다.

![image](https://miro.medium.com/v2/resize:fit:1400/1*G1CAE69MWwZslrCOVymaUA.gif)

이 작업을 완료하고 만족스러운 시점을 찾았다면 현재 시점을 카메라 위치로 사용하는 방식으로 Ctrl + Shift + 0을 눌러 카메라를 배치해야 합니다.

🧙‍♂️ 전문가: 카메라 설정을 조정하고 싶다면 초점 거리(Focal Length)를 변경하여 할 수 있습니다. 아래 그림에서처럼 저는 25mm 초점 거리를 사용했습니다. 또한 점의 반경도 독립적으로 조절할 수 있습니다.

<div class="content-ad"></div>

거기서 Render Image 탭 버튼을 누르면 현재 카메라 위치에서 이미지를 내보낼 수 있습니다.

![이미지](https://miro.medium.com/v2/resize:fit:1400/1*9afTGK9vyFB7zGJ1lxhU2w.gif)

좋아요, 이제 우리는 주변 상황의 주요 아이디어를 갖고 있어요. 가스로 가득 찼어요! ☣️

## 2. 관심 대상

<div class="content-ad"></div>

목표는 테이블 위의 의자, 가스 탱크, 양털 기계 및 목표물을 강조하여 공간과 목표를 보다 명확하게 전달하는 것입니다. 자크 베르탱의 작업을 따라 가능한 조정할 수 있는 매개변수를 조정할 수 있습니다. 저는 각 개별 객체에 부여한 기본 색상으로 새로운 소재를 만들었습니다:

![각 객체에 대해 이렇게 함으로써 우리는 시선을 더 잘 이끄는 렌더를 생성할 수 있습니다:](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_10.png)

각 개체에 대해 이렇게 하면 눈을 더 정확히 이끌 수 있는 렌더를 생성할 수 있습니다:

![각 객체에 대해 이렇게 함으로써 우리 눈을 더 잘 이끌 수 있는 렌더를 생성할 수 있습니다:](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_11.png)

<div class="content-ad"></div>

🌱 성장 중: 전달된 메시지를 어떻게 개선할 수 있을까요? 변수 조정(색상)의 선택이 타당하다고 생생하십니까?

## 3. 추출 대상 강조

멋지네요! 여기서부터, 관심 대상에 더 많은 강조를 더하고 싶어합니다. 다시 말씀드리지만, 가능성은 많습니다. 저희는 눈에 뷰 가이드 역할을 하는 3D 원뿔 메시를 사용하는 방법을 안내해 드리겠습니다.

우선, 원뿔 메시 오브젝트를 생성해야 합니다. '메쉬' - '원뿔 추가' 옵션으로 이동하여 씬의 중심에 원뿔 메시를 생성할 수 있습니다. 그 다음, 해당 원뿔을 선택한 후, 크기를 조절하고 왼쪽에 있는 버튼을 사용하여 회전시키십시오. 마지막으로, 아래에 표시된 대로 목표물 위에 오브젝트의 위치를 변경하고 재료를 부여하면 됩니다.

<div class="content-ad"></div>

![Image](https://miro.medium.com/v2/resize:fit:1400/1*73JNEOXDwlsNfg2M6xqIwg.gif)

From these steps, and after creating a render from a camera position, you should get something looking like this:

Beautiful! It's time to get onto the extraction route.

## 4. Top-down Extraction Route

<div class="content-ad"></div>

Grease Pencil을 사용하면 마우스로 그림을 그릴 수 있어요. 올바르게 사용하려면 먼저 `Grease Pencil`을 추가해야 해요. 그 다음 "Top View"로 이동해서 "Draw Mode"를 눌러 경로를 그릴 수 있어요. 경로를 그린 후에는 Object Mode로 돌아가서 그리스 경로를 적절한 위치로 이동시켜야 해요. 아래 이미지를 참고해주세요.

![그림1](https://miro.medium.com/v2/resize:fit:1400/1*HYgQi-DuB38Piisdo1Y9IQ.gif)

마지막 단계는 경로에 색상을 추가하기 위해 그리스에 텍스처를 추가하는 거에요:

![그림2](https://miro.medium.com/v2/resize:fit:1400/1*mE_t1JPB6wJvlHk8ECXSzQ.gif)

<div class="content-ad"></div>

여기 있습니다. 우리는 추출 경로의 매력적인 전경을 얻기 위해 렌더링을 실행합니다!

![image](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_12.png)

## 5. POV 추출 경로

마지막 단계는 경로의 일인칭 시점을 얻는 것입니다. 만약 직접 렌더링을 한다면, 다음과 같은 결과물이 나올 것입니다:

<div class="content-ad"></div>

<img src="/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_13.png" />

사실 그리스 펜슬에는 깊이 테스트가 없습니다. 여기서 또 다른 꿀팁을 알려드릴게요. Z-깊이 테스트를 활성화하려면 `에디터 패널` 뷰 레이어 속성 ` 패스 -` 데이터로 이동하여 Z를 활성화하세요.

<img src="/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_14.png" />

이렇게 하면 렌더를 다시 생성할 때 가려지는 부분 테스트를 통과할 수 있어서 포인트 클라우드를 처리하는 데 훌륭합니다!

<div class="content-ad"></div>

# 결론

이것은 계속해서 발전하는 여정이었습니다! 우리는 블렌더에서 3D 포인트 클라우드를 통합하고 처리하는 과정을 분석했습니다. 포인트 클라우드 데이터의 가져오기와 내보내기부터 씬 설정과 렌더링의 복잡성까지 세심하게 다루며, 블렌더의 기능의 복잡성을 탐험하고 3D 시각화와 렌더링의 전체 잠재력을 활용할 수 있게 되었습니다.

지금까지 따라오면서, 블렌더에서 포인트 클라우드 데이터를 다루는 프로젝트에 자신감을 갖고 해결할 수 있는 지식과 기술을 얻었습니다. 이를 통해 3D 작업에서 창의성과 정밀도에 대한 새로운 가능성을 열 수 있게 되었습니다.

🦊 플로랑: 블렌더의 강력한 도구와 새로운 전문 지식을 바탕으로, 몰입감 있고 고품질의 실내 시각화를 위한 가능성이 이제 여러분 손안에 있습니다. 그래서 이 안내서를 들고 자신감 있게 여러분의 다음 3D 여정에 돌입해보세요. 원시 포인트 데이터를 멋진 시각적 표현으로 변환할 수 있다는 것을 인지하며, 행복한 블렌딩이 되길 바랍니다!

<div class="content-ad"></div>

# 참고 자료

- Poux, Florent, Valembois, Q., Mattes, C., Kobbelt, L., & Billen, R. (2020). Initial user-centered design of a virtual reality heritage system: Applications for digital tourism. Remote Sensing, 12(16), 2583. [DOI](https://doi.org/10.3390/rs12162583)
- Poux, Florent, Neuville, R., Van Wersch, L., Nys, G. A., Billen, R., Van Wersch, L., … & Billen, R. (2017). 3D Point Clouds in Archaeology: Advances in Acquisition. Processing and Knowledge Integration Applied to Quasi-Planar Objects, 96. [DOI](https://doi.org/10.3390/geosciences7040096)

![이미지](/assets/img/2024-06-22-TheBlenderHandbookfor3DPointCloudVisualizationandRendering_15.png)

# 🔷기타 자료

<div class="content-ad"></div>

- 🍇 데이터에 액세스하려면 여기를 방문하세요: 3D 데이터셋
- 👨‍🏫 3D 온라인 데이터 과학 코스: 3D 아카데미
- 📖 3D 자습서의 초기 액세스를 위해 구독하세요: 3D AI 자동화
- 🧑‍🎓 석사 학위 취득: ITC Utwente

# 🎓작가의 추천

데이터 획득부터 가상 투어 생성까지 엔드 투 엔드 시스템을 구축하려면, 여기서 제공된 이전에 게시된 기사를 살펴보십시오. 데이터 처리에 사용되는 방법을 보여주는 것도 포함돼 있습니다. 즐거운 기술 습득되길 바랍니다!
