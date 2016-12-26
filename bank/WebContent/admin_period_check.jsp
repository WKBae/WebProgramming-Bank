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
<form action="admin_period_check_doing.jsp" method=post>
<select name="list1">
<option selected value=null>선택</option>
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
</body>
</html>