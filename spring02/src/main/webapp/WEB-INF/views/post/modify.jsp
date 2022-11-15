<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 2</title>
</head>
<body>
    <div>
        <h1>포스트 수정 페이지</h1>
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href="${mainPage }">메인페이지</a>
                </li>
            </ul>
        </nav>
        
        
        <main>
            <form id="postForm">
                <!-- action: 제출(submit)주소. 기본값은 현재 페이지 주소, method: 제출방식 기본값은 'get' 방식 -->
                <div>
                    <label for="id">번호</label> <input id="id"
                        type="text" name="id" value="${post.id }"
                        readonly />
                </div>
                <div>
                    <label for="title">제목</label> <input id="title"
                        type="text" name="title" value="${post.title }"
                        required autofocus />
                </div>
                <div>
                    <label for="content">내용</label>
                    <textarea id="content" rows="5" cols="40"
                        name="content" required>${post.content}</textarea>
                </div>
                <div style="display: none;">
                    <label for="author">작성자</label> <input id="author"
                        type="hidden" value="${post.author }" readonly />
                </div>

                <div>
                    <label for="createdTime"></label> <input
                        id="createdTime" type="text"
                        value="${post.created_time }" readonly />
                </div>

                <div>
                    <button id="btnDelete">삭제</button>
                    <button id="btnUpdate">수정 완료</button>
                    <!-- form 안에서 작성된 버튼들은 form의 action 주소로 method 방식의 요청을 보냄. -->
                </div>

            </form>
        </main>
    </div>

    <c:url var="postDelete" value="/post/delete"></c:url>
    <c:url var="postUpdate" value="/post/modify"></c:url>
    <script>
					// id="postForm" 인 HTML 요소를 찾음.
					const form = document.querySelector('#postForm')

					// id="btnDelete" 인 버튼을 찾음.
					const btnDelete = document.querySelector('#btnDelete')

					// 버튼 클릭 이벤트 리스터를 등록.
					btnDelete.addEventListener('click', function(event) {
						event.preventDefault()
						// 이벤트 기본 처리방식을 막음(실행되지 않도록 함).
						// -> form 양식이 서버로 제출(submit) 되지 않도록 함.

						// 사용자에게 삭제 확인
						const check = confirm('정막 삭제해?');
						console.log(check)

						if (check) { // 사용자가 '확인'을 선택했을 때
							form.action = '${postDelete}' // 제출 요청 주소
							form.method = 'post' // 제출 요청 방식
							form.submit() // 서버로 제출
							alert('삭제완료')
						}
					})

					const btnUpdate = document.querySelector('#btnUpdate')
					btnUpdate
							.addEventListener(
									'click',
									function(event) {
										event.preventDefault()
										// 이벤트 기본 처리방식을 막음(실행되지 않도록 함).
										// -> form 양식이 서버로 제출(submit) 되지 않도록 함.

										const title = document
												.querySelector('#title').value
										const content = document
												.querySelector('#content').value

										if (title == '' || content == '') {
											alert('제목과 내용을 입력해주세요')
											return;
										}

										// 사용자에게 삭제 확인
										const check = confirm('정막 수정해?');
										console.log(check)

										if (check) { // 사용자가 '확인'을 선택했을 때
											form.action = '${postUpdate}' // 제출 요청 주소
											form.method = 'post' // 제출 요청 방식
											form.submit() // 서버로 제출
											alert('수정완료')
										}
									})
				</script>
</body>
</html>