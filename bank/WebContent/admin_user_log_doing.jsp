<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String logid = request.getParameter("list1");

String readline = "";

FileReader ffr = new FileReader("C:/bankuser/user.txt");
BufferedReader fbr = new BufferedReader(ffr);
%>
<form action="admin_user_log_doing.jsp" method=post>
<select name="list1">
<%
while((readline=fbr.readLine())!=null){
	String id=readline;
	%>
	<option value=<%=id %>><%=id%></option>
	<%
}
fbr.close();
ffr.close();

%>	
</select>

<input type="submit" value="확인">

<br>

<%
String account_date="";

String account_year;
String account_month;
String account_day;
String account_hour;
String account_min;
String account_sec;

FileReader fr = new FileReader("C:/bankuser/"+logid+"_log.txt");
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

%>
</form>
<br>

</body>
</html>