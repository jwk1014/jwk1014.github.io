---
layout: default
title: Lombok
nav_order: 105
parent: Spring Boot MVC API
---

# [](#header)Lombok

작성일자 : 2020.11.10  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)  
  
* * *  
  
- 진행순서  
1. **[Intro & Setting](#1-intro--setting)**
2. **[How To Use](#2-how-to-use)**
3. **[Getter](#3-getter)**
4. **[Setter](#4-setter)**
5. **[EqualsAndHashCode](#5-equalsandhashcode)**
6. **[ToString](#6-tostring)**
7. **[NoArgsConstructor](#7-noargsconstructor)**
8. **[RequiredArgsConstructor](#8-requiredargsconstructor)**
9. **[AllArgsConstructor](#9-allargsconstructor)**
10. **[Builder](#10-builder)**
11. **[Data](#11-data)**
12. **[Value](#12-value)**  
  
* * *  
  
### 1. [](#header)**Intro & Setting**  
<br/>
Lombok 라이브러리는  
데이터 모델 클래스에 생성자, Getter, Setter, ToString등을  
편리하게 빌드시 자동 생성되도록 도와주는 어노테이션 라이브러리 입니다.  

<br/>

- **프로젝트에 Lombok 라이브러리 추가 (프로젝트 생성시)**  

<img src="/assets/images/spring-boot-mvc-api-getting-started-03-01.png" width="700" height="700"/>  
Getting Started에서 프로젝트 생성시 보여드렸듯이  
`ADD DEPENDENCIES`를 눌러  
**Lombok**을 검색하여 추가하면 사용할 수 있습니다.  

<br/>

<h3 id="1-intro--setting-기존-프로젝트">
  <a href="#1-intro--setting-기존-프로젝트" class="anchor-heading" aria-labelledby="1-intro--setting-기존-프로젝트"></a>
  <a href="#header"></a>
</h3>
- **프로젝트에 Lombok 라이브러리 추가 (기존 프로젝트)**  

build.gradle 내용입니다.  
<details>
<summary>build.gradle 스크린샷</summary>
<div markdown="1">
<img src="/assets/images/spring-boot-mvc-api-lombok-01-01.png" width="700" height="700"/> 
</div>
</details>  
<details>
<summary>build.gradle 코드</summary>
<div markdown="1">

```
plugins {
	id 'org.springframework.boot' version '2.3.5.RELEASE'
	id 'io.spring.dependency-management' version '1.0.10.RELEASE'
	id 'java'
}

group = 'com.example'
version = '0.0.1-SNAPSHOT'
sourceCompatibility = '11'

configurations {
	compileOnly {
		extendsFrom annotationProcessor
	}
}

repositories {
	mavenCentral()
}

dependencies {
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

</div>
</details>  
  
`dependencies`에  
`compileOnly 'org.projectlombok:lombok'`  
`annotationProcessor 'org.projectlombok:lombok'`  
두개를 추가하고  
  
<img src="/assets/images/spring-boot-mvc-api-lombok-01-02.png" width="350" height="350"/> 

우측에 있는 Gradle 메뉴를 열고  
새로고침 모양의 Reload 버튼을 눌러  
추가한 라이브러리를 load합니다.

<br/>

- **IntelliJ IDEA Annotation Processing 활성화**  
  
위와 같이 lombok 라이브러리를 추가하였습니다.  
프로젝트에 Lombok을 사용하시려면  
annotation processing 기능을 enable시켜야합니다.  

IntelliJ IDEA의 메뉴에서 Preferences를 열어주세요!  

<img src="/assets/images/spring-boot-mvc-api-lombok-01-03.png" width="700" height="700"/>  
  
<img src="/assets/images/spring-boot-mvc-api-lombok-01-04.png" width="700" height="700"/>  

Build, Execution, Development - Compiler - Annotation Processors  
위 항목에 들어가 Enable annotation processing을 체크하고  
OK를 눌러 창을 닫아주세요.  

* * *  

### 2. [](#header)**How To Use**  
<br/>  


자주쓰이는 Lombok 어노테이션 10가지  
  
`@Getter`  
`@Setter`  
`@EqualsAndHashCode`  
`@ToString`  
`@NoArgsConstructor`  
`@RequiredArgsConstructor`  
`@AllArgsConstructor`  
`@Builder`  
`@Data`  
`@Value`  
  
위 어노테이션들에 대해 설명드리겠습니다.  
  
* * *  

### 3. [](#header)**Getter**  
<br/>
아래 Getter 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `멤버변수(FIELD)`, `클래스(TYPE)`에 사용 가능한 것을 확인하실 수 있습니다.  
```
// Lombok 라이브러리 내 Getter 어노테이션 코드 내용 일부
@Target({ElementType.FIELD, ElementType.TYPE})
~~~
public @interface Getter {
    ~~~
}
```  

<br/>

- **`멤버변수(FIELD)` 수준 사용 예시**  
(어노테이션이 달린 멤버변수만 **Getter**가 생깁니다.)  

```
public class Post {
    @Getter
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post = new Post();
        Long id = post.getId();
    }
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스 내 모든 멤버변수에 **Getter**가 생깁니다.)  

```
@Getter
public class Post {
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post = new Post();
        Long id = post.getId();
        String title = post.getTitle();
    }
}
```
  
* * *  

### 4. [](#header)**Setter**  
<br/>
아래 Setter 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `멤버변수(FIELD)`, `클래스(TYPE)`에 사용 가능한 것을 확인하실 수 있습니다.  
```
// Lombok 라이브러리 내 Setter 어노테이션 코드 내용 일부
@Target({ElementType.FIELD, ElementType.TYPE})
~~~
public @interface Setter {
    ~~~
}
```  

<br/>

- **`멤버변수(FIELD)` 수준 사용 예시**  
(어노테이션이 달린 멤버변수만 **Setter**가 생깁니다.)  

```
public class Post {
    @Setter
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post = new Post();
        post.setId(1L);
    }
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스 내 모든 멤버변수에 **Setter**가 생깁니다.)  

```
@Setter
public class Post {
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post = new Post();
        post.setId(1L);
        post.setTitle("title");
    }
}
```
  
* * *  

### 5. [](#header)**EqualsAndHashCode**  
<br/>  
아래 EqualsAndHashCode 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.  
```
@Target(ElementType.TYPE)
~~~
public @interface EqualsAndHashCode {
    ~~~
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스의 모든 멤버필드를 사용하여 체크하는 **equals**와 **hashcode** 함수가 정의됩니다.)  

```
@EqualsAndHashCode
public class Post {
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post1 = new Post();
        Post post2 = new Post();
        boolean isEqual = post1.equals(post2);
        int post1HashCode = post1.hashCode();
    }
}
```

<br/>

- **특정 멤버 변수 제외**  
equals, hashcode에 **특정 멤버변수를 제외**시키고 싶다면  
해당 멤버변수에 `@EqualsAndHashCode.Exclude` 를 사용하시면 됩니다.  

```
@EqualsAndHashCode
public class Post {
    private Long id;
    @EqualsAndHashCode.Exclude
    private String title;
}
```

<br/>

[Lombok 공식문서 EqualsAndHashCode](https://projectlombok.org/features/EqualsAndHashCode) 설명을 참고한
예시의 Post클래스에 정의되는 equals, hashcode 함수는 아래와 같은 내용일 것 같습니다.
<details>
<summary>자동 정의 코드</summary>
<div markdown="1">

```
public class Post {
    private Long id;
    private String title;

    protected boolean canEqual(Object other) {
      return other instanceof Post;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof Post)) return false;
        Post other = (Post) o;
        if (!other.canEqual((Object)this)) return false;
        if (Long.compare(this.id, other.id) != 0) return false;
        if (this.getTitle() == null ? other.getTitle() != null : !this.getTitle().equals(other.getTitle())) return false;
        return true;
    }
  
    @Override
    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        result = (result*PRIME) + (this.id == null ? 43 : this.id.hashCode()));
        result = (result*PRIME) + (this.title == null ? 43 : this.title.hashCode());
        return result;
    }
}
```

</div>
</details>
* * *  

### 6. [](#header)**ToString**  
<br/>
아래 ToString 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.
```
@Target(ElementType.TYPE)
~~~
public @interface ToString {
    ~~~
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스의 모든 멤버필드를 사용하여 **toString** 함수가 정의됩니다.)  
  
```
@Setter
@ToString
public class Post {
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post1 = new Post();
        post1.setId(1L);
        post1.setTitle("title");
        System.out.println(post1);  // Post(id=1, title=title)
    }
}
```
  
<br/>

[Lombok 공식문서 ToString](https://projectlombok.org/features/ToString) 설명과  
실제 테스트한 결과 내용을 참고한  
예시의 Post클래스에 정의되는 toString 함수는 아래와 같은 내용일 것 같습니다.
<details>
<summary>자동 정의 코드</summary>
<div markdown="1">

```
public class Post {
    private Long id;
    private String title;

    ~~~~

    @Override 
    public String toString() {
        return "Post(id=" + this.id + ", title=" + this.title + ")";
    }
}
```

</div>
</details>

* * *  

### 7. [](#header)**NoArgsConstructor**  
<br/>
아래 NoArgsConstructor 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.  
```
@Target(ElementType.TYPE)
~~~
public @interface NoArgsConstructor {
    ~~~
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스에 **매개변수가 없는 생성자**가 정의됩니다.)  

```
@NoArgsConstructor
public class Post {
    private Long id;
    private String title;

    public Post(Long id) {
        this.id = id;
    }
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post1 = new Post();
    }
}
```
  
* * *  

### 8. [](#header)**RequiredArgsConstructor**  
<br/>
아래 RequiredArgsConstructor 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.  
```
@Target(ElementType.TYPE)
~~~
public @interface RequiredArgsConstructor {
    ~~~
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스의 **final이 붙은 멤버변수들을 매개변수로 가지는 생성자**가 정의됩니다.)  

```
@RequiredArgsConstructor
public class Post {
    private final Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post1 = new Post(1L);
    }
}
```
  
* * *  

### 9. [](#header)**AllArgsConstructor**  
<br/>
아래 AllArgsConstructor 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.  
```
@Target(ElementType.TYPE)
~~~
public @interface AllArgsConstructor {
    ~~~
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스의 **모든 멤버변수들을 매개변수로 가지는 생성자**가 정의됩니다.)  

```
@AllArgsConstructor
public class Post {
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post1 = new Post(1L, "title");
    }
}
```
  
* * *  

### 10. [](#header)**Builder**  
<br/>
클래스 Builder를 정의하여  
Builder를 통해 클래스를 생성할 수 있도록 해주는 어노테이션입니다.  
```
@Target({TYPE, METHOD, CONSTRUCTOR})
~~~
public @interface Builder {
    ~~~
}
```

<br/>

- **`클래스(TYPE)` 사용 예시**  
(클래스의 Builder클래스가 정의됩니다.)  

```
@Builder
public class Post {
    private Long id;
    private String title;
}

class ApplicationTests {
    @Test
    void contextLoads() {
        Post post1 = Post.builder()
                .id(1L)
                .title("title")
                .build();
    }
}
```

<br/>

[Lombok 공식문서 Builder](https://projectlombok.org/features/Builder) 설명을 참고한  
예시의 Post클래스에 정의되는 Builder 클래스는 아래와 같은 내용일 것 같습니다.
<details>
<summary>자동 정의 코드</summary>
<div markdown="1">

```
public class Post {
    private Long id;
    private String title;

    Post(Long id, String title) {
      this.id = id;
      this.title = title;
    }

    public static PostBuilder builder() {
        return new PostBuilder();
    }

    public static class PostBuilder {
        private Long id;
        private String title;
    
        PostBuilder() {
        }
    
        public PostBuilder name(Long id) {
            this.id = id;
            return this;
        }
    
        public PostBuilder title(String title) {
            this.title = title;
            return this;
        }

        public Post build() {
          return new Post(id, title);
        }
    
        @Override
        public String toString() {
            return "Post.PostBuilder(id=" + this.id + ", title=" + this.title + ")";
        }
    }
}
```

</div>
</details>


  
* * *  

### 11. [](#header)**Data**  
<br/>
아래 Data 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.
```
// Equivalent to {@Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode}
@Target(ElementType.TYPE)
~~~
public @interface Data {
    ~~~
}
```

<br/>

Data 어노테이션 코드에 주석을 참고하면  
Data 어노테이션의 기능은  
`@Data` = `@Getter` + `@Setter` + `@RequiredArgsConstructor` + `@ToString` + `@EqualsAndHashCode`
입니다.

위 어노테이션에 대한 설명은 위에서 모두 했으므로 생략하겠습니다.

* * *  

### 12. [](#header)**Value**  
<br/>
아래 Value 어노테이션 구현된 코드 내용을 참고하시면  
해당 어노테이션은 `클래스(TYPE)`만 사용 가능한 것을 확인하실 수 있습니다.
```
// Equivalent to {@Getter @FieldDefaults(makeFinal=true, level=AccessLevel.PRIVATE) @AllArgsConstructor @ToString @EqualsAndHashCode}.
@Target(ElementType.TYPE)
~~~
public @interface Value {
    ~~~
}
```

<br/>

Value 어노테이션 코드에 주석을 참고하면  
Value 어노테이션의 기능은  
`@Value` = `@Getter` + `@FieldDefaults(makeFinal=true, level=AccessLevel.PRIVATE)` + `@AllArgsConstructor` + `@ToString` + `@EqualsAndHashCode`
입니다.  
  
`@FieldDefaults` 어노테이션은 멤버변수들을 private final로 만드는 어노테이션으로 보입니다.  
나머지 어노테이션에 대한 설명은 위에서 모두 했으므로 생략하겠습니다.  
  
* * *  
  
[ < [Prev] Controller Service Repository ](104-controller-service-repo.html){: .btn .btn-blue .float-left }

[ [Next] Json & ObjectMapper & Gson > ](106-json.html){: .btn .btn-green .float-right }
<br/>  