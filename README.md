# GoodStore

## 쌍용3차 프로젝트 (SpringMVC, MyBatis)

### 인원 및 일정

---

- 인원 : 4인
- 일정 : 2022.05.12~2022.06.14

## 사용기술

---

- OS : window10,ubuntu
- Server : Apache Tomcat9.0
- Language : Java,Javascript,HTML5,CSS
- DB : Oracle12g
- Framework/Flatform : Spring,MyBatis,JSP,JQuery
- Tool : GitHub,STS,Maven

## 프로젝트 목적

---

- SpringMVC, MyBatis를 활용한 사회적 기업 쇼핑몰 구축

## 서버구성도

---

![Untitled](GoodStore%20db988c781b5d46d1b40de635ca96aaad/Untitled.png)

## ERD

---

![Untitled](GoodStore%20db988c781b5d46d1b40de635ca96aaad/Untitled%201.png)

## Role

---

![Untitled](GoodStore%20db988c781b5d46d1b40de635ca96aaad/Untitled%202.png)

## Trouble Shooting

---

### initParameter를 Java단에서도 사용하자

- web.xml에서 initParameter를 설정하게되면 Java단에서 initParameter를 활용하기가 불편
- 전역 상수로 Java단에서도 간편하게 사용하고 view단에서도 사용하기 위해 Java단에서 ServletContextListener을 구현하여 어플리케이션 초기화 당시에  Listener 를 등록하며 initParameter를 설정

- static class 생성

![Untitled](GoodStore%20db988c781b5d46d1b40de635ca96aaad/Untitled%203.png)

- ServletContextListener 구현

![Untitled](GoodStore%20db988c781b5d46d1b40de635ca96aaad/Untitled%204.png)

- web.xml에서 Listener 등록

![Untitled](GoodStore%20db988c781b5d46d1b40de635ca96aaad/Untitled%205.png)

### GitHub

---

[https://github.com/KangMyeungJun/GoodStore](https://github.com/KangMyeungJun/GoodStore)
