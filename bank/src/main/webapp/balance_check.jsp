<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String id = (String) request.getSession().getAttribute("id");

FileReader fr = new FileReader("C:/bankuser/"+id+"_account.txt");
BufferedReader br = new BufferedReader(fr);

String readline = "";
String account_date = "";
String account_money = "";
int integer_money = 0;

while((readline = br.readLine()) != null) {
	String[] split = readline.split("\t");
	account_date = split[0];
	account_money = split[1];
	integer_money = Integer.parseInt(account_money);
}

br.close();
fr.close();
%>
현재잔액 : <%=integer_money %>

 <br><br>
                <form method="post" action="period_check.jsp">
                    <input type="submit" value="기간별 거래 조회">
                </form>
                <br>
                <form method="post" action="deposit_check.jsp">
                    <input type="submit" value="입금 내역 조회">
                </form>
                <br>
                <form method="post" action="withdraw_check.jsp">
                    <input type="submit" value="출금 내역 조회">
                </form>
</body>
</html>