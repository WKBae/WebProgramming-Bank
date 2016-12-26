<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String readline="";
int k=1;

FileReader fr = new FileReader("C:/bankuser/user.txt");
BufferedReader br = new BufferedReader(fr);

while((readline=br.readLine())!=null){
	String id=readline;
	%>
	user : <%=id %>
	<br>
	<%
	FileReader fr1 = new FileReader("C:/bankuser/"+id+"_account.txt");
	BufferedReader br1 = new BufferedReader(fr1);
	%>
	<table border=1 cellspacing=10 cellpadding=10 width=500>
<tr><th>No.</th><th>날짜</th><th>입/출금</th><th>입/출금액</th><th>잔액</th></tr>
	<%
	while((readline=br1.readLine())!=null){
		String[] split = readline.split("\t");
		String account_date=split[0];
		String account_money = split[1];
		String de_wi=split[2];
		String de_wi_money=split[3];
		if((!de_wi.equals("입금")) && (!de_wi.equals("출금"))){
			%>
			<tr><td><%=k %></td><td><%=account_date %></td><td>입금</td><td>100000</td><td>100000</td></tr>
			<%
		}
		else{
		%>
	
			<tr><td><%=k %></td><td><%=account_date %></td><td><%=de_wi %></td><td><%=de_wi_money %></td><td><%=account_money %></td></tr>
		<%	
		}
		k++;
		
	}
	%>
	</table>
	<%
	br1.close();
	fr1.close();
}
br.close();
fr.close();
%>
<br>
<form action="admin_main.jsp" method="post">
<input type="submit" value="return home">
</form>
</body>
</html>