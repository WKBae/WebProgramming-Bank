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
			response.sendRedirect("/withdraw/failed.jsp?type=1"); // type 1, output_money가 숫자가 아님
			return;
		}
		
		String readline = "";
		String account_date = "";
		String account_money = "";
		int integer_money = 0;
		
		try(FileReader fr = new FileReader("C:/bankuser/" + id + "_account.txt");
		    BufferedReader br = new BufferedReader(fr)) {
			while((readline = br.readLine()) != null) {
				String[] split = readline.split("\t");
				account_date = split[0] + "\t";
				account_money = split[1];
				integer_money = Integer.parseInt(account_money);
			}
		}
		
		if((integer_money - out_money) < 0) {
			response.sendRedirect("/withdraw/failed.jsp?type=2"); // type 2, 잔액 부족
		} else {
			Calendar cal = Calendar.getInstance();
			String year = String.valueOf(cal.get(Calendar.YEAR));
			String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
			if(month.length() == 1)
				month = "0" + month;
			String date = String.valueOf(cal.get(Calendar.DATE));
			if(date.length() == 1)
				date = "0" + date;
			String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
			if(hour.length() == 1)
				hour = "0" + hour;
			String min = String.valueOf(cal.get(Calendar.MINUTE));
			if(min.length() == 1)
				min = "0" + min;
			String sec = String.valueOf(cal.get(Calendar.SECOND));
			if(sec.length() == 1)
				sec = "0" + sec;
			
			try(FileWriter bw = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
			    PrintWriter pw = new PrintWriter(bw, true)) {
				
				pw.write(year + month + date + hour + min + sec + "\t");
				pw.write((integer_money - out_money) + "\t출금\t" + out_money + "\r\n");
			}
			
			//request.setAttribute("remaining", integer_money - out_money);
			//request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
			response.sendRedirect("/withdraw/success.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}
}
