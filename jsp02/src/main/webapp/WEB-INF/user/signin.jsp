<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <div>
        <div>
            <h1>로그인</h1>
        </div>
        <div>
            <form method="post">
                <div>
                    <label id="userName">아이디</label>
                    <input type="text" id="userName" name="userName" placeholder="아이디" required autofocus />
                </div>
                
                <div>
                     <label id="password">비밀번호  </label>
                    <input type="password" id="password" name="password" placeholder="비밀번호" required  />
                </div>
                <div>
                    <input type="submit" value="로그인"/>
                    <input type="reset" value="초기화"/>
                </div>
            </form>
        </div> 
    </div>
</body>
</html>