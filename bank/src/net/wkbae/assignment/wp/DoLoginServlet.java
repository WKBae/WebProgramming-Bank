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
		
		File file = new File("c:/bankuser/" + reqid + ".txt");
		
		if(file.isFile()) {
			try(FileInputStream fis = new FileInputStream(file);
			    DataInputStream dis = new DataInputStream(fis)) {
				
				String name = dis.readUTF();
				String id = dis.readUTF();
				String pass = dis.readUTF();
				
				
				if(id.equals(reqid) && pass.equals(reqpass)) {
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
					try(FileWriter bw = new FileWriter("c:/bankuser/" + id + "_log.txt", true);
					    PrintWriter pw = new PrintWriter(bw, true)) {
						pw.write(year + month + date + hour + min + sec + "\r\n");
					}
					
					request.getSession().setAttribute("id", id);
					
					response.sendRedirect("user_main.jsp");
					return;
				}
			}
		}
		//request.getRequestDispatcher("/login_failed.jsp").forward(request, response);
		response.sendRedirect("login_failed.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}
}
