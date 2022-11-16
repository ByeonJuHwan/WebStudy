<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring 2</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
</head>
<body>
    <div class="my-2 container-fluid">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>글 작성 페이지</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
                <li class="nav-item"><c:url var="postList"
                        value="/post/list"></c:url> <a class="nav-link"
                    href="${postList }">글 목록보기</a></li>
            </ul>
        </nav>
        <main>
            <div class="card my-4">
                <c:url var="create" value="/post/create"></c:url>
                <form action="${ create}" method="post">
                    <div class="m-2">
                        <input type="text" name="title" placeholder="제목" class="form-control"
                            required autofocus />
                    </div>
                    <div class="m-2">
                        <textarea rows="5" cols="80" name="content" class="form-control"
                            placeholder="내용" required></textarea>
                    </div>
                    <div class="m-2">
                        <input type="text" name="author" class="form-control"
                            placeholder="작성자" required />
                    </div>
                    <div class="m-2">
                        <input type="submit" class="form-control btn btn-success" value="등록" /> <input class="form-control"
                            type="reset" value="초기화" />
                    </div>
                </form>
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