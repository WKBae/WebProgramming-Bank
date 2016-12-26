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
@WebServlet(name = "DoDepositServlet", urlPatterns = "/deposit/deposit.do")
public class DoDepositServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String input_money = request.getParameter("self_input");
		int in_money;
		String id = (String) request.getSession().getAttribute("id");
		
		try {
			in_money = Integer.parseInt(input_money);
		} catch(NumberFormatException e) {
			response.sendRedirect("failed.jsp?type=1");
			return;
		}
		
		User user = Users.findUser(id);
		try {
			user.deposit(in_money, "입금");
		} catch(User.NotEnoughBalanceException e) {
			throw new RuntimeException(e);
		}
		
		//request.getRequestDispatcher("/WEB-INF/jsp/deposit_result.jsp").forward(request, response);
		response.sendRedirect("success.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("deposit.jsp");
	}
}
