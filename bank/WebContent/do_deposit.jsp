<%@ page language="java" import="java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String input_money = request.getParameter("self_input");
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

Calendar cal = Calendar.getInstance();
String year = String.valueOf(cal.get(Calendar.YEAR));
String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
String date = String.valueOf(cal.get(Calendar.DATE));
String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
String min = String.valueOf(cal.get(Calendar.MINUTE));
String sec = String.valueOf(cal.get(Calendar.SECOND));

try (FileWriter bw = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
     PrintWriter pw = new PrintWriter(bw, true)) {
	
    pw.write(year + month + date + hour + min + sec + "\t");
    pw.write((Integer.parseInt(input_money)+integer_money) + "\t" + "입금:" +(Integer.parseInt(input_money)) + "\r\n");
}
%>
입금 완료
<br>
현재 잔액 : 
<%
out.print(Integer.parseInt(input_money)+integer_money + "원");
%>
<form action = "user_main.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>