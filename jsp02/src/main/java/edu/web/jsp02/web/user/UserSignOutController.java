package edu.web.jsp02.web.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebServlet(name = "userSignOutController", urlPatterns = { "/user/signout" })
public class UserSignOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    // 로그아웃:
	    // (1) 세션에 저장된 속성(attribute)를 제거
	    HttpSession session = request.getSession();
	    session.removeAttribute("signInUser"); 
	
	    // (2) 세션 객체 무효화
	    session.invalidate();
	    
	    // (3) 로그인페이지로 이동
	    response.sendRedirect("/jsp02/user/signin");
	}

}
