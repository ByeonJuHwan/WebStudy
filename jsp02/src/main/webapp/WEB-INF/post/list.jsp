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

ul {
    text-align: center;
    list-style: none;
    padding: 0px;
}

li {
    margin: 4px;
    display: inline-block;
}

a {
    color: skyblue;
    text-decoration: none;
}

a:hover {
    color: red;
}

#search{
    text-align: center;
}
</style>
</head>
<body>
    <div>
        <c:if test="${not searchPage}">
            <h1 style="text-align: center">포스트 목록 페이지</h1>
        </c:if>
        <c:if test="${ searchPage }">
            <h1 style="text-align: center">포스트 검색 결과 페이지</h1>
        </c:if>
        <nav>
            <!-- 웹 서버 내에서 이동 메뉴 -->
            <ul>
                <%-- 로그인 정보가 있는 경우 --%>
                <%-- EL not empty 연산자 : not null && "" --%>
                <c:if test="${ not empty signInUser}">
                    <li><c:url var="signOutPage"
                            value="/user/signout"></c:url>
                            <span>${signInUser}</span> <a
                        href="${ signOutPage}">로그아웃</a></li>
                </c:if>

                <%-- 로그인 정보가 없는 경우 --%>
                <c:if test="${ empty signInUser}">
                    <li><c:url var="signInPage"
                            value="/user/signin"></c:url> <a
                        href="${signInPage }">로그인</a></li>
                    <li><c:url var="signUpPage"
                            value="/user/signup"></c:url> <a
                        href="${ signUpPage}">회원가입</a></li>
                </c:if>
                
                <li><c:url var="mainPage" value="/"></c:url> <a
                    href="${mainPage }">메인 페이지</a></li>
                <li><c:url var="postCreatePage"
                        value="/post/create"></c:url> <a
                    href="${postCreatePage }">포스트 작성</a></li>
                <c:if test="${ searchPage}">
                    <li>
                        <c:url var="postList" value="/post"></c:url>
                        <a href="${ postList}">목록 페이지</a>
                    </li>
                </c:if>
               
            </ul>
        </nav>

        <main>
            <div id="search">
                <c:url var="postSearchPage" value="/post/search"></c:url>
                <form action="${ postSearchPage}" method="get">
                    <select name = "type">
                        <option value="t">제목</option>
                        <option value="c">내용</option>
                        <option value="tc">제목 + 내용</option>
                        <option value="a">작성자</option>
                    </select>       
                    <input type="text" name="keyword" placeholder="검색어" required />
                    <input type="submit" value="검색"/>        
                </form>
            </div>
        
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
                            <td>
                                <c:url var="postDetailPage" value="/post/detail">
                                    <c:param name="id" value="${p.id }"></c:param>
                                </c:url> 
                                <a href="${postDetailPage}">${p.title }</a>
                            </td>
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