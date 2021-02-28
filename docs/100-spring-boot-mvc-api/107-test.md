---
layout: default
title: Test (JUnit5)
nav_order: 107
parent: Spring Boot MVC API
---

# [](#header)Test (JUnit5)

작성일자 : 2021.02.28  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)

* * *

- 진행순서  
1. **[Unit Test](#1-unit-test)**
2. **[Setting](#2-setting)**
3. **[JUnit5](#3-junit5)**
4. **[Concurrency](#4-concurrency)**
5. **[CRUD Api Test](#5-curd-api-test)**

* * *
  
### 1. [](#header)**Unit Test**  
<br/>

이전에 구현하였던 PostController의 getPostList를 대상으로 간단하게 테스트 하는 코드를 작성해보겠습니다.  
  
<details>
<summary>PostController getPostList</summary>
<div markdown="1">
  
```
@RestController
public class PostController {
//    private final PostService postService;

    // Post 리스트 조회 [GET] /posts
    @RequestMapping(method = RequestMethod.GET, path = "/posts")
    public Object getPostList() {
        throw new RuntimeException();
    }
```
  
</div>
</details>
  
test에 controller 패키지를 만들고  
PostControllerTests 클래스를 구현하겠습니다.  
( 아래 이미지 좌측에 있는 Project Explorer를 참고해주세요 )  

<img src="/assets/images/spring-boot-mvc-api-test-01-01.png" width="700" height="700"/>  
  
```  
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.springframework.util.Assert.*;

@SpringBootTest
public class PostControllerTests {
    @Autowired
    PostController postController;

    @Test
    @DisplayName("Get Post List")
    void contextLoads() {
        notNull(postController.getPostList(), "must not be empty");
    }
}
```  
  
test 내부에 있는 클래스 위에  
`@SpringBootTest`을 표기한 클래스는 Test 클래스가 됩니다.  
  
테스트 클래스 내에서  
Controller/Service/Repository 등 Component instance를 불러오도록 하는 Component Injection으로는  
주로 `@Autowired`를 사용합니다.  
  
Test 클래스 내 함수 위에  
`@Test`를 표기한 클래스는 해당 클래스 전체 테스트 실행 시 실행되는 테스트 함수로 취급되며  
주로 리턴타입은 void 매개변수는 없는 형태입니다.  
  
`@Test`와 같이 `@DisplayName`을 표기하면  
해당 테스트에 대해 원하는 이름을 명시할 수 있습니다.  
  
테스트 실행은  
<details>
<summary>1. test에 있는 <b>모든</b> <code class="language-plaintext highlighter-rouge">@SpringBootTest</code><b>클래스</b>의 <b>모든</b> <code class="language-plaintext highlighter-rouge">@Test</code><b>함수</b> 실행</summary>
<div markdown="1">
<img src="/assets/images/spring-boot-mvc-api-test-01-02.png" width="700" height="700"/>
</div>
</details>
<details>
<summary>2. <b>특정(1개)</b> <code class="language-plaintext highlighter-rouge">@SpringBootTest</code>클래스의 <b>모든</b> <code class="language-plaintext highlighter-rouge">@Test</code><b>함수</b> 실행</summary>
<div markdown="1">
<img src="/assets/images/spring-boot-mvc-api-test-01-03.png" width="700" height="700"/>
</div>
</details>
<details>
<summary>3. <b>특정(1개)</b> <code class="language-plaintext highlighter-rouge">@SpringBootTest</code>클래스의 <b>특정(1개)</b> <code class="language-plaintext highlighter-rouge">@Test</code><b>함수</b> 실행</summary>
<div markdown="1">
<img src="/assets/images/spring-boot-mvc-api-test-01-04.png" width="700" height="700"/>
</div>
</details>
  
3가지 수준으로 실행 가능합니다.  
  
또한 `gradlew build` 명령으로 빌드 하는 경우에 모든 테스트가 실행되며 모두 성공해야 빌드가 완료됩니다.  
(빌드 시 테스트를 skip하려면 `gradle build -x test`로 하시면 됩니다.)  
  
아래는 위 코드의 테스트 실행 결과입니다.  
  
<img src="/assets/images/spring-boot-mvc-api-test-01-05.png" width="700" height="700"/>  
  
좌측에 테스트 별로 결과가 나오도록 되어있습니다.  
  
위 스크린샷은 좌측에 DisplayName("Get Post List")을 클릭한 화면인데  
해당 테스트에 대한 출력 결과만 표시됩니다.  
(`throw new RuntimeException`을 했으므로 위와 같은 에러 출력이 맞습니다.)  
  

  
* * *
  
### 2. [](#header)**Setting**  
<br/>



* * *
  
### 3. [](#header)**JUnit5**  
<br/>

**준비중입니다.**

* * *
  
### 4. [](#header)**Concurrency**  
<br/>

**준비중입니다.**
  
* * *
  
### 5. [](#header)**CRUD Api Test**  
<br/>

**준비중입니다.**
  
* * *

[ < [Prev] Json & ObjectMapper & Gson ](106-json.html){: .btn .btn-blue .float-left }
<br/>  