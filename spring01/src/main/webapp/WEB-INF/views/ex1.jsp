<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 01</title>
</head>
<body>
    <h1>Example 1</h1>
    
    <c:url var="mainpage" value="/"></c:url>
    <a href="${ mainpage}">메인페이지</a>
    <h2>GET: ex2</h2>
    <c:url var="ex2" value="/ex2"></c:url>
    <form action="${ex2 }" method="get">
        <input type="text" placeholder="사용자 이름" name="userName"/>
        <input type="number" placeholder="나이" name="age"/>
        <input type="submit" value="제출"/>
    </form>
    
    <h2>POST: ex3</h2>
    <c:url var="ex3" value="/ex3"></c:url>
    <form action="${ex3 }" method="post">
        <input type="text" placeholder="사용자 이름" name="userName"/>
        <input type="number" placeholder="나이" name="age"/>
        <input type="submit" value="제출"/>
    </form>
</body>
</html>