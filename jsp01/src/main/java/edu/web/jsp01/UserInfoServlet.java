package edu.web.jsp01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserInfoServlet
 */
@WebServlet(name = "userInfoServlet", urlPatterns = { "/ex3" })
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("userInfoServlet.doGet() 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		response.getWriter()
		    .append("<!doctype html>")
		    .append(" <html>")
		    .append("<body>")
		    .append("<h1>사용자 정보 전송</h1>")
		    .append("<form action='/jsp01/ex3' method='post'>")
		    .append("<input type='text' name='username'/>")
		    .append("<br/>")
		    .append("<input type='submit' value='제출'/>")
		    .append("</form>")
		    .append("</body>")
		    .append("</html>");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("userInfoServlet.doPost() 호출");
	    
	    // 요청 객체의 인코딩 타입을 설정.
	    request.setCharacterEncoding("utf-8");
        
        // 클라이언트가 요청으로 보낸 요청 파라미터 (request parameter) 값을 읽음.
	    String name = request.getParameter("username");
	    
	    // 서버에서 클라이언트로 보내는 응답 작성.
	    response.setContentType("text/html; charset=utf-8");
        response.getWriter()
            .append("<!doctype html>")
            .append(" <html>")
            .append("<body>")
            .append("<h1>")
            .append(name)
            .append("님 안녕하세요!!</h1>")
            .append("</body>")
            .append("</html>");
	}

}
