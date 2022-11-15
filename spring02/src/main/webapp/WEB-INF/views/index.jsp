<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 02</title>
</head>
<body>
    <h1>메인 페이지</h1>
    <ul>
        <li>
            <c:url var="list" value="/post/list"></c:url>
            <a href="${list }">글목록</a>
        </li>
        <li>
            <c:url var="createPost" value="/post/create"></c:url>
            <a href="${createPost }">글 작성하기</a>
        </li>
    </ul>
</body>
</html>