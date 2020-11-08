---
layout: default
title: Config & Dependency Injection
nav_order: 102
parent: Spring Boot MVC API
---
<br/>

# [](#header)Config & Dependency Injection

작성일자 : 2020.11.08  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)

* * *

- 진행순서  
1. **[Configuration](#1-configuration)**
2. **[Dependency Injection](#2-dependency-injection)**

* * *  

### 1. [](#header)**Configuration**  
<br/>  
Configuration은
Spring Boot 서버의 서버가 시작될 때 해야하는 설정들을 담당하는 모델입니다.

<img src="/assets/images/spring-boot-mvc-api-config-di-01-01.png" width="700" height="700"/>  

`@Configuration` 어노테이션을 사용하며

주로
1. Bean을 추가하여 Thread Safe한 모델 인스턴스 Singleton으로 생성 후 필요한 곳에 injection
2. 특정 Configuration 클래스를 상속 후 설정함수 overriding

위 과정에 사용되며  
`@Configuration`과 `@Bean`에 대한  
좀 더 자세한 내용은 추후 다른 기능들을 다루면서  
필요하게 될 때 코드예시로 학습하겠습니다.  

* * *

### 2. [](#header)**Dependency Injection**  
<br/>  

Spring Boot의  
`@Bean`, `@Controller`, `@Service`, `@Repository`, `@Component`등과 같은  
Component들은  
Singleton으로 인스턴스가 관리되며 (코드가 **Thread Safe** 해야합니다.)  
필요한 Component에게 `@Autowired` 또는 **생성자**로 주입(injection) 가능합니다.  
  
Spring Boot의 권장사항은  
1. **Controller, Service**와 같은 곳에서는 **생성자**로 injection받고  
2. **테스트 모델 코드**에서는 **@Autowired**로 injection하는 것으로 되어있습니다.  
  
Spring Boot에 기본 Bean중 하나인 ObjectMapper를  
Service 코드에 injection하는 2가지 예시를 보여드리겠습니다.  
  
**생성자 injection 예시**  
<img src="/assets/images/spring-boot-mvc-api-config-di-02-01.png" width="700" height="700"/>  
  
**@Autowired injection 예시**  
<img src="/assets/images/spring-boot-mvc-api-config-di-02-02.png" width="700" height="700"/>  

* * *
  
[ < [Prev] Getting Started ](101-getting-started.html){: .btn .btn-blue .float-left }

[ [Next] Controller Service Repository > ](103-controller-service-repo.html){: .btn .btn-green .float-right }
