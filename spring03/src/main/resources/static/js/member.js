/**
 * member.js
    /member/signup.html
 */

window.addEventListener('DOMContentLoaded', function() {
    // 아이디 중복 체크
    const usernameInput = document.querySelector('#username')
    const okDiv = document.querySelector('#ok');
    const nokDiv = document.querySelector('#nok');
    const btnSubmit = document.querySelector('#btnSubmit');

    usernameInput.addEventListener('change', function() {
        const username = usernameInput.value;
        axios
            .get('/member/checkid?username=' + username) // GET Ajax 요청 보냄.
            .then(response => {
                dsplayCheckResult(response.data) // 성공(HTTP 200)응답 콜백
            })
            .catch(error => { // 실패 응답(error)이 도착했을 때 실행할 콜백
                console.log(error)
            });
    function dsplayCheckResult(data){
        if(data == 'ok'){ // 사용할수 있는아이디
            okDiv.className = 'my-2'
            nokDiv.className='my-2 d-none'
            btnSubmit.classList.remove('disabled') // 버튼 활성화
        }else{
            okDiv.className = 'my-2 d-none'
            nokDiv.className='my-2'
            btnSubmit.classList.add('disabled') // 버튼 비활성화
        }
    }
    });
});