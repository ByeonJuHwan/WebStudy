<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 목록 페이지</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
<style>
table {
    text-align: center;
}

ul {
    text-align: center;
    list-style: none;
    padding: 0px;
}

li {
    margin: 4px;
    display: inline-block;
}

a {
    color: skyblue;
    text-decoration: none;
}

a:hover {
    color: red;
}

#search {
    text-align: center;
}
</style>
</head>
<body>
    <div>
        <h1 style="text-align: center">회원 목록</h1>
        <nav>
            <ul>
                <li><c:url var="mainPage" value="/"></c:url> <a
                    href="${mainPage }">메인 페이지</a></li>
                <li><c:url var="joinUserPage" value="/user/join"></c:url>
                    <a href="${joinUserPage }">회원가입</a></li>
            </ul>
        </nav>
        <main>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>회원번호</th>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>이메일</th>
                        <th>포인트</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${userList}">
                    <c:url var="userDetailPage" value="/user/detail">
                        <c:param name="id" value="${u.id }"></c:param>
                    </c:url>
                        <tr onclick="location.href='${userDetailPage}'">
                            <td>${u.id }</td>
                            <td>${u.userName }</td>
                            <td>${u.password }</td>
                            <td>${u.email }</td>
                            <td>${u.points }</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>