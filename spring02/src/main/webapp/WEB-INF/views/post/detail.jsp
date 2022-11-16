<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                    class="nav-link" href="${createPage }">새 글 작성</a></li>
                <li>
                    <c:url></c:url>
                    <a href="">글 목록보기</a>
                </li>
            </ul>
        </nav>



        <main>
            <form>
                <div>
                    <label for="id">번호</label> <input id="id"
                        type="text" value="${post.id }" readonly />
                </div>
                <div>
                    <label for="title">제목</label> <input id="title"
                        type="text" value="${post.title }" readonly />
                </div>
                <div>
                    <label for="content"></label>
                    <textarea id="content" rows="5" cols="40" readonly>${post.content}</textarea>
                </div>
                <div>
                    <label for="author">작성자</label> <input id="author"
                        type="text" value="${post.author }" readonly />
                </div>
                <div>
                    <label for="createdTime"></label> <input
                        id="createdTime" type="text"
                        value="${post.created_time }" readonly />
                </div>
                <div>
                    <label for="modifiedTime"></label> <input
                        id="modifiedTime" type="text"
                        value="${post.modified_time }" readonly />
                </div>
            </form>
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