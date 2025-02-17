---
title: "기초적인 Active Directory  TryHackMe"
description: ""
coverImage: "/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_0.png"
date: 2024-06-19 09:05
ogImage:
  url: /assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_0.png
tag: Tech
originalTitle: "Active Directory Basics — TryHackMe"
link: "https://medium.com/@kawsaruddin238/active-directory-basics-tryhackme-548e4cb6e7fb"
isUpdated: true
---

이 방에서는 Active Directory가 제공하는 기본 개념과 기능을 소개합니다.

![Active Directory Basics](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_0.png)

## Task 2: Windows Domains:

Windows 도메인에서 자격 증명은 ...과(와) 같은 중앙 저장소에 저장됩니다.

<div class="content-ad"></div>

답변: 활성 디렉터리

활성 디렉터리 서비스를 운영하는 서버는 다음과 같습니다...

답변: 도메인 컨트롤러

## 참고:

<div class="content-ad"></div>

AD는 무엇인가요?

Active Directory는 사용자의 정보를 저장하는 디렉터리 데이터베이스/서버로, 사용자 이름, 전화 번호, 이메일 및 다른 자격 증명과 같은 정보를 저장합니다. 동일한 네트워크 사용자의 정보는 Active Directory에서 관리할 수 있습니다. 또한 사용자의 권한도 Active Directory에서 제어됩니다.

Active Directory 서비스를 실행하는 서버를 도메인 컨트롤러(Domain Controller, DC)라고 합니다.

각 컴퓨터를 개별적으로 방문하여 사용자를 수동으로 생성하거나 문제를 해결해야하는 등의 일부 한계를 극복하기 위해 Windows 도메인을 사용할 수 있습니다. 간단히 말해 Windows 도메인은 특정 비즈니스의 사용자 및 컴퓨터 그룹을 관리하는 것입니다. 도메인의 주요 아이디어는 Windows 컴퓨터 네트워크의 일반 구성 요소의 관리를 Active Directory(AD)라는 단일 저장소에 집중하는 것입니다. Active Directory 서비스를 실행하는 서버를 도메인 컨트롤러(DC)라고 합니다.

<div class="content-ad"></div>

구성된 Windows 도메인을 갖는 주요 이점은 다음과 같습니다:

- 중앙 집중식 식별 관리: 네트워크 전체의 모든 사용자를 최소한의 노력으로 Active Directory에서 구성할 수 있습니다.
- 보안 정책 관리: Active Directory에서 직접 보안 정책을 구성하고 필요에 따라 네트워크 전체의 사용자 및 컴퓨터에 적용할 수 있습니다.

실제 사례

이것이 다소 혼란스러워 보인다면, 학교, 대학 또는 직장에서 어느 시점에서라도 Windows 도메인과 상호 작용한 적이 있을 수 있습니다.

<div class="content-ad"></div>

학교/대학 네트워크에서는 캠퍼스 내의 모든 컴퓨터에서 사용할 수 있는 사용자 이름과 비밀번호가 제공됩니다. 여러분의 자격 증명은 모든 기기에서 유효하며, 해당 기기에서 입력할 때마다 인증 프로세스가 Active Directory로 전달되어 자격 증명을 확인합니다. Active Directory 덕분에 여러분의 자격 증명은 각 기기에 개별적으로 존재할 필요 없이 네트워크 전체에서 사용할 수 있습니다.

또한, Active Directory는 학교/대학이 캠퍼스의 컴퓨터에서 제어판에 접근하는 것을 제한할 수 있게 하는 구성 요소입니다. 일반적으로 정책은 네트워크 전체에 배포되어 해당 컴퓨터에 대한 관리 권한을 부여하지 않도록 설정됩니다.

저는 RDP 포트를 사용하여 Remmina라는 Kali 도구를 사용하여 THM.local에 로그인했습니다.
사용자 이름: Administrator
비밀번호: Password321

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_1.png)

<div class="content-ad"></div>

## 작업 3: Active Directory:

도메인에서 일반적으로 모든 컴퓨터 및 자원을 관리하는 그룹은 무엇입니까?

답변: 도메인 관리자

기계 이름이 TOM-PC인 기계 계정의 이름은 무엇입니까?

<div class="content-ad"></div>

답변: TOM-PC$

우리 회사가 품질 보증(Quality Assurance) 부서를 신설한다고 가정해 보겠습니다. 정책이 일관되게 적용될 수 있도록 모든 품질 보증 사용자를 그룹화하기 위해 어떤 유형의 컨테이너를 사용해야 할까요?

답변: 조직 단위

## 참고:

<div class="content-ad"></div>

Windows Domain의 핵심은 Active Directory Domain Service (AD DS)입니다. 이 서비스는 네트워크에 존재하는 모든 "객체"의 정보를 보유하는 카탈로그 역할을 합니다. AD에서 지원하는 많은 객체 중에는 사용자, 그룹, 기기, 프린터, 공유 등이 있습니다. 이 중 몇 가지를 살펴보겠습니다:

사용자

사용자는 Active Directory에서 가장 일반적인 객체 유형 중 하나입니다. 사용자는 보안 주체 중 하나로, 도메인에서 인증을 받을 수 있고 파일이나 프린터와 같은 리소스에 대한 권한을 할당 받을 수 있습니다. 보안 주체를 네트워크에서 리소스에 영향을 줄 수 있는 객체로 볼 수 있습니다.

사용자는 두 가지 유형의 엔터티를 나타내는 데 사용될 수 있습니다:

<div class="content-ad"></div>

- 사람: 사용자는 보통 조직 내에서 네트워크에 접속해야 하는 사람들, 즉 직원들을 대표합니다.
- 서비스: 사용자를 IIS 또는 MSSQL 같은 서비스에서 사용하도록 정의할 수도 있습니다. 각각의 서비스는 실행에 필요한 사용자를 요구하지만 서비스 사용자는 일반 사용자와는 달리 해당 서비스를 실행하는 데 필요한 권한만 갖습니다. (여기서 사용자는 일반적인 사용자와는 다르며 이러한 종류의 사용자 계정은 Windows 운영 체제에서 특정 서비스나 응용 프로그램을 실행하기 위해 생성된 것입니다. 이 유형의 계정은 기본적으로 운영 체제에 이미 생성된 계정입니다. 그러나 필요한 경우 누구나 서비스 계정을 만들 수 있습니다. 예: 계정이 콘솔에 로그인하지 않은 경우에도 컴퓨터에서 계속 실행되는 네트워크 서비스나 서비스를 시작할 수 있게 합니다)

기계 (컴퓨터 계정은 활성 디렉토리에 대한 데스크탑이나 랩톱을 나타냅니다. 컴퓨터 계정과 연관된 계정 이름과 계정 ID가 있습니다)

기계는 활성 디렉토리 내에서 또 다른 객체 유형입니다. 활성 디렉토리 도메인에 참여하는 모든 컴퓨터마다 기계 객체가 생성됩니다. 기계도 "보안 원칙"으로 간주되며 어떤 일반 사용자와 마찬가지로 계정이 할당됩니다. 이 계정은 도메인 내에서 다소 제한된 권한을 갖습니다.

기계 계정 자체는 할당된 컴퓨터의 로컬 관리자이며, 일반적으로 컴퓨터 자체를 제외한 누구에게도 액세스되어서는 안 됩니다. 그러나 다른 계정과 마찬가지로 암호를 알고 있다면 해당 계정을 사용하여 로그인할 수 있습니다.

<div class="content-ad"></div>

알림: 기계 계정 암호는 자동으로 회전되며 일반적으로 120개의 무작위 문자로 구성됩니다.

기계 계정 식별은 비교적 쉽습니다. 특정한 명명 체계를 따릅니다. 기계 계정 이름은 컴퓨터 이름 다음에 달러 기호가 붙은 형식을 따릅니다. 예를 들어 DC01이라는 기계의 경우 DC01$라는 기계 계정을 갖게 됩니다.

보안 그룹

Windows에 익숙하다면 파일이나 다른 리소스에 대한 액세스 권한을 할당하기 위해 사용자 그룹을 정의할 수 있다는 것을 알고 계실 것입니다. 이렇게 하면 단일 사용자가 아닌 전체 그룹에 대한 액세스 권한을 부여할 수 있어 관리가 더 용이해집니다. 기존 그룹에 사용자를 추가하면 그들은 해당 그룹의 모든 권한을 자동으로 상속받을 수 있습니다. 보안 그룹은 또한 보안 주체로 간주되며, 따라서 네트워크상의 리소스에 대한 권한을 가질 수 있습니다.

<div class="content-ad"></div>

그룹은 사용자와 기계를 모두 멤버로 가질 수 있습니다. 필요한 경우, 그룹은 다른 그룹을 포함할 수도 있습니다.

도메인에서는 사용자에게 특정 권한을 부여하는 데 사용할 수 있는 기본적으로 여러 그룹이 생성됩니다. 예를 들어, 다음은 도메인에서 가장 중요한 몇 가지 그룹입니다:

도메인 관리자: 이 그룹의 사용자는 전체 도메인에 대한 관리자 권한을 갖습니다. 기본적으로, 그들은 DC(도메인 컨트롤러)를 포함한 도메인의 모든 컴퓨터를 관리할 수 있습니다.

서버 운영자: 이 그룹의 사용자는 도메인 컨트롤러를 관리할 수 있습니다. 그들은 어떤 관리 그룹 멤버십도 변경할 수 없습니다.

<div class="content-ad"></div>

백업 작업자: 이 그룹의 사용자들은 권한을 무시하고 모든 파일에 액세스할 수 있습니다. 컴퓨터의 데이터를 백업하는 데 사용됩니다.

계정 운영자: 이 그룹의 사용자들은 도메인 내의 다른 계정을 생성하거나 수정할 수 있습니다.

도메인 사용자: 도메인 내의 모든 기존 사용자 계정을 포함합니다.

도메인 컴퓨터: 도메인 내의 모든 기존 컴퓨터를 포함합니다.

<div class="content-ad"></div>

도메인 컨트롤러: 해당 도메인에 있는 모든 DC를 포함합니다.

Active Directory 사용자 및 컴퓨터

Active Directory에서 사용자, 그룹 또는 기기를 구성하려면 도메인 컨트롤러에 로그인하여 시작 메뉴에서 "Active Directory 사용자 및 컴퓨터"를 실행해야 합니다:

![Active Directory Users and Computers](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_2.png)

<div class="content-ad"></div>

이를 통해 도메인에 존재하는 사용자, 컴퓨터 및 그룹의 계층 구조를 볼 수 있는 창이 열립니다. 이러한 객체들은 사용자와 기기를 구분하는 컨테이너 객체인 조직 단위(OU)에 구성되어 있습니다. OUs는 사용자와 기계를 분류할 수 있도록 허용하는 컨테이너 객체이며(OUs는 모든 다른 그룹이 별도로 유지되는 그룹으로 모든 그룹이 OU 그룹의 하위 개체임을 의미하며, 각 그룹이 OU로 별도로 지칭되기도 합니다), 주로 유사한 규제 요구 사항을 가진 사용자 그룹을 정의하는 데 사용됩니다. 예를 들어, 귀하의 기관의 영업 부서의 사람들은 IT 부서의 사람들과 다른 정책 집합을 적용받을 가능성이 높습니다. 기억해야 할 점은 사용자가 한 번에 하나의 OU에만 속할 수 있다는 것입니다.

우리의 기기를 확인하면 이미 IT, 관리, 마케팅 및 영업 부서를 위한 4개의 하위 OU가 있는 THM이라는 OU가 있습니다. 기업의 구조를 모방하는 OU를 보는 것은 매우 일반적인데, 이를 통해 전체 부서에 적용되는 기본 정책을 효율적으로 배포할 수 있습니다. 대부분의 경우 이것이 기대되는 모델이 될 것이지만 필요에 따라 OUs를 임의로 정의할 수도 있습니다. 재미를 위해 THM OU를 마우스 오른쪽 버튼으로 클릭하고 그 아래에 Students라는 새 OU를 만들어 보세요.

어떤 OU를 열면 해당 OU에 포함된 사용자를 볼 수 있고, 필요할 때 만들거나 삭제하거나 수정하는 등 간단한 작업을 수행할 수 있습니다. 필요할 때 비밀번호를 재설정할 수도 있습니다(도움 데스크에 매우 유용함):

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_3.png)

<div class="content-ad"></div>

이미 THM OU 이외에도 기본 컨테이너가 있다는 것을 이미 알고 계실 것입니다. 이러한 컨테이너들은 Windows에 의해 자동으로 생성되며 다음을 포함합니다:

- Builtin: Windows 호스트에 사용 가능한 기본 그룹이 포함되어 있습니다.
- Computers: 네트워크에 가입하는 모든 기기는 여기에 자동으로 배치됩니다. 필요한 경우 이동할 수 있습니다.
- Domain Controllers: 네트워크의 DC를 포함하는 기본 OU입니다.
- Users: 도메인 전역 문맥에 적용되는 기본 사용자 및 그룹이 포함됩니다.
- Managed Service Accounts: Windows 도메인 내의 서비스에서 사용하는 계정을 보관합니다.

보안 그룹 대 OUs

그룹과 OU가 둘 다 사용자와 컴퓨터를 분류하는데 사용된다는 것을 궁금해하실 것입니다. 두 가지 모두 사용자와 컴퓨터를 분류하지만 목적은 완전히 다릅니다:

<div class="content-ad"></div>

- OUs는 사용자 및 컴퓨터에 정책을 적용하는 데 유용합니다. 이는 기업에서 특정 역할을 하는 사용자 그룹에 대한 구성 설정을 포함합니다. 사용자는 한 번에 하나의 OU의 구성원일 수 있으며, 단일 사용자에게 두 가지 다른 정책 집합을 적용하는 것은 의미가 없습니다.
- 반면에 보안 그룹은 리소스에 대한 권한을 부여하는 데 사용됩니다. 예를 들어, 몇 명의 사용자가 공유 폴더나 네트워크 프린터에 액세스할 수 있도록 허용하려면 그룹을 사용합니다. 사용자는 여러 그룹의 구성원이 될 수 있으며, 여러 리소스에 액세스를 부여하는 데 필요합니다.

## 작업 4: AD에서 사용자 관리:

Sophie의 데스크톱에서 발견된 플래그는 무엇입니까?

답변: THM'thanks_for_contacting_support'

<div class="content-ad"></div>

## Note:

위임 후 RDP 포트를 사용해 Remmina를 이용하여 필립스 계정에 로그인하십시오. 사용자 이름과 비밀번호: phillip: Claire2008

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_4.png)

필립스 계정으로 들어간 후 명령 프롬프트를 열고 cmd에서 PowerShell로 전환하려면 명령을 사용하십시오: cmd에서 `powershell`을 입력하세요.

<div class="content-ad"></div>

![Image 1](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_5.png)

Now to set the password, type this command:

```bash
Set-ADAccountPassword sophie -Reset -NewPassword (Read-Host -AsSecureString -Prompt 'New Password') -Verbose
```

![Image 2](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_6.png)

Here I have set the password: abcD12345\*

<div class="content-ad"></div>

![2024-06-19-ActiveDirectoryBasicsTryHackMe_7](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_7.png)

![2024-06-19-ActiveDirectoryBasicsTryHackMe_8](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_8.png)

이제 우리가 플래그를 획득했어요. 그래서 우리는 소피가 우리가 제공한 비밀번호를 사용하지 못하게 하려고 해요. 소피가 계정에 로그인할 때 재설정 옵션을 표시하도록 소피의 계정을 Phillips 계정에서 다음 명령을 사용해서 설정할 거예요: Set-ADUser -ChangePasswordAtLogon $true -Identity sophie -Verbose

![2024-06-19-ActiveDirectoryBasicsTryHackMe_9](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_9.png)

<div class="content-ad"></div>

이미 게시한 표를 Markdown 형식으로 변환하십시오.

<div class="content-ad"></div>

답변: 위임

## 참고:

새로운 도메인 관리자로 일하게 되셨군요! 사업에 일어난 최근 변경 사항을 확인하기 위해 기존의 AD OUs와 사용자들을 확인해야 합니다. 주어진 조직도를 확인하고 AD를 조정하여 일치시키는 것이 첫 번째 과제입니다.

불필요한 OUs와 사용자 삭제하기

<div class="content-ad"></div>

가장 먼저 주목해야 할 것은 현재 AD 구성에 있는 차트에 나타나지 않는 추가 부서 OU가 있다는 것입니다. 예산 삭감으로 폐쇄되었다는 이야기를 들었고 도메인에서 제거해야 합니다. OU를 마우스 오른쪽 단추로 클릭하여 삭제하려고 하면 다음 오류가 발생합니다:

![image](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_12.png)

기본적으로 OU는 우연한 삭제로부터 보호됩니다. OU를 삭제하려면 보기 메뉴에서 고급 기능을 활성화해야 합니다:

![image](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_13.png)

<div class="content-ad"></div>

추가 컨테이너를 표시하고 실수로 발생할 수 있는 삭제 보호를 해제할 수 있게 됩니다. 이를 위해 OU를 마우스 오른쪽 버튼으로 클릭하고 속성으로 이동하십시오. 객체 탭에 있는 확인란을 해제할 수 있는 것을 확인할 수 있습니다:

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_14.png)

박스의 선택을 해제하고 OU를 다시 삭제해 보세요. OU를 삭제하려고 하면 확인 대화상자가 표시되며 그 결과로 그 하위에 있는 사용자, 그룹 또는 OU도 삭제됩니다.

추가 OU를 삭제한 후 AD에서 일부 부서의 사용자가 조직도와 일치하지 않음을 알 수 있습니다. 필요한 사용자를 생성하고 삭제하여 일치시키세요.

<div class="content-ad"></div>

대리권 (예시: IT 지원팀 구성원은 조직이 Active Directory의 대상 OU의 대리자 제어 옵션을 사용하여 그에게 부여한 권한으로 다른 그룹의 낮은 권한 구성원의 사용자 이름과 비밀번호를 변경할 수 있습니다)

AD에서 할 수 있는 좋은 점 중 하나는 특정 사용자에게 일부 OU에 대한 제어 권한을 부여하는 것입니다. 이 프로세스를 위임(delegation)이라고 하며, 도메인 관리자의 개입 없이 사용자에게 OUs에서 고급 작업을 수행할 수 있는 특정 권한을 부여할 수 있습니다.

이 중에서도 가장 일반적인 사용 사례 중 하나는 IT 지원팀에게 낮은 권한을 가진 사용자의 비밀번호를 재설정할 수 있는 권한을 부여하는 것입니다. 우리의 조직도를 보면 필립이 IT 지원을 담당하고 있으므로, 판매, 마케팅 및 경영 부서의 비밀번호 재설정 권한을 그에게 위임하고 싶을 것입니다.

## 작업 5: AD에서 컴퓨터 관리하기:

<div class="content-ad"></div>

사용 가능한 컴퓨터를 정리한 후에, 일반 사용자용 OU(조직 단위)에는 몇 대의 컴퓨터가 남아 있나요?

답: 7

![Active Directory Basics](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_15.png)

서버와 일반 사용자용 컴퓨터를 위해 별도의 OU를 만드는 것이 좋은 아이디어인가요? (예/아니요)

<div class="content-ad"></div>

정답: 와우

## 작업 6: 그룹 정책:

도메인 컴퓨터에 GPO를 배포하는 데 사용되는 네트워크 공유의 이름은 무엇인가요?

정답: SYSVOL

<div class="content-ad"></div>

네, GPO를 사용하여 사용자 및 컴퓨터에 설정을 적용할 수 있어요!

답변: Yay

## 작업 7: 인증 방법:

현재 버전의 Windows는 기본적으로 NetNTLM을 기본 인증 프로토콜로 사용할까요? (yay/nay)

<div class="content-ad"></div>

답변: nay

Kerberos를 참조할 때, TGS(Ticket Granting Ticket)라고 알려진 추가 티켓을 요청할 수 있는 티켓의 종류는 무엇입니까?

답변: Ticket Granting Ticket

NetNTLM을 사용할 때, 사용자의 비밀번호가 네트워크를 통해 어느 시점에든 전송되나요? (yay/nay)

<div class="content-ad"></div>

답변: 아니오

## 참고:

Windows 도메인을 사용할 때 모든 자격 증명은 도메인 컨트롤러에 저장됩니다. 사용자가 도메인 자격 증명을 사용하여 서비스를 인증하려고 할 때, 서비스는 그 자격 증명이 올바른지 확인하기 위해 도메인 컨트롤러에 요청해야 합니다. Windows 도메인에서 네트워크 인증에 사용되는 두 프로토콜이 있습니다.

- Kerberos: 최신 Windows 버전에서 사용됩니다. 이는 최근 도메인의 기본 프로토콜입니다.
- NetNTLM: 호환성을 위해 유지되는 레거시 인증 프로토콜입니다.

<div class="content-ad"></div>

NetNTLM을 사용하는 것은 더 이상 사용되지 않는 것으로 간주될 수 있지만, 대부분의 네트워크는 두 프로토콜 모두 활성화되어 있을 것입니다. 이제 각 프로토콜이 어떻게 작동하는지 자세히 살펴보겠습니다.

인증에 Kerberos를 사용할 때는 다음과 같은 과정이 발생합니다:

- 사용자가 자신의 사용자 이름과 암호로부터 파생된 키를 사용하여 암호화된 타임스탬프를 Key Distribution Center (KDC)에 전송합니다. KDC는 일반적으로 네트워크에서 Kerberos 티켓을 생성하는 주 도메인 컨트롤러에 설치된 서비스입니다.

KDC는 Ticket Granting Ticket (TGT)를 생성하여 사용자에게 보내고, 이를 통해 사용자는 특정 서비스에 액세스하기 위해 추가 티켓을 요청할 수 있게 됩니다. 티켓을 받고 더 많은 티켓을 얻어야 한다는 것이 조금 이상해보일 수 있지만, 이를 통해 사용자는 서비스에 연결할 때마다 자격 증명을 전달하지 않고도 서비스 티켓을 요청할 수 있습니다. TGT와 함께 사용자에게 세션 키도 제공되며, 이 키를 사용자가 이후 요청을 생성하는 데 사용해야 합니다.

<div class="content-ad"></div>

TGT는 krbtgt 계정의 암호 해시를 사용하여 암호화되므로 사용자는 해당 내용에 액세스할 수 없습니다. 암호화된 TGT에는 세션 키의 사본이 내용의 일부로 포함되어 있음을 알아두어야 합니다. KDC는 필요에 따라 TGT를 복호화하여 세션 키의 사본을 복원할 수 있기 때문에 세션 키를 저장할 필요가 없습니다.

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_16.png)

2. 사용자가 공유, 웹사이트 또는 데이터베이스와 같은 네트워크 서비스에 연결하려는 경우, 해당 사용자는 KDC에게 티켓 부여 서비스(TGS)를 요청하기 위해 자신의 TGT를 사용합니다. TGS는 생성된 특정 서비스에만 연결을 허용하는 티켓입니다. TGS를 요청하기 위해 사용자는 세션 키로 암호화된 사용자 이름 및 타임스탬프, TGT 및 서비스 주체 이름(SPN)을 서버 이름 및 액세스할 서비스를 나타내는 서비스 주체 이름과 함께 보냅니다.

결과적으로 KDC는 우리에게 서비스 세션 키와 함께 TGS를 보내줍니다. 이 서비스 세션 키는 우리가 액세스하려는 서비스에 인증하는 데 필요합니다. TGS는 서비스 소유자 해시로부터 파생된 키를 사용하여 암호화됩니다. 서비스 소유자는 서비스를 실행하는 사용자 또는 기계 계정입니다. TGS에는 서비스 세션 키의 사본이 암호화된 내용으로 포함되어 있어서 서비스 소유자는 TGS를 복호화하여 액세스할 수 있습니다.

<div class="content-ad"></div>

<table>
<tr>
<th><img src="/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_17.png" /></th>
</tr>
<tr>
<td>3. TGS는 이제 원하는 서비스로 전송되어 인증되고 연결이 설정됩니다. 서비스는 구성된 계정의 비밀번호 해시를 사용하여 TGS를 해독하고 서비스 세션 키를 확인합니다.</td>
</tr>
<tr>
<th><img src="/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_18.png" /></th>
</tr>
<tr>
<td>NetNTLM(NTLM 해시는 Windows 시스템에 저장된 사용자 암호의 암호화 형식입니다.) 인증</td>
</tr>
</table>

<div class="content-ad"></div>

NetNTLM은 challenge-response 메커니즘을 사용합니다. 전체 과정은 다음과 같습니다:

![image](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_19.png)

- 클라이언트는 액세스하려는 서버에 인증 요청(도메인 이름 및 사용자 이름)을 보냅니다.
- 서버는 무작위 숫자를 생성하여 클라이언트에게 도전 응답으로 보냅니다.
- 클라이언트는 자신의 NTLM 암호 해시를 도전에(그리고 다른 알려진 데이터와 함께) 결합하여 도전에 대한 응답을 생성하고 서버로 돌려보냅니다.
- 서버는 도전과 응답을 도메인 컨트롤러로 전송하여 확인합니다.
- 도메인 컨트롤러는 응답을 다시 계산하고 클라이언트가 보낸 초기 응답과 비교하여 일치 여부를 확인합니다. 일치하면 클라이언트가 인증됩니다. 그렇지 않으면 액세스가 거부됩니다. 인증 결과가 서버로 다시 보내집니다.
- 서버는 인증 결과를 클라이언트로 다시 전송합니다.

사용자의 비밀번호(또는 해시)가 보안을 위해 네트워크를 통해 전송되지 않음에 유의하세요.

<div class="content-ad"></div>

노트: 설명된 프로세스는 도메인 계정을 사용할 때 적용됩니다. 로컬 계정을 사용하는 경우, 서버는 SAM(보안 계정 관리자)에 비밀번호 해시가 로컬로 저장되어 있기 때문에 도메인 컨트롤러와의 상호 작용 없이 도전에 대한 응답을 확인할 수 있습니다.

## 작업 8: 트리, 포리스트 및 트러스트:

Windows 도메인의 이름 공간을 공유하는 그룹을 무엇이라고 하나요?

답변: 트리

<div class="content-ad"></div>

두 도메인 간에 사용자가 도메인 A에서 도메인 B의 리소스에 액세스하려면 구성해야 할 사항은 무엇인가요?

답변: 2 신뢰 관계

## 참고:

Trees

<div class="content-ad"></div>

예를 들어, 갑자기 회사가 새로운 국가로 확장된다고 상상해 보세요. 새로운 국가는 다른 법률과 규정을 가지고 있어 GPO를 업데이트하여 준수해야 합니다. 게다가 이제 두 나라에 IT 직원이 있고 각 IT 팀은 다른 팀에 방해받지 않으면서 해당 국가에 해당하는 자원을 관리해야 합니다. 복잡한 OU 구조를 만들고 위임을 사용하여 이를 달성할 수 있지만, 방대한 AD 구조를 관리하기 어렵고 인간 실수가 발생할 수 있습니다.

다행히도 Active Directory는 여러 도메인을 통합하여 네트워크를 독립적으로 관리할 수 있는 단위로 분할할 수 있습니다. 예를 들어 동일한 네임스페이스(thm.local)를 공유하는 두 도메인이 있다면 해당 도메인을 트리로 결합할 수 있습니다.

만약 thm.local 도메인이 영국과 미국 지사를 위한 두 하위 도메인으로 분할되었다면 thm.local을 루트 도메인으로 하고 uk.thm.local 및 us.thm.local 두 하위 도메인을 가진 트리를 구축할 수 있습니다. 각각의 AD, 컴퓨터 및 사용자를 가지고 있죠:

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_20.png)

<div class="content-ad"></div>

이 분할된 구조는 도메인 내에서 누가 무엇에 액세스할 수 있는지 더 잘 제어할 수 있게 해줍니다. 영국의 IT 직원은 영국 리소스만 관리하는 자체 DC를 갖게 될 것입니다. 예를 들어, 영국 사용자는 미국 사용자를 관리할 수 없을 것입니다. 이렇게 함으로써 각 지점의 도메인 관리자들은 각각의 DC에 대해 완전한 통제권을 갖지만 다른 지점의 DC에는 그런 권한이 없을 것입니다. 각 도메인에 대해 정책도 독립적으로 구성할 수 있습니다.

트리와 포리스트에 대한 이야기를 할 때 새로운 보안 그룹을 소개해야 합니다. Enterprise Admins 그룹은 기업의 모든 도메인에 대한 관리자 권한을 부여할 것입니다(이 기업 관리자들은 영국과 미국 도메인 컨트롤러를 모두 제어할 수 있습니다). 각 도메인은 여전히 각자의 도메인에 대한 관리자 권한을 갖는 도메인 관리자들과 기업 관리자들을 가질 것이며, 이 기업 관리자들은 기업 내의 모든 것을 제어할 수 있게 됩니다.

포리스트

관리하는 도메인은 서로 다른 네임스페이스로 구성할 수도 있습니다. 회사가 계속 성장하면 언젠가는 MHT Inc라는 다른 회사를 인수할 수 있습니다. 두 회사가 합병하면 아마도 각 회사를 위한 서로 다른 도메인 트리가 있게 될 것이며, 각각 자체 IT 부서에 의해 관리될 것입니다. 서로 다른 네임스페이스를 갖는 여러 트리를 같은 네트워크로 병합하는 것을 포리스트라고 합니다.

<div class="content-ad"></div>

<table>
    <tr>
        <td><img src="/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_21.png" /></td>
    </tr>
</table>

신뢰 관계

트리와 포리스트로 구성된 여러 도메인을 보유하면 관리 및 자원 측면에서 좋은 칸막이된 네트워크를 구축할 수 있습니다. 그러나 언젠가는 THM UK의 사용자가 MHT ASIA 서버 중 하나에 공유 파일에 액세스해야 할 수도 있습니다. 이것이 가능하려면 트리와 포리스트로 구성된 도메인들은 신뢰 관계에 의해 결합됩니다.

간단히 말해, 도메인 간에 신뢰 관계가 있으면 도메인 THM UK의 사용자가 도메인 MHT EU의 자원에 액세스 할 수 있도록 권한을 부여할 수 있습니다.

<div class="content-ad"></div>

가장 간단한 신뢰 관계는 일방적인 신뢰 관계를 설정하는 것입니다. 일방적인 신뢰 관계에서는 도메인 AAA가 도메인 BBB를 신뢰한다면, BBB의 사용자가 AAA의 리소스에 액세스할 권한을 부여받을 수 있습니다:

![이미지](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_22.png)

일방적인 신뢰 관계의 방향은 액세스 방향과 반대입니다.

양방향 신뢰 관계도 만들어서 상호적으로 다른 쪽 도메인의 사용자를 인가할 수 있습니다. 기본적으로, 트리 또는 포리스트 아래 여러 도메인을 추가하면 양방향 신뢰 관계가 형성됩니다.

<div class="content-ad"></div>

도메인 간 신뢰 관계를 가지고 있다고 해서 다른 도메인의 모든 리소스에 자동으로 접근할 수 있는 것은 아닙니다. 신뢰 관계가 설정되면 다른 도메인 간에 사용자를 인가할 수 있는 기회가 생깁니다. 그러나 실제로 무엇이 승인되었는지 여부는 사용자의 권한에 달려 있습니다. (즉, 신뢰 관계 도메인은 사용자가 어떤 유형의 데이터/파일에 액세스하거나 볼 수 있는 최소 권한을 갖습니다.)

그래서, 즐거운 학습과 행운을 빕니다.

더 많은 흥미로운 내용과 자세한 기사를 보려면 제 블로그를 팔로우해주세요.

## LinkedIn

<div class="content-ad"></div>

![2024-06-19-ActiveDirectoryBasicsTryHackMe_23](/assets/img/2024-06-19-ActiveDirectoryBasicsTryHackMe_23.png)
