<%@ page language="java" import="java.text.SimpleDateFormat,java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="pc_week.jsp" method=post>
<input type="submit" value="1주일">
</form>
<br><br>
<form action="pc_month.jsp" method=post>
<input type="submit" value="1개월">
</form>
<br><br>
<form action="pc_year.jsp" method=post>
<input type="submit" value="1년">
</form>
<form action="user_main.jsp" method=post>
<input type="submit" value="return home">
</form>

<%
	String id = (String) session.getAttribute("id");

	Calendar cal1 = Calendar.getInstance();
	Calendar cal2 = Calendar.getInstance();
	
	String readline = "";
	String account_date="";
	String de_wi ="";
	String de_wi_money="";
	String account_money="";
	
	int account_year;
	int account_month;
	int account_day;
	
	
	FileReader fr = new FileReader("C:/bankuser/"+id+"_account.txt");
	BufferedReader br = new BufferedReader(fr);
%>	


<table cellspacing=5 cellpadding=5 width=200>
<tr><th>No.</th><th>날짜</th><th>입/출금</th><th>입/출금액</th><th>잔액</th></tr>
<%
	while((readline=br.readLine())!=null){
		String[] split = readline.split("\t");
		account_date=split[0];
		account_money = split[1];
		de_wi=split[2];
		de_wi_money=split[3];
		
		account_year=Integer.parseInt(account_date.substring(0,3));
		account_month=Integer.parseInt(account_date.substring(4,5))-1;
		account_day=Integer.parseInt(account_date.substring(6,7));
		
		cal2.set(account_year, account_month, account_day);
		
		Calendar temp= Calendar.getInstance();
		temp.setTime(cal2.getTime());
		int day=0;
		while(!temp.after(cal1)){
			day++;
			temp.add(Calendar.DATE,1);
		}
	}
	
%>
</table>





</body>
</html>