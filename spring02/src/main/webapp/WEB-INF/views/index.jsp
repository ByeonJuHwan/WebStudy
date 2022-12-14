<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
<title>Spring 02</title>
</head>
<body>
    <div class="container-fluid">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>메인 페이지</h1>
        </header>

        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="list" value="/post/list"></c:url> <a class="nav-link active"
                    href="${list }">글목록</a></li>
                <li class="nav-item"><c:url var="createPost" value="/post/create"></c:url>
                    <a class="nav-link" href="${createPost }">글 작성하기</a></li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="">Link3</a>
                </li>
            </ul>
        </nav>
        
        <main> <!-- main content -->
            
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