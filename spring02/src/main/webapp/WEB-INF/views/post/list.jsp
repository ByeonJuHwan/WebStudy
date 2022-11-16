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
            <h1>글 목록 페이지</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
                <li class="nav-item"><c:url var="createPage"
                        value="/post/create"></c:url> <a
                    class="nav-link" href="${createPage }">새 글 작성</a></li>
            </ul>
        </nav>
        <main class="my-2">
            <div class="card">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>수정 시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${list }">
                            <c:url var="postDetailPage"
                                value="/post/detail">
                                <c:param name="id" value="${p.id }"></c:param>
                            </c:url>
                            <tr
                                onclick="location.href='${postDetailPage}'">
                                <td>${p.id }</td>
                                <td>${p.title }</td>
                                <td>${p.author }</td>
                                <td>${p.modified_time }</td>
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