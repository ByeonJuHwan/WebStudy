<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 2</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
    crossorigin="anonymous">
</head>
<body>
    <div class="my-2">
        <header class="my-2 p-4 text-bg-secondary text-center">
            <h1>글 수정 페이지</h1>
        </header>
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item"><c:url var="mainPage"
                        value="/"></c:url> <a class="nav-link"
                    href="${mainPage }">메인페이지</a></li>
                <li class="nav-item"><c:url var="createPage"
                        value="/post/create"></c:url> <a
                    class="nav-link" class="nav-link"
                    href="${createPage }">새 글 작성</a></li>
                <li class="nav-item"><c:url var="postList"
                        value="/post/list"></c:url> <a class="nav-link"
                    href="${postList }">글 목록보기</a></li>
            </ul>
        </nav>


        <main>
            <div class="card m-4">
                <div class="card-header"></div>
                <div class="card-body">
                    <form id="form">
                        <!-- action: 제출(submit)주소. 기본값은 현재 페이지 주소, method: 제출방식 기본값은 'get' 방식 -->
                        <div class="my-2">
                            <label for="id" class="form-label">번호</label>
                            <input id="id" class="form-control"
                                type="text" name="id"
                                value="${post.id }" readonly />
                        </div>
                        <div class="my-2">
                            <label for="title" class="form-label">제목</label>
                            <input class="form-control" id="title"
                                type="text" name="title"
                                value="${post.title }" required
                                autofocus />
                        </div>
                        <div class="my-2">
                            <label for="content" class="form-label">내용</label>
                            <textarea id="content" rows="5" cols="40"
                                class="form-control" name="content"
                                required>${post.content}</textarea>
                        </div>
                        <div style="display: none;" class="my-2">
                            <label for="author" class="form-label">작성자</label>
                            <input class="form-control" id="author"
                                type="hidden" value="${post.author }"
                                readonly />
                        </div>

                        <div class="my-2">
                            <label for="createdTime" class="form-label">작성시간</label>
                            <input class="form-control" id="createdTime"
                                type="text"
                                value="${post.created_time }" readonly />
                        </div>

                        <div class="my-2">
                            <button id="btnDelete"
                                class="form-control btn btn-danger my-2">삭제</button>
                            <button id="btnUpdate"
                                class="form-control btn btn-success">수정
                                완료</button>
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

    <c:url var="postDelete" value="/post/delete"></c:url>
    <c:url var="postUpdate" value="/post/modify"></c:url>
    <script>
					// HTML 문서 로딩이 모두 끝난 이후에 function을 실행.
					$(function() {
						const form = document.querySelector('#form');
						const btnDelete = $('#btnDelete'); // document.querySelector('#btnDelete')
						btnDelete.click(function(event) { // btnDelete.addEventListener('click', function(){})
							event.preventDefault(); // 버튼의 이벤트 처리 기본 동작(폼 제출)을 막음.
							const result = confirm('정말 삭제?');
							if (result) {
								form.action = '${postDelete}'
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
							
							const title = $('#title');
							const content = $('#content');
							const author = $('#author');
							const id = $('#id');
							
							if(title == '' || content == '' || author == ''){
								alert('빠진내용이있습니다.')
								return
							}
							
							const result = confirm('수정합니까?')
							if(result){
								form.action = '${postUpdate}' // 제출 요청 주소
						        form.method = 'post' // 제출 요청 방식
						        form.submit() // 서버로 제출
						        alert('수정완료')
							}
							
						})
					})
	</script>
    
</body>
</html>