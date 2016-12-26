<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String readline = "";

FileReader fr = new FileReader("C:/bankuser/user.txt");
BufferedReader br = new BufferedReader(fr);
%>
<form action="admin_user_infor_doing.jsp" method=post>
<select name="list1">
<%
while((readline=br.readLine())!=null){
	String id=readline;
	%>
	<option value=<%=id %>><%=id%></option>
	<%
}
br.close();
fr.close();

%>	
</select>

<select name="list2" size=5>
<option value="개인정보" selected>개인정보 조회 및 수정</option>
<option value="접속로그">접속 로그 조회</option>
<option value="기간">기간별 거래내역 조회</option>
<option value="입금">입금 내역 조회</option>
<option value="출금">출금 내역 조뢰</option>
</select>

<input type="submit" value="확인">
</form>
<br>
<form action="admin_main.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>