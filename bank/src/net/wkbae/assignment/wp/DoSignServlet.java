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
		
		File f = new File("c:/bankuser/" + id + ".txt");
		if(!f.isFile() && !id.equals("admin")) {
			try(FileOutputStream fos = new FileOutputStream(f);
			    DataOutputStream dos = new DataOutputStream(fos)) {
				dos.writeUTF(name);
				dos.writeUTF(id);
				dos.writeUTF(pass);
				dos.writeUTF(accountnum);
				dos.writeUTF("\r\n");
			}
			
			try(FileWriter bw = new FileWriter("c:/bankuser/user.txt", true);
			    PrintWriter pw = new PrintWriter(bw, true)) {
				pw.write(id + "\r\n");
			}
			
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
			
			try(FileWriter bw2 = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
			    PrintWriter pw2 = new PrintWriter(bw2, true)) {
				pw2.write(year + month + date + hour + min + sec + "\t");
				pw2.write("100000\t가입을\t축하드립니다.\r\n");
			}
			
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("signup.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("../index.jsp");
	}
}
