<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
</head>
<body>
    <div class="my-2">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>회원 정보 수정</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
                <li class="nav-item"><c:url var="userInsert"
                        value="/user/create"></c:url> <a
                    class="nav-link" class="nav-link"
                    href="${userInsert }">회원가입</a></li>
                <li class="nav-item"><c:url var="userList"
                        value="/user/list"></c:url> <a class="nav-link"
                    href="${userList }">회원 목록 보기</a></li>
            </ul>
        </nav>


        <main>
            <div class="card m-4">
                <div class="card-header"></div>
                <div class="card-body">
                    <form id="form">
                        <!-- action: 제출(submit)주소. 기본값은 현재 페이지 주소, method: 제출방식 기본값은 'get' 방식 -->
                        <div class="my-2">
                            <label for="id" class="form-label">회원번호</label>
                            <input id="id" class="form-control"
                                type="text" name="id"
                                value="${user.id }" readonly />
                        </div>
                        <div class="my-2">
                            <label for="userName" class="form-label">아이디</label>
                            <input class="form-control" id="userName"
                                type="text" name="userName"
                                value="${user.userName  }" required
                                autofocus />
                        </div>
                        <div class="my-2">
                            <label for="password" class="form-label">비밀번호</label>
                            <input class="form-control" id="password"
                                type="password" name="password"
                                value="${user.password  }" required
                                autofocus />
                        </div>
                        <div class="my-2">
                            <label for="email" class="form-label">이메일</label>
                            <input class="form-control" id="email" name="email"
                                type="email" value="${user.email }"
                                 />
                        </div>

                        <div class="my-2">
                            <label for="points" class="form-label">포인트</label>
                            <input class="form-control" id="points"
                                type="number" value="${user.points }"
                                readonly />
                        </div>

                        <div class="my-2">
                            <button id="btnDelete"
                                class="form-control btn btn-danger my-2">삭제</button>
                            <button id="btnUpdate"
                                class="form-control btn btn-success">회원정보수정
                            </button>
                            <!-- form 안에서 작성된 버튼들은 form의 action 주소로 method 방식의 요청을 보냄. -->
                        </div>

                    </form>
                </div>
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

    <c:url var="userDelete" value="/user/delete"></c:url>
    <c:url var="userUpdate" value="/user/modify"></c:url>
    <script>
                    // HTML 문서 로딩이 모두 끝난 이후에 function을 실행.
                    $(function() {
                        const form = document.querySelector('#form');
                        const btnDelete = $('#btnDelete'); // document.querySelector('#btnDelete')
                        btnDelete.click(function(event) { // btnDelete.addEventListener('click', function(){})
                            event.preventDefault(); // 버튼의 이벤트 처리 기본 동작(폼 제출)을 막음.
                            const result = confirm('정말 삭제?');
                            if (result) {
                                form.action = '${userDelete}'
                                form.method = 'post'
                                form.submit()
                            }

                        });
                    });
                    
                    $(function(){
                        const form = document.querySelector('#form');
                        const btnUpdate = $('#btnUpdate');
                        btnUpdate.click(function(event){
                            event.preventDefault();
                            
                            const userName = $('#userName');
                            const password = $('#password');
                            const email = $('#email');
                            const id = $('#id');
                            
                            if(userName == '' || password == '' || email == ''){
                                alert('아이디, 비밀번호, 이메일을 입력해주세요')
                                return
                            }
                            
                            const result = confirm('수정합니까?')
                            if(result){
                                form.action = '${userUpdate}' // 제출 요청 주소
                                form.method = 'post' // 제출 요청 방식
                                form.submit() // 서버로 제출
                                alert('수정완료')
                            }
                            
                        })
                    })
    </script>

</body>
</html>