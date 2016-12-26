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
@WebServlet(name = "DoWithdrawServlet", urlPatterns = "/withdraw/withdraw.do")
public class DoWithdrawServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String output_money = request.getParameter("self_output");
		int out_money;
		String id = (String) request.getSession().getAttribute("id");
		
		try {
			out_money = Integer.parseInt(output_money);
		} catch(NumberFormatException e) {
			response.sendRedirect("failed.jsp?type=1"); // type 1, output_money가 숫자가 아님
			return;
		}
		
		User user = Users.findUser(id);
		try {
			user.withdraw(out_money, "출금");
		} catch(User.NotEnoughBalanceException e) {
			response.sendRedirect("failed.jsp?type=2"); // type 2, 잔액 부족
			return;
		}
		
		response.sendRedirect("success.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("../index.jsp");
	}
}
