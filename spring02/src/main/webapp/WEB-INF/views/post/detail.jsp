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
                        value="/post/create"></c:url> <a
                    class="nav-link" class="nav-link"
                    href="${createPage }">새 글 작성</a></li>
                <li class="nav-item"><c:url var="postList"
                        value="/post/list"></c:url> <a class="nav-link"
                    href="${postList }">글 목록보기</a></li>
                <li class="nav-item"><c:url var="postModify"
                        value="/post/modify">
                        <c:param name="id" value="${post.id }"></c:param>
                    </c:url> <a class="nav-link" href="${postModify }">글
                        수정하기</a></li>
            </ul>
        </nav>



        <main>
            <div class="card m-4">
                <div class="card-header"></div>
                <div class="card-body">
                    <form>
                        <div class="m-2">
                            <label for="id" class="form-label">번호</label> <input id="id"
                                class="form-control" type="text"
                                value="${post.id }" readonly />
                        </div>
                        <div class="m-2">
                            <label for="title" class="form-label">제목</label> <input
                                id="title" class="form-control"
                                type="text" value="${post.title }"
                                readonly />
                        </div>
                        <div class="m-2">
                            <label for="content" class="form-label">내용</label>
                            <textarea id="content" rows="5" cols="40"
                                class="form-control" readonly>${post.content}</textarea>
                        </div>
                        <div class="m-2">
                            <label for="author" class="form-label">작성자</label> <input
                                class="form-control" id="author"
                                type="text" value="${post.author }"
                                readonly />
                        </div>
                        <div class="m-2">
                            <label for="createdTime" class="form-label">작성시간</label> <input
                                class="form-control" id="createdTime"
                                type="text"
                                value="${post.created_time }" readonly />
                        </div>
                        <div class="m-2">
                            <label for="modifiedTime" class="form-label">수정시간</label> <input
                                class="form-control" id="modifiedTime"
                                type="text"
                                value="${post.modified_time }" readonly />
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