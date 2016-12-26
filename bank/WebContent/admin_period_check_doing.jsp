<%@ page language="java" import="java.io.*, java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String readline = "";

FileReader ffr = new FileReader("C:/bankuser/user.txt");
BufferedReader fbr = new BufferedReader(ffr);
%>
<form action="admin_period_check_doing.jsp" method=post>
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
<br>
<input type="radio" name="radio" value="1주일">1주일
<br>
<input type="radio" name="radio" value="1개월">1개월
<br>
<input type="radio" name="radio" value="1년">1년
<input type="submit" value="확인">
</form>
<br>
<form action="admin_main.jsp" method=post>
<input type="submit" value="return home">
</form>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)request.getParameter("list1");
	String period=(String)request.getParameter("radio");
	
	Calendar cal1 = Calendar.getInstance();
	Calendar cal2 = Calendar.getInstance();
	
	readline = "";
	String account_date="";
	String de_wi ="";
	String de_wi_money="";
	String account_money="";
	
	int account_year;
	int account_month;
	int account_day;

	int k=1;
	if(id!=null && period!=null){
	FileReader fr = new FileReader("C:/bankuser/"+id+"_account.txt");
	BufferedReader br = new BufferedReader(fr);
%>	


<table border=1 cellspacing=10 cellpadding=10 width=500>
<tr><th>No.</th><th>날짜</th><th>입/출금</th><th>입/출금액</th><th>잔액</th></tr>
<%
	while((readline=br.readLine())!=null){
		String[] split = readline.split("\t");
		account_date=split[0];
		account_money = split[1];
		de_wi=split[2];
		de_wi_money=split[3];
		
		account_year=Integer.parseInt(account_date.substring(0,4));
		account_month=Integer.parseInt(account_date.substring(4,6))-1;
		account_day=Integer.parseInt(account_date.substring(6,8));
		
		cal2.set(account_year, account_month, account_day);
		
		Calendar temp= Calendar.getInstance();
		temp.setTime(cal2.getTime());
		int day=0;
		while(!temp.after(cal1)){
			day++;
			temp.add(Calendar.DATE,1);
		}
		if(day<=7 && period.equals("1주일")){
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
		}
		else if(day<=31 && period.equals("1개월")){
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
		}
		else if(day<=365 && period.equals("1년")){
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
		}
		k++;
	}
br.close();
fr.close();
	}
	else{%>
		<jsp:forward page="admin_period_check.jsp" />
		<%}
%>
</table>





</body>
</html>