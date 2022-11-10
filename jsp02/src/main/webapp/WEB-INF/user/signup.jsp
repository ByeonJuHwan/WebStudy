<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <div>
        <header>
            <h1>회원 가입 페이지</h1>
        </header>

        <div>
            <form method="post">
                <div>
                    <input type="text" name="userName" placeholder="아이디"
                        required autofocus />
                </div>
                <div>
                    <input type="password" name="password"
                        placeholder="비밀번호" required />
                </div>
                <div>
                    <input type="email" name="email" placeholder="이메일"
                        required />
                </div>
                <div>
                    <input type="submit" value="회원가입"/> 
                    <input type="reset" value="초기화"/> 
                </div>

            </form>
        </div>
    </div>
</body>
</html>