<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    <h1>연락처 등록 결과 페이지</h1>
    이름 :  <input type="text" value="${ contact.name }" readonly> <br>
    전화번호 : <input type="text" value="${ contact.phone }"readonly> <br>
    이메일 : <input type="text" value="${ contact.email }"readonly> <br>
</body>
</html>