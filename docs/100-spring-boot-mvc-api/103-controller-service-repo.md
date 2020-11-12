---
layout: default
title: Controller Service Repository
nav_order: 103
parent: Spring Boot MVC API
---

# [](#header)Controller Service Repository

작성일자 : 2020.11.09  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)

* * *

- 진행순서  
1. **[Intro](#1-intro)**
2. **[Repository](#2-repository)**
3. **[Service](#3-service)**
4. **[Controller](#4-controller)**

* * *

### 1. [](#header)**Intro**  
<br/>  
  
(이 블로그에서는 프론트가 제외된 순수 백엔드 REST API 서버에 대해서만 설명할 예정입니다.)  
  
<img src="/assets/images/spring-boot-mvc-api-controller-service-repo-01-01.png" width="700" height="700"/>  
(출처: [Spring Roo Docs](https://docs.spring.io/spring-roo/docs/current/reference/html/#application-architecture))  
  
Consumer로부터(사용자,다른서버 등)로 부터 Request(HTTP 등)가 오면  
  
Method, Path에 맞는 Controller의 함수로 들어오고  
  
Controller는 Service를 호출하여 서비스 로직을 수행하면서  
  
Service는 저장소(DB,외부서버 등)의 데이터 Read/Write를 하기위해  
필요할때마다 Repository를 호출하여 로직을 수행합니다.  
  
Controller : Request를 받는 역할 (+파라미터 Validation)  
Service : 서비스 로직을 수행하는 역할  
Repository : 저장소 접근 역할 (Read/Write)  

* * *

<img src="/assets/images/spring-boot-mvc-api-controller-service-repo-01-02.png" width="700" height="700"/>  
  
이전 시간에 사용한 프로젝트의 패키지,클래스 구성을 위와 같이 구성하였습니다.  
  
좌측 Project Explorer를 참고해주시고  
  
model 패키지에 Post 클래스를 만들어 우측과 같이 구현해두겠습니다.  
(사실 이번 시간에 멤버변수,멤버함수를 사용하지 않습니다.)  

* * *

### 2. [](#header)**Repository**  
<br/>  
  
Repository는 저장소에 접근하는 모델이며  
이번 예제로는 RDB를 사용하는 Repository 간단 예제만 보여드리겠습니다.  
  
<img src="/assets/images/spring-boot-mvc-api-controller-service-repo-02-01.png" width="700" height="700"/>  
  
repository 패키지에 PostRepository를 만들어  
5가지 역할의 함수를 추가한 모습입니다.  
  
```
@Repository
public interface PostRepository {
    // Post 리스트 조회
    List<Post> getPostList(Long limit, Long minPostId);

    // Post 단일 조회
    Post findPostById(Long id);

    // Post 생성
    int insertPost(Post post);

    // Post 수정
    int updatePost(Post post);

    // Post 삭제
    int deletePostById(Long id);
}
```

* * *

### 3. [](#header)**Service**  
<br/>  

Service는 서비스 로직을 수행하는 모델이며  
이번 예제로는 Repository 생성자 injection만 되어있는 간단 예제만 보여드리겠습니다. 
  
<img src="/assets/images/spring-boot-mvc-api-controller-service-repo-03-01.png" width="700" height="700"/>  
  
```
@Service
public class PostService {
    private final ObjectMapper objectMapper;
    private final PostRepository postRepository;

    public PostService(ObjectMapper objectMapper, PostRepository postRepository) {
        this.objectMapper = objectMapper;
        this.postRepository = postRepository;
    }
}
```
* * *

### 4. [](#header)**Controller**  
<br/>  
  
이 블로그에서는 프론트가 제외된 순수 백엔드 REST API 서버에 대해서만 설명할 예정입니다.  
  
Controller는 Method, Path에 맞는 Request를 처음에 받아주는 역할을 하는 모델이며  
이번 예제로는 Post에 대한 기본 Rest API 간단 예제만 보여드리겠습니다.  
  
<img src="/assets/images/spring-boot-mvc-api-controller-service-repo-04-01.png" width="700" height="700"/>  
  
Method, Path 명시는  
Mapping어노테이션들로 할 수 있고  
아래 예시를 참고해주세요.  
  
```
@RestController
public class PostController {
    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    // Post 리스트 조회 [GET] /posts
    @RequestMapping(method = RequestMethod.GET, path = "/posts")
    public Object getPostList() {
        throw new RuntimeException();
    }

    // Post 단일 조회 [GET] /posts/{id}
    @GetMapping("/posts/{id}") // == @RequestMapping(method = RequestMethod.GET, path = "/posts/{id}")
    public Object getPost(@PathVariable Long id) {
        throw new RuntimeException();
    }

    // Post 생성 [POST] /posts/{id}
    @PostMapping("/posts/{id}") // == @RequestMapping(method = RequestMethod.POST, path = "/posts/{id}")
    public ResponseEntity<Void> createPost(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        throw new RuntimeException();
    }

    // Post 수정 [PUT] /posts/{id}
    @PutMapping("/posts/{id}") // == @RequestMapping(method = RequestMethod.PUT, path = "/posts/{id}")
    public ResponseEntity<Void> modifyPost(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        throw new RuntimeException();
    }

    // Post 삭제 [DELETE] /posts/{id}
    @DeleteMapping("/posts/{id}") // == @RequestMapping(method = RequestMethod.DELETE, path = "/posts/{id}")
    public ResponseEntity<Void> deletePost(@PathVariable Long id) {
        throw new RuntimeException();
    }
}
```
* * *  
  
[ < [Prev] Config & Dependency Injection ](102-config-di.html){: .btn .btn-blue .float-left }

[ [Next] Lombok > ](104-lombok.html){: .btn .btn-green .float-right }