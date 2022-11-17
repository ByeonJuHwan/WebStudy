<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글목록</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
<style>
table {
    text-align: center;
}
</style>
</head>
<body>
    <div class="container-fluid">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>회원 목록</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
                <li class="nav-item"><c:url var="joinUser"
                        value="/user/join"></c:url> <a
                    class="nav-link" href="${joinUser }">회원가입</a></li>
            </ul>
        </nav>
        <main class="my-2">
            <div class="bg-light my-2">
                <c:url var="userSearchPage" value="/user/search"></c:url>
                <form action="${userSearchPage }">
                    <div class="row">
                        <div class="col-5">
                            <select class="form-control" name="type">
                                <option value="id">아이디</option>
                                <option value="email">이메일</option>
                            </select>
                        </div>
                        <div class="col-5">
                            <input class="form-control" type="text"
                                name="keyword" required autofocus
                                placeholder="검색어" />
                        </div>
                        <div class="col-2">
                            <input
                                class="form-control btn btn-outline-success"
                                type="submit" value="검색" />
                        </div>
                    </div>
                </form>
            </div>

            <div class="card my-2">
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
                        <c:forEach var="u" items="${list }">
                            <c:url var="userDetailPage"
                                value="/user/detail">
                                <c:param name="id" value="${u.id }"></c:param>
                            </c:url>
                            <tr
                                onclick="location.href='${userDetailPage}'">
                                <td>${u.id }</td>
                                <td>${u.userName }</td>
                                <td>${u.password }</td>
                                <td>${u.email }</td>
                                <td>${u.points }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous"></script>
</body>
</body>
</html>