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
@WebServlet(name = "DoSignServlet", urlPatterns = "/sign/sign.do")
public class DoSignServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String accountnum = request.getParameter("accountnum");
		
		if(id == null) {
			response.sendError(400, "Wrong format");
			return;
		}
		
		User user = Users.createUser(id, name, pass, accountnum);
		if(user != null) {
			try(FileWriter bw = new FileWriter("c:/bankuser/user.txt", true);
			    PrintWriter pw = new PrintWriter(bw, true)) {
				pw.write(id + "\r\n");
			}
			
			try {
				user.deposit(100000, "가입을 축하드립니다.");
			} catch(User.NotEnoughBalanceException ignored) {}
			
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("signup.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("../index.jsp");
	}
}
