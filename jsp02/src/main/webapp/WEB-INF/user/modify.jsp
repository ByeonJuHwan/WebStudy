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
h1 {
    text-align: center;
}

.formDiv {
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
li > a {
    color: skyblue;
    text-decoration: none;
}

a:hover {
    color: red;
}

div > input {
    margin: 3em;
}

button {
    margin: 2em;
}
</style>
</head>
<body>
    <div class="formDiv">
        <h1>회원 정보 수정</h1>
        <nav>
            <ul>
                <li><c:url var="mainPage" value="/"></c:url> <a
                    href="${mainPage }">메인페이지</a></li>
                <li><c:url var="userListPage" value="/user"></c:url>
                    <a href="${userListPage }">회원목록</a></li>
                <li><c:url var="userModifyPage"
                        value="/user/modify">
                        <c:param name="id" value="${user.id }"></c:param>
                    </c:url> <a href="${userModifyPage }">회원 정보 수정</a></li>
            </ul>
        </nav>

        <main>
            <form id="userForm">
                <div>
                    <label for="id">회원번호</label> <input id="id"
                        type="text" name="id" value="${user.id }"
                        readonly />
                </div>
                <div>
                    <label for="userName">아이디</label> <input
                        id="userName" type="text"
                        value="${user.userName }" name="userName"
                        autofocus />
                </div>
                <div>
                    <label for="password">비밀번호</label> <input
                        type="text" id="password"
                        value="${user.password }" name="password" />
                </div>
                <div>
                    <label for="email">이메일</label> <input id="email"
                        type="text" value="${user.email }" name="email" />
                </div>
                <div>
                    <label for="points">포인트</label> <input id="points"
                        type="number" value="${user.points }" readonly />
                </div>
                <div>
                    <button id="btnDelete" type="button"
                        class="btn btn-outline-danger">삭제</button>
                    <button id="btnUpdate" type="button"
                        class="btn btn-outline-success">수정 완료</button>
                    <!-- form 안에서 작성된 버튼들은 form의 action 주소로 method 방식의 요청을 보냄. -->
                </div>
            </form>
        </main>
    </div>
    <c:url var="userDelete" value="/user/delete"></c:url>
    <c:url var="userUpdate" value="/user/modify"></c:url>
    <script>
    const form =    
    const btnDelete = document.querySelector('#btnDelete')
    btnDelete.addEventListener('click', function(event){
    	event.preventDefault()
    	
    	const check = confirm('삭제합니까?')
    	if(check){
    		form.action = '${userDelete}'
    		form.method='post'
    		form.submit()
    		alert('삭제완료')
    	}
    })
    
    const btnUpdate = document.querySelector('#btnUpdate')
    btnUpdate.addEventListener('click', function(event){
    	event.preventDefault()
    	
    	const userName = document.querySelector('#userName').value
    	const password = document.querySelector('#password').value
    	const email = document.querySelector('#email').value
    	
    	if(userName == '' || password == '' || email == ''){
    		alert('아이디, 비밀번호, 이메일을 입력해주세요')
    		return
    	}
    	
    	const check = confirm('수정합니까?')
    	if(check){ // 사용자가 '확인'을 선택했을 때
            form.action = '${userUpdate}' // 제출 요청 주소
            form.method = 'post' // 제출 요청 방식
            form.submit() // 서버로 제출
            alert('수정완료')
        }
    })
    
    
    </script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>