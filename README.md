# Getting Started Github Pages With Jekyll 

루비가 설치되어있어야합니다.
bundler가 설치되어있어야합니다.  
  
[Github Pages Jekyll Version](https://pages.github.com/versions/)  
  
위 링크를 통해 Jekyll 버전 확인 후
`계정명.github.io` Repository를 만들고나서
아래 내용을 진행해주세요.  
  
<br/>
  
```
$ bundle init

$ echo "gem \"jekyll\", \"확인한버전\"" >> Gemfile

$ bundle install

$ bundle exec jekyll new . --force

$ bundle exec jekyll serve

$ bundle install

$ bundle exec jekyll serve
```
  
<br/>
  
터미널을 종료하지 않고 브라우저에서 `localhost:4000`를 접속하여  
정상적으로 Jekyll 기본테마 블로그가 표시되는지 확인하시면 성공입니다.  
  
_config.yml 파일 내에  
title, email, twitter_username, github_username 등의 값을 변경해주세요.  
  
확인되면 master브랜치에 commit & push하고 5분 뒤에  
브라우저로 `계정명.github.io`에 접속하여 잘 뜨는지 확인하세요.
<br/><br/>
## 테마 변경

_config.yml 파일 내에

기존에 있던 theme 부분 주변을 모두 주석하고 사용할 테마를 작성하고 저장합니다.
(저는 just-the-docs 테마를 사용하려고 합니다.)
  
```
theme: just-the-docs
```
  
아래 테마 Repository를 git clone 받고

```  
git clone https://github.com/pmarsceill/just-the-docs/tree/v0.3.3
```  
  
아래 폴더들을 복사해옵니다.

```
_includes
_layouts
_sass
assets/css
assets/js
```

_includes/head.html 파일 내용 마지막 부분에 있는 아래 코드를 **제거**합니다.
```
{% seo %}
```  
  
아래와 같이 실행하여 정상 작동을 확인하고 commit & push 합니다.

```
$ echo "gem \"just-the-docs\"" >> Gemfile

$ bundle install

$ bundle exec jekyll serve
```

