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

![Untitled](https://user-images.githubusercontent.com/83402586/178889783-64b4abb7-650b-4519-bae3-3a865523563d.png)

## ERD

---

![Untitled 1](https://user-images.githubusercontent.com/83402586/178889771-3ba9c434-c375-4224-9b93-a9cb1c892794.png)

## Role

---

![Untitled 2](https://user-images.githubusercontent.com/83402586/178889776-b6496ff8-982f-446f-b144-d16418fab1aa.png)

## Trouble Shooting

---

### initParameter를 Java단에서도 사용하자

- web.xml에서 initParameter를 설정하게되면 Java단에서 initParameter를 활용하기가 불편
- 전역 상수로 Java단에서도 간편하게 사용하고 view단에서도 사용하기 위해 Java단에서 ServletContextListener을 구현하여 어플리케이션 초기화 당시에  Listener 를 등록하며 initParameter를 설정

- static class 생성

![Untitled 3](https://user-images.githubusercontent.com/83402586/178889777-f31f77dd-341f-40b8-b685-3bf4016a2033.png)

- ServletContextListener 구현

![Untitled 4](https://user-images.githubusercontent.com/83402586/178889779-0f95a18b-cef2-4fed-aa6b-e6ecbf30f9b1.png)

- web.xml에서 Listener 등록

![Untitled 5](https://user-images.githubusercontent.com/83402586/178889781-d33e1092-7832-40e9-963e-c73b1ca3c753.png)

### GitHub

---

[https://github.com/KangMyeungJun/GoodStore](https://github.com/KangMyeungJun/GoodStore)
