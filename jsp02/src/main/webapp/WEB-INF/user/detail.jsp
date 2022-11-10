<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP2</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
<style>
h1 {
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

.form{
    text-align: center;
}
li > a {
    color: skyblue;
    text-decoration: none;
}

a:hover {
    color: red;
}   
</style>
</head>
<body>
    <div class="form">
        <h1>회원 정보 확인</h1>
        <nav>
            <ul>
                <li><c:url var="mainPage" value="/"></c:url> <a
                    href="${mainPage }">메인페이지</a></li>
                <li><c:url var="userListPage" value="/user"></c:url>
                    <a href="${userListPage }">회원목록</a></li>
                <li><c:url var="userModifyPage"
                        value="/user/modify">
                        <c:param name="id" value="${user.id }"></c:param>
                    </c:url> <a href="${userModifyPage }">회원 정보 수정</a></li>
            </ul>
        </nav>

        <main>
            <form>
                <div>
                    <label for="id">회원번호</label> <input id="id"
                        type="text" value="${user.id }"  readonly />
                </div>
                <div>
                    <label for="userName">아이디</label> <input
                        id="userName" type="text"
                        value="${user.userName }" readonly />
                </div>
                <div>
                    <label for="password">비밀번호</label> <input
                        type="text" id="password"
                        value="${user.password }" readonly />
                </div>
                <div>
                    <label for="email">이메일</label> <input id="email"
                        type="text" value="${user.email }" readonly />
                </div>
                <div>
                    <label for="points">포인트</label> <input id="points"
                        type="number" value="${user.points }" readonly />
                </div>
            </form>
        </main>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>