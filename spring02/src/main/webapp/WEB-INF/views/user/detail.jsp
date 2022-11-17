<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring2</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
</head>
<body>
    <div class="my-2">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>글 목록 페이지</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
                <li class="nav-item"><c:url var="createPage"
                        value="/user/create"></c:url> <a
                    class="nav-link" href="${createPage }">새 글 작성</a></li>
                <li class="nav-item"><c:url var="userList"
                        value="/user/list"></c:url> <a class="nav-link"
                    href="${userList }">회원 목록</a></li>
                <li class="nav-item"><c:url var="userModify"
                        value="/user/modify">
                        <c:param name="id" value="${user.id }"></c:param>
                    </c:url> <a class="nav-link" href="${userModify }">
                        회원정보수정</a></li>
            </ul>
        </nav>



        <main>
            <div class="card m-4">
                <div class="card-header"></div>
                <div class="card-body">
                    <form>
                        <div class="m-2">
                            <label for="id" class="form-label">회원번호</label>
                            <input id="id" class="form-control"
                                type="text" value="${user.id }" readonly />
                        </div>
                        <div class="m-2">
                            <label for="userName" class="form-label">아이디</label>
                            <input id="userName" class="form-control"
                                type="text" value="${user.userName }"
                                readonly />
                        </div>
                        <div class="m-2">
                            <label for="password" class="form-label">비밀번호</label>
                            <input id="password" class="form-control"
                                type="password" value="${user.password }"
                                readonly />
                        </div>
                        <div class="m-2">
                            <label for="email" class="form-label">이메일</label>
                            <input class="form-control" id="email"
                                type="email" value="${user.email }"
                                readonly />
                        </div>
                        <div class="m-2">
                            <label for="points" class="form-label">포인트</label>
                            <input class="form-control" id="points"
                                type="number"
                                value="${user.points }" readonly />
                        </div>
                    </form>
                </div>
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
</html>