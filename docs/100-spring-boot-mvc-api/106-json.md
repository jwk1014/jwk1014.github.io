---
layout: default
title: Json & ObjectMapper & Gson
nav_order: 106
parent: Spring Boot MVC API
---

# [](#header)Json & ObjectMapper & Gson

작성일자 : 2020.11.13  

* * *

프로젝트 생성 : [Spring Initializr](https://start.spring.io)  
IDE : [Spring IntelliJ IDEA Community](https://www.jetbrains.com/idea/download)

* * *

- 진행순서  
1. **[Intro](#1-intro)**
2. **[Jackson](#2-jackson)**
3. **[Gson](#3-gson)**

* * *
  
### 1. [](#header)**Intro**  
<br/>

`JSON`(`JavaScript Object Notation`)은  
`키-값 쌍`의 데이터 오브젝트를 전달하기 위한  
텍스트로 표기되는 개방형 표준 포맷입니다.  
  
이해하기 어려우면 일단은 `Java`의 `Map<String, Object>` 타입과 유사하다고 생각하시면 됩니다.  
  
**서버**가 **요청**을 받거나 **응답**을 보내줄때 **내용(body)**을 표기하는 형식 중 하나로 대표적으로 많이 쓰이고 있습니다.  

**서버**코드는 `Java`이고 **요청/응답에 쓰이는 body**는 `JSON`이기 때문에  
변환해주는 라이브러리가 필요한데  
`Spring`에서 `JSON` 변환에 대표적으로 쓰이는 라이브러리 2개를 소개하겠습니다.  
  
* * *
  
### 2. [](#header)**Jackson**  
<br/>

`Spring` 프레임워크에 기본으로 `Jackson` 라이브러리가 포함되어 있습니다.  
`Jackson`으로 `JSON`을 다룰 수 있습니다. 

- **Model**  

```
public class User {
    private String name;
    private Integer age;
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    @Override
    public String toString() { return "User{name='" + name + "', age=" + age + '}'; }
}
```

- **JSON -> Java Instance**  

```  
//@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {

		ObjectMapper objectMapper = new ObjectMapper();

		String json = "{\"name\":\"테스트\",\"age\":30}";
		User user = null;

		try {
			user = objectMapper.readValue(json, User.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return;
		}

		System.out.println(user);
	}
}

// User{name='테스트', age=30}
```

<br/>

- **Java Instance -> JSON**  

```
//@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {

		ObjectMapper objectMapper = new ObjectMapper();

		User user = new User();
		user.setName("테스트");
		user.setAge(30);
		String json;

		try {
			json = objectMapper.writeValueAsString(user);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return;
		}

		System.out.println(json);
	}
}

// {"name":"테스트","age":30}
```

결과가 잘 나오는 코드를 확인하실 수 있습니다.  
(User클래스를 만들고, test에 있는 ApplicationTests의 @SpringBootTest를 주석하고, contextLoads함수 왼쪽의 실행버튼을 사용하시면 테스트 하실 수 있습니다.)  

<details>
<summary>ObjectMapper Options</summary>
<div markdown="1">

```
    public static ObjectMapper create() {
        return new ObjectMapper()
                .setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE) // JSON 필드명 snake case
                .setSerializationInclusion(JsonInclude.Include.NON_NULL) // Java -> JSON NULL값 필드 제외
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false) // JSON -> Java JSON 필드가 Java 멤버변수에 없을때 에러나지않고 무시  
                .setTimeZone(TimeZone.getTimeZone("Asia/Seoul"))
                .setDateFormat(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"));
    }
```

</div>
</details>

<details>
<summary>Model Annotations</summary>
<div markdown="1">

```
// @JsonNaming(PropertyNamingStrategy.class) // JSON 필드명 camel case
// @JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class) // JSON 필드명 snake case
// @JsonIgnoreProperties(ignoreUnknown = true) // JSON -> Java JSON 필드가 Java 멤버변수에 없을때 에러나지않고 무시
// @JsonInclude(JsonInclude.Include.NON_NULL) // Java -> JSON NULL값 필드 제외
public class User {
    private String id;
    @JsonIgnore // JSON 필드 제외
    private String pw;
    @JsonProperty("email_address") // JSON 필드명 명시
    private String emailAddress;
    private String name;
    private Integer age;
    
    <!-- Getter Setter toString -->
}
```

</div>
</details>

<details>
<summary>Custom Serialization(to JSON) Deserialization(from JSON)</summary>
<div markdown="1">


StdSerializer StdDeserializer를 사용하여 구현하면 됩니다.  

[Baeldung StdSerializer](https://www.baeldung.com/jackson-custom-serialization)

</div>
</details>

* * *
  
### 3. [](#header)**Gson**  
<br/>

`Google`에서 만든 `JSON`을 다루는 라이브러리로  
`Java` 코드에서 `JSON`을 다루는 곳(서버/안드로이드 등)에서 많이 사용되고 있습니다.  

- **build.gradle dependencies 추가**
```
implementation 'com.google.code.gson:gson:2.8.6'
```
build.gradle의 dependencies에 추가하고 reload해주세요.
([lombok Intro & Setting의 기존 프로젝트 라이브러리 추가 방법 참고](105-lombok.html#1-intro--setting-기존-프로젝트))

- **Model**  

```
public class User {
    private String name;
    private Integer age;
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    @Override
    public String toString() { return "User{name='" + name + "', age=" + age + '}'; }
}
```

- **JSON -> Java Instance**  

```
//@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {

		Gson gson = new Gson();

		String json = "{\"name\":\"테스트\",\"age\":30}";
		User user = null;

		user = gson.fromJson(json, User.class);

		System.out.println(user);
	}
}

// User{name='테스트', age=30}
```

- **Java Instance -> JSON**  

```
//@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {

		Gson gson = new Gson();

		User user = new User();
		user.setName("테스트");
		user.setAge(30);
		String json;

		json = gson.toJson(user);

		System.out.println(json);
	}
}

// {"name":"테스트","age":30}
```

결과가 잘 나오는 코드를 확인하실 수 있습니다.  
(User클래스를 만들고, test에 있는 ApplicationTests의 @SpringBootTest를 주석하고, contextLoads함수 왼쪽의 실행버튼을 사용하시면 테스트 하실 수 있습니다.)  

<details>
<summary>Gson Options</summary>
<div markdown="1">

```
		Gson gson = new GsonBuilder()
				.setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES) // JSON 필드명 snake case
				.registerTypeAdapter(CustomType.class,  new CustomTypeAdapter()) // 특정 타입 변환 Adapter 설정
        .excludeFieldsWithoutExposeAnnotation() // @expose 어노테이션으로 특정 필드 숨김 가능하도록 처리
				.serializeNulls() // null값 필드 JSON 표시하기
				.setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
				.create();
```

type adapter는 [공식 문서](https://sites.google.com/site/gson/gson-user-guide#TOC-Custom-Serialization-and-Deserialization)에 잘 설명되어 있습니다.

</div>
</details>

<details>
<summary>Model Annotations</summary>
<div markdown="1">

```
public class User {
    private String id;
    @Expose // JSON 필드 제외 / GsonBuilder excludeFieldsWithoutExposeAnnotation 설정 필요
    private String pw;
    @SerializedName("email_address") // JSON 필드명 명시
    private String emailAddress;
    private String name;
    private Integer age;
    
    <!-- Getter Setter toString -->
}
```

</div>
</details>

<details>
<summary>Custom Serialization(to JSON) Deserialization(from JSON)</summary>
<div markdown="1">


JsonSerializer StdDeserializer를 사용하여 구현하면 됩니다.  

[Google Gson Document](https://sites.google.com/site/gson/gson-user-guide#TOC-Custom-Serialization-and-Deserialization)

</div>
</details>

* * *

[ < [Prev] Lombok ](105-lombok.html){: .btn .btn-blue .float-left }

[ [Next] Test (JUnit5) > ](107-test.html){: .btn .btn-green .float-right }
<br/>  