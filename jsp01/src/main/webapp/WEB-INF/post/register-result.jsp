<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post</title>
 <style>
      h1 {
      margin: 100px;
        text-align: center;
      }
      form {
        text-align: center;
      }
      form > input {
        margin: 20px;
        padding: 8px;
      }
    </style>
</head>
<body>
    <h1>글 결과 입력창</h1>
    <form method="post">
    <input type="text" value="${post.id }" readonly/> <br>
    <input type="text" value="${post.title }" readonly/><br>
    <textarea rows="10" cols="30" readonly>${ post.content }</textarea><br>
    <input type="datetime-local" value="${post.createTime }" readonly><br>
    <img alt="고양이" src="../images/고양이.png"/>
    </form>
</body>
</html>