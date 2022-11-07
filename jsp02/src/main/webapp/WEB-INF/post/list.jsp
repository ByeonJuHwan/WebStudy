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
   table {
    text-align: center;
   }
   
   ul{
    text-align: center;
    list-style: none;
    padding: 0px;
    
    
   }
   li{
   margin : 4px;
    display: inline-block;
   }
   
   a{
    color : skyblue;
    text-decoration: none;
   }
   
   a:hover {
    color:red;
}
</style>
</head>
<body>

    <div>
        <h1 style="text-align: center">포스트 목록 페이지</h1>

        <nav>
            <!-- 웹 서버 내에서 이동 메뉴 -->
            <ul>
                <li><a href="/jsp02">메인 페이지</a></li>
                <li><a href="post/create">포스트 작성</a></li>
            </ul>
        </nav>

        <main>
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
                    <c:forEach var="p" items="${posts }">
                        <tr>
                            <td>${p.id }</td>
                            <td>${p.title }</td>
                            <td>${p.author }</td>
                            <td>${p.modifiedTime }</td>
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
</body>
</html>