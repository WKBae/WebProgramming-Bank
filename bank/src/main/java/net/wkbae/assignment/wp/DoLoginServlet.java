package net.wkbae.assignment.wp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Calendar;

/**
 * Created by William on 2016-12-25.
 */
@WebServlet(name = "DoLoginServlet", urlPatterns = "/login.do")
public class DoLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String reqid = request.getParameter("id");
		String reqpass = request.getParameter("pass");		
		
		if(reqid.equals("admin") && reqpass.equals("admin")){
		response.sendRedirect("admin_main.jsp");
		}
		else{
			User user = Users.findUser(reqid);
			if(user != null) {
				if(user.getId().equals(reqid) && user.getPass().equals(reqpass)) {
					user.logSignIn();
					request.getSession().setAttribute("id", reqid);
					response.sendRedirect("user_main.jsp");
				}
			}
		//request.getRequestDispatcher("/login_failed.jsp").forward(request, response);
		response.sendRedirect("login_failed.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}
}
