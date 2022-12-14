<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP2</title>
</head>
<body>
    <div>
        <h1>회원가입</h1>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="userCreatePage" value="/user/join"></c:url>
                    <a href="${userCreatePage }">회원가입</a>
                </li>
            </ul>
        </nav>
        
        <main>
            <form method="post">
                <div>
                    <input type="text" name="userName" placeholder="아이디" required autofocus />
                </div>
                <div>
                    <input type="password" name="password" placeholder="비밀번호" required/>
                </div>
                <div>
                    <input type="email" name="email" placeholder="이메일" required/> 
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