<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 과제</title>
<style>
    h1{
        text-align: center;
    }
    div{
        margin: 200px;
    }
    div > table{
        margin: auto;
    }
    table{
        
        text-align : center;
        border: 1px solid gray;
    }
</style>
</head>
<body>
    <h1>글 전체 목록</h1>
    <div>
    <table>
        <caption><strong>글 전체 보기</strong></caption>
        <thead>
            <tr>
                <th>글 번호</th>
                <th>글 제목</th>
                <th>글 내용</th>
                <th>글 작성 시간</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${posts }">
                <tr>
                    <td>${p.id }</td>
                    <td>${p.title }</td>
                    <td>${p.content }</td>
                    <td>${p.createTime }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>