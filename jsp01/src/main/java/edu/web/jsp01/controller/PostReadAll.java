package edu.web.jsp01.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.jsp01.domain.Post;

/**
 * Servlet implementation class PostReadAll
 */
@WebServlet("/post/read")
public class PostReadAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		LocalDateTime local = LocalDateTime.now();
		ArrayList<Post>list = new ArrayList<>();
		for(int i=1; i<11; i++) {
		    Post post = new Post(i, "글제목"+ i, "글내용" + i,local );
		    list.add(post);
		}
		request.setAttribute("posts", list);
		request.getRequestDispatcher("/WEB-INF/post/showAllPost.jsp").forward(request, response);
	}
}
