<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8"); %>
    <% response.setContentType("text/html;charset=utf-8"); %>
    <% String name = request.getParameter("username"); %>
    
    <h1><%=name %> 님 안녕하세요!!</h1>
</body>
</html>