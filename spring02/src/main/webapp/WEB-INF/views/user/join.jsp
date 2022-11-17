<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
</head>
<body>
    <div class="my-2 container-fluid">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>회원가입</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
            </ul>
        </nav>
        <main>
            <div class="card my-4">
                <c:url var="join" value="/user/join"></c:url>
                <form action="${ join}" method="post">
                    <div class="m-2">
                        <input type="text" name="userName" placeholder="회원이름" class="form-control"
                            required autofocus />
                    </div>
                    <div class="m-2">
                        <input type="password" name="password" placeholder="비밀번호" class="form-control"
                            required/>
                    </div>
                    <div class="m-2">
                        <input type="email" name="email" class="form-control"
                            placeholder=이메일 required />
                    </div>
                    <div class="m-2">
                        <input type="submit" class="form-control btn btn-outline-success" value="등록" /> <input class="form-control btn btn-outline-danger my-2"
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