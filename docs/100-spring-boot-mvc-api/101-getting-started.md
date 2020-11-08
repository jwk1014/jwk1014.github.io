---
layout: default
title: Getting Started
nav_order: 101
parent: Spring Boot MVC API
---
<br/>

# [](#header)Getting Started

작성일자 : 2020.11.08  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)

* * *

- 진행순서  
1. **[IDE 다운로드 설치](#1-ide-다운로드-설치)**
2. **[JDK 설치](#2-jdk-설치)**
3. **[프로젝트 생성](#3-프로젝트-생성)**
3. **[프로젝트 Open & Build & Run](#4-프로젝트-open--build--run)**

* * *  

### 1. [](#header)**IDE 다운로드 설치**  
<br/>  
처음에 공유드린 IDE 링크로 들어가 Community 버전을 다운받고 설치까지 진행해주세요.  
* * *

### 2. [](#header)**JDK 설치**  
<br/>  
혹시 JDK 8 또는 11이 설치되어있지 않으신 분들은
IntelliJ를 이용하여 11버전을 설치하겠습니다.  
<br/>  
<img src="/assets/images/spring-boot-mvc-api-getting-started-02-01.png" width="200" height="200"/>  
New Project를 눌러 아래 화면을 표시합니다.  
<br/>  
그리고 Download JDK...을 눌러주세요.  
<img src="/assets/images/spring-boot-mvc-api-getting-started-02-02.png" width="500" height="500"/>  
<br/>  
<img src="/assets/images/spring-boot-mvc-api-getting-started-02-03.png" width="500" height="500"/>  
AdoptOpenJDK (HotSpot)  
11.0.9  
위와 같이 선택 후 다운로드를 눌러 설치를 완료하겠습니다.  
* * *

### 3. [](#header)**프로젝트 생성**  
<br/>  
처음에 공유드린 프로젝트 생성 URL로 들어가주세요.  
<br/>
좌측에는  
`Gradle Project`  
`Java`  
`Spring Boot 2.3.5`로 설정하고  
<br/>
좌측 하단에 **Java**를 **11버전**으로 설정하고 (JDK 8버전이신 분은 8을 선택해주세요)  
<br/>
우측에 Dependencies는  
`ADD DEPENDENCIES`를 눌러  
**Web**과 **Lombok**을 검색하여 추가해주시면 됩니다.  
<img src="/assets/images/spring-boot-mvc-api-getting-started-03-01.png" width="700" height="700"/>  
다 설정 하셨으면  
`GENERATE`를 눌러 **zip파일을 다운**받고  
컴퓨터 내에 프로젝트들을 모아두는 workpsace같은 폴더에 **압축을 풀어주세요**.
* * *

### 4. [](#header)**프로젝트 Open & Build & Run**  
<br/>  
`IntelliJ IDEA Community`를 실행하고  
`Open or Import`를 누르신 후  
**압축을 풀었던 폴더를 찾아 선택**해주세요.  
<br/>  
그리고 나면 아래와 같이 Gradle Import & Indexing이 시작됩니다.  
(몇분정도 걸리니 기다려주세요.)  
<img src="/assets/images/spring-boot-mvc-api-getting-started-04-01.png" width="700" height="700"/>  
<br/>  
다 완료되면 왼쪽에 Project Explorer에 아래와 같은 구성으로 표시되는 것을 볼 수 있습니다.
<img src="/assets/images/spring-boot-mvc-api-getting-started-04-02.png" width="700" height="700"/>  
<br/>  
이제 빌드하고 실행해보겠습니다.  
  
IntelliJ IDEA Community 버전에서는  
Add Configuration이 자동으로 되지 않아  
Gradle에서 찾아서 실행하겠습니다.
<img src="/assets/images/spring-boot-mvc-api-getting-started-04-03.png" width="700" height="700"/>  
<br/>  
우측에 있는 Gradle 메뉴를 열어  
Tasks > application > bootRun을 찾아 실행합니다.  
<img src="/assets/images/spring-boot-mvc-api-getting-started-04-04.png" width="700" height="700"/>  
<br/>  
실행하면 아래와 같이 실행이 시작되는 것을 보실 수 있습니다.  
<img src="/assets/images/spring-boot-mvc-api-getting-started-04-05.png" width="700" height="700"/>  
<br/>  
서버가 정상적으로 올라가면  
로그 맨 아래부분의 내용이  
아래와 같이  
`Tomcat started on port(s): 8080 (http) with context path ''`  
`Started DemoApplication in x.xxx seconds (JVM running for x.xxx)`  
문구를 확인하실 수 있습니다.
<img src="/assets/images/spring-boot-mvc-api-getting-started-04-06.png" width="700" height="700"/>  
<br/>
종료는 좌측에 보이는 빨간색 네모를 눌러 종료해주시면 됩니다.

* * *
  
[ [Next] Config & Dependency Injection > ](102-config-di.html){: .btn .btn-green .float-right }