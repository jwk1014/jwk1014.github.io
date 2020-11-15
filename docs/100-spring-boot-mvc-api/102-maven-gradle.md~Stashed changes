---
layout: default
title: Maven & Gradle
nav_order: 102
parent: Spring Boot MVC API
---
<br/>

# [](#header)Maven & Gradle

작성일자 : 2020.11.14  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)

* * *

- 진행순서  
1. **[빌드 도구](#1-빌드-도구)**
2. **[Maven](#2-maven)**
3. **[Gradle](#3-gradle)**
4. **[라이브러리 검색](4-라이브러리-검색)**

* * *  

### 1. [](#header)**빌드 도구**  
<br/>  

`빌드 도구`는 프로젝트의 **라이브러리를 관리**하고 **라이브러리 의존성도 관리**해주면서 **빌드**를 도와주는 도구입니다!  

<br/> 

- **라이브러리 관리**  
`dependency 리스트`에  
라이브러리를 적어주고    
`reload` 하게되면  
해당 라이브러리들을 `저장소`에서 찾아서 `다운로드`하여 프로젝트에서 사용할 수 있도록 해줍니다.  

<br/> 

- **라이브러리 의존성 관리**  
라이브러리는 단독으로 사용될 수 있는 라이브러리도 있지만  
다른 라이브러리가 있어야 사용할 수 있는 라이브러리도 많습니다.  
<br/>
**ex) Gson (Compile Dependencies 0개)**  
<img src="/assets/images/spring-boot-mvc-api-maven-gradle-01-01.png" width="300" height="300"/>  
<img src="/assets/images/spring-boot-mvc-api-maven-gradle-01-02.png" width="700" height="700"/>  
<br/>
**ex) Spring Boot Web (Compile Dependencies 5개)**  
<img src="/assets/images/spring-boot-mvc-api-maven-gradle-01-03.png" width="500" height="500"/>  
<img src="/assets/images/spring-boot-mvc-api-maven-gradle-01-04.png" width="700" height="700"/>  
`Spring Boot Web`같은경우  
Compile Dependencies 5개나 돼서  
일반 자바프로젝트를 만들어 lib폴더 설정하고  
lib 폴더에 하나씩 라이브러리 jar파일을 넣는다고 생각하면....  
너무 많이 찾아서 일일히 다운로드해서 넣어야하는 끔찍한일이...ㅎ  

<br/> 

- **빌드**  
`프로젝트 이름`,`프로젝트 버전`을 사용하여 빌드한 파일(jar/war)의 이름을 정하고  
`프로젝트 패키지명`을 사용하여 컴파일/빌드할 코드를 찾고  
각 dependency(라이브러리)를 `compile`/`runtime`/`test` 중 어느시점에 사용할지 정하는 등의  
여러 기능을 수행합니다.  

* * *

### 2. [](#header)**Maven**  
<br/>  

[Maven](https://maven.apache.org)은 Apache에 소속된 빌드 도구입니다.  

프로젝트 내의 `pom.xml`로 프로젝트 빌드 구성을 정합니다.  

저장소는 [maven 저장소](https://search.maven.org/search?q=g:org.springframework.boot)를 사용하고  
다른 저장소도 추가하면 사용가능합니다.

**pom.xml 내용**  
```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
 
  <!-- The Basics -->
  <groupId>...</groupId> <!-- group(domain) -->
  <artifactId>...</artifactId> <!-- project name -->
  <version>...</version>
  <packaging>...</packaging> <!-- jar/war -->
  <dependencies...</dependencies> <!-- 라이브러리 -->
  
  <!-- Build Settings -->
  <build>...</build>
 
  <!-- Environment Settings -->
  <repositories>...</repositories> <!-- 저장소 -->
  <pluginRepositories>...</pluginRepositories> <!-- 플러그인 저장소 -->
</project>
```

`이클립스`, `IntelliJ`, `VSCode`등 `IDE`에서 플러그인을 지원해서 빌드가 편리하게 가능하며  
터미널에서도 [maven을 다운로드](https://maven.apache.org/download.cgi)하여 가지고 있다면 빌드가 가능합니다.  

```
$ mvn clean install // clean & compile & test & package 명령 순차 실행

$ mvn clean
$ mvn compile // 컴파일 (target classes 생성)
$ mvn test // 테스트 코드 실행
$ mvn package // jar/war 파일 생성

// test skip은 -DskipTests 또는 -Dmaven.test.skip=true
```

`Spring Boot` 에서는 컴파일/빌드 후에 `build/libs` 폴더 내에  
`{artifactId}-{version}.{packaging}`이름의 파일이 빌드되어 있습니다.  

* * *

### 3. [](#header)**Gradle**  
<br/>  

[Gradle](https://gradle.org)은 `© Gradle Inc.`에서 관리하는 빌드도구입니다.  

라이센스는 `Apache License 2.0`으로 오픈되어 있습니다.  

프로젝트 내의 `build.gradle`로 빌드 구성을 정합니다.  

저장소는 `Spring Boot`에서는 [maven 저장소](https://search.maven.org/search?q=g:org.springframework.boot)를 사용합니다.  

**build.gradle 내용**
```
plugins { // 플러그인
	id 'org.springframework.boot' version '2.3.5.RELEASE'
	id 'io.spring.dependency-management' version '1.0.10.RELEASE'
	id 'java'
}

group = 'com.example' // group(domain)
version = '0.0.1-SNAPSHOT'
sourceCompatibility = '11' // java version

configurations {
	compileOnly {
		extendsFrom annotationProcessor
	}
}

repositories { // 저장소
	mavenCentral()
}

dependencies { // 라이브러리
	implementation 'org.springframework.boot:spring-boot-starter-web'
	compileOnly 'org.projectlombok:lombok'
	annotationProcessor 'org.projectlombok:lombok'
	testImplementation('org.springframework.boot:spring-boot-starter-test') {
		exclude group: 'org.junit.vintage', module: 'junit-vintage-engine'
	}
}

test {
	useJUnitPlatform()
}
```


`Gradle`도   
`이클립스`, `IntelliJ`, `VSCode`등 `IDE`에서 플러그인을 지원해서 빌드가 편리하게 가능하며  
터미널에서도 Gradle이 사용가능하다면 빌드가 가능합니다.  
(프로젝트 내에 존재하는 gradlew를 사용하면 됩니다.)

```
$ gradlew clean
$ gradlew build // dependency다운로드 & 컴파일 & 테스트 & 빌드 순차 실행

// test skip은 -x test 하시면 됩니다.
```

`Gradle`도  
`Spring Boot` 에서는 컴파일/빌드 후에 `build/libs` 폴더 내에  
`{artifactId}-{version}.{packaging}`이름의 파일이 빌드되어 있습니다.  
* * *

### 4. [](#header)**라이브러리 검색**  
<br/>

- **Maven Sonatype**  

Maven에서 제공하는 [Sonatype(Maven Central Repository Search)](https://search.maven.org/search?q=g:org.springframework.boot)를 사용할 수 있습니다.  

org.springframework.boot groupId의 모든 라이브러리 리스트 조회  
`g:org.springframework.boot`  
  
org.springframework로 시작하는 groupId들의 모든 라이브러리 리스트 조회  
`g:org.springframework.*`

org.springframework.boot:spring-boot-starter-web 라이브러리 조회  
`g:org.springframework.boot a:spring-boot-starter-web`  

spring-boot-starter-로 시작하는 artifactId를 가진 라이브러리 리스트 조회  
`a:spring-boot-starter-*`  

- **MvnRepository**

[MvnRepository 사이트](https://mvnrepository.com)에서도 검색을 편하게 할 수 있게 제공하고 있습니다.

* * *
  
[ < [Prev] Getting Started ](101-getting-started.html){: .btn .btn-blue .float-left }

[ [Next] Config & Dependency Injection > ](103-config-di.html){: .btn .btn-green .float-right }
<br/>  