package edu.web.jsp02.web.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.jsp02.domain.User;
import edu.web.jsp02.dto.UserJoinDto;
import edu.web.jsp02.dto.UserUpdateDto;
import edu.web.jsp02.service.UserService;
import edu.web.jsp02.service.UserServiceImpl;
import lombok.extern.slf4j.Slf4j;

/**
 * Servlet implementation class UserModifyController
 */
@Slf4j
@WebServlet(name = "userModifyController", urlPatterns = { "/user/modify" })
public class UserModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private UserService userService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyController() {
        userService = UserServiceImpl.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Integer id = Integer.valueOf(request.getParameter("id"));
        log.info("id = {}", id);
        
        User entity = userService.read(id);
        request.setAttribute("user", entity);
        request.getRequestDispatcher("/WEB-INF/user/modify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Integer id = Integer.valueOf(request.getParameter("id"));
	    String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		UserUpdateDto entity = UserUpdateDto.builder()
		        .userName(userName).password(password).email(email).id(id).build();
		
		int modify = userService.modify(entity);
		log.info("modify={}", modify);
		
		response.sendRedirect("/jsp02/user/detail?id="+id);
	}
}