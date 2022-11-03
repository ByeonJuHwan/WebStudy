<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
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
    <h1>글 입력창</h1>
    <form method="post">
      <input type="text" name="id" placeholder="글 번호" autofocus /> <br />
      <input type="text" name="title" placeholder="글 제목" /><br />
      <textarea rows="10" cols="30" name="content" placeholder="글 내용"></textarea><br />
      <input type="datetime-local" name="createTime" /><br />
      <input type="submit" value="등록" />
      <input type="reset" value="초기화" /><br>
      <img alt="고양이" src="../images/고양이.png"/>
    </form>
  </body>
</html>
