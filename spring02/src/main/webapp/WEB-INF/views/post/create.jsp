<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 2</title>
</head>
<body>
    <div>
        <h1>포스트 작성 페이지</h1>
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${mainPage }">메인페이지</a>
                </li>
                <li>
                    <c:url var="create" value="/post/list"></c:url>
                    <a href="${create }">글 목록보기</a>
                </li>
            </ul>
        </nav>
        <main>
            <c:url var="create" value="/post/create"></c:url>
            <form action="${ create}" method="post" >
                <div>
                    <input type="text" name="title" placeholder="제목" required autofocus />
                </div>
                <div>
                    <textarea rows="5" cols="80" name="content" placeholder="내용" required></textarea>
                </div>
                <div>
                    <input type="text" name="author" placeholder="작성자" required/> 
                </div>
                <div>
                    <input type="submit" value="등록"/> 
                    <input type="reset" value="초기화"/> 
                </div>
            </form>
        </main>
    </div>
</body>
</html>