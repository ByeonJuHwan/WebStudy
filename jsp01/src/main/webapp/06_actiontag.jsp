<%@page import="edu.web.jsp01.domain.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    <h1>JSP Action Tag</h1>
    <%-- scriptlet에서 사용되는 자바 코드들을 HTML과 비슷한 태그로 대체하기 위해서 정의된 태그들 
        <jsp:태그이름>...</jsp:태그이름>
        o. <jsp:forward>
        o. <jsp:include>
        o. <jsp:userBean>
    --%>
    
    <% // scriptlet
    Contact contact = new Contact();
    
    //setter를 사용해서 필드의 값들을 초기화
    contact.setName("변주환");
    contact.setPhone("000-0000-0000");
    contact.setEmail("saf@naver.com");
    
    // getter 메서드들과 내장 객체 out을 사용해서 HTML로 출력
    out.println(contact.getName()+"<br/>");
    out.println(contact.getPhone()+"<br/>");
    out.println(contact.getEmail()+"<br/>");
    %>
    
    <h2>useBean</h2>
    <%-- 기본생성자를 이용하기 때문에 클래스에서 기본생성자를 만들어놓지 않으면 사용할수 없다. --%>
    <jsp:useBean id="contact2" class="edu.web.jsp01.domain.Contact"></jsp:useBean>
    <%-- Contact contact2 = new Contact(); --%>
    
    <jsp:setProperty property="name" name="contact2" value="홍길동"/>
    <%-- contact2.setName("홍길동"); name 속성 = 설정할 객체의 이름--%>
    <jsp:setProperty property="phone" name="contact2" value="010-123-123"/>
    <jsp:setProperty property="email" name="contact2" value="hong@naver.com"/>
    
    <jsp:getProperty property="name" name="contact2"/>
    <br>
    <%-- contact2.getName(); --%>
    <jsp:getProperty property="phone" name="contact2"/>
    <br>
    <jsp:getProperty property="email" name="contact2"/>
    <br>
</body>
</html>