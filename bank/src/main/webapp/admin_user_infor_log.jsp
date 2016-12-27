<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.io.*"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String id = (String) session.getAttribute("id");

String readline = "";
String account_date="";

String account_year;
String account_month;
String account_day;
String account_hour;
String account_min;
String account_sec;

FileReader fr = new FileReader("C:/bankuser/"+id+"_log.txt");
BufferedReader br = new BufferedReader(fr);

while((readline=br.readLine())!=null){
	
	account_date=readline;
	
	account_year=account_date.substring(0,4);
	account_month=account_date.substring(4,6);
	account_day=account_date.substring(6,8);
	account_hour=account_date.substring(8,10);
	account_min=account_date.substring(10,12);
	account_sec=account_date.substring(12,14);
	
	out.println(account_year+"-"+account_month+"-"+account_day+"-"+account_hour+"-"+account_min+"-"+account_sec);
	%>
	<br>
	<%
}

br.close();
fr.close();

session.removeAttribute("id");
%>
<form action="admin_main.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>