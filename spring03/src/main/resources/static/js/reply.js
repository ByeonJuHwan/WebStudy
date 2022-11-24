/**
 * reply.js
    댓글 관련 Ajax 기능 구현
    /post/detail.html 에 포함됨.
 */
 
window.addEventListener("DOMContentLoaded",()=>{
    // HTMLdml Document Object 들이 모두 로딩이 끝나 후에 코드들이 실행될 수 있도록 하기 위해서.
    
    // btnReplyRegister 버튼을 찾고 이벤트 리스너를 등록.
    const btnReplyRegister = document.querySelector('#btnReplyRegister');
    
    btnReplyRegister.addEventListener('click', registerNewReply);
    
    // 댓글 작성 함수
    function registerNewReply(){
        // 포스트 글 번호 찾음
        const postId = document.querySelector('#id').value;
        // 댓글 작성자 아이디 찾음.
        const writer = document.querySelector('#writer').value;
        // 댓글 내용 찾음
        const replyText = document.querySelector('#replyText').value;
        
        // 댓글 작성자와 내용은 비어있으면 안됨
        if(writer == '' || replyText == ''){
            alert('내용을 입력해주세요');
            return; // 메서드 종료
        }
        
        // 댓글 등록 Ajax POST 요청을 보낼 때 서버로 보내는 데이터 작성.
        const reqParams = { // key: value
            postId: postId, // 댓글이 달릴 포스트 아이디(번호)
            replyText: replyText, // 댓글 내용
            writer: writer // 댓글 작성자
        };
        
        // Axios 라이브러리를 사용해서 Ajax POST 요청을 보냄.
        axios.post('/api/reply',reqParams) // Ajax Post 요청 보냄
            .then(response => { // 성공 응답(response)이 도착했을 때 실행할 콜백
                console.log(response)
                // 댓글 데이터베이스 테이블에 등록
            })
            .catch(error=>{ // 실패 응답(error)이 도착했을 때 실행할 콜백
                console.log(error)
            });
    }
});