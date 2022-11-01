<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    <%-- JSP 주석 --%>
    <%-- Servlet/JSP 동박 방식 
    Servlet: Server + Applet 합성어.(웹 서버에서 실행되는, 요청을 처리하는 작은 프로그램.)
        -- 웹 서버가 클라이언트로부터 요청을 받았을 때 동적으로HTML문서를 생성하기 위한 기술.
        -- Java Class 작성
        -- Servlet의 생성과, Servlet객체의 메서드 호추은 WAS가 담당.
        -- 최초 요청 -> Servlet 객체 생성 -> doGet/doPost 메서드를 호출. -> 응답
        -- 요청 -> 생성된 Servlet 객체의 doGet/doPost 메서드를 호출 -> 응답
    
    JSP : Java Server Page
        - Servlet은 순수한 Java 코드이기 때문에 HTML을 작성하는 것이 힘들다.
        - HTML 형식의 문서에서 Java 코드들이 실행될 수 있도록 만든 웹 Server-side 기술.
        - JSP의 독작 원리 : jsp -> JAVA -> class -> 객체 생성 -> 메서드 호출
        * 최초 요청 -> jsp를 서블릿 클래스(java)로 변환 -> 컴파일 (class) -> 객체 생성 -> doGet/doPost 메서드 호출
        * 요청 -> 생성된 객체에서 메서드 호출 -> 응답
    --%>
    <% System.out.println("01_intro.jsp"); // 자바 주석 %>
    <h1>첫번째 JSP(Java Server Page)</h1>
    
    <% LocalDateTime now = LocalDateTime.now(); %>
    <h2>서버 시간 : <%= now.toString() %></h2>
    
    
</body>
</html>