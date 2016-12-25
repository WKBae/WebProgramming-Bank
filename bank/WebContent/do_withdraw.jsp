<%@ page language="java" import="java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String output_money = request.getParameter("self_output");
String id = (String) session.getAttribute("id");

String readline = "";
String account_date = "";
String account_money = "";
int integer_money =0;

FileReader fr = new FileReader("C:/bankuser/"+id+"_account.txt");
BufferedReader br = new BufferedReader(fr);
	while((readline=br.readLine())!=null){
		String[] split = readline.split("\t");
		account_date=split[0] + "\t";
		account_money = split[1];
		integer_money = Integer.parseInt(account_money);
	}
	br.close();
	fr.close();
	if((integer_money - Integer.parseInt(output_money)) <0){
	%>
	<a href="user_main.jsp">잔액이 부족합니다.</a>
	
	<%
	}
	else{
		Calendar cal = Calendar.getInstance();
        String year = String.valueOf(cal.get(Calendar.YEAR));
        String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
        if(month.length()==1)
        	month="0"+month;
        String date = String.valueOf(cal.get(Calendar.DATE));
        if(date.length()==1)
        	date="0"+date;
        String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
        if(hour.length()==1)
        	hour="0"+hour;
        String min = String.valueOf(cal.get(Calendar.MINUTE));
        if(min.length()==1)
        	min="0"+min;
        String sec = String.valueOf(cal.get(Calendar.SECOND));
        if(sec.length()==1)
        	sec="0"+sec;

		try (FileWriter bw = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
    		 PrintWriter pw = new PrintWriter(bw, true)) {
	
   			 pw.write(year + month + date + hour + min + sec + "\t");
   			 pw.write((integer_money-Integer.parseInt(output_money)) + "\t" + "출금"+"\t" +(Integer.parseInt(output_money)) + "\r\n");
		}
	}
%>
출금 완료
<br>
현재 잔액 : 
<%
out.print(integer_money-Integer.parseInt(output_money) + "원");
%>
<form action = "user_main.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>