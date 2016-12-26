<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String choose=new String("기간");
session.setAttribute("mychoose", choose);
%>
<form action="period_week.jsp" method=post>
<input type="submit" value="1주일">
</form>
<br>
<form action="period_month.jsp" method=post>
<input type="submit" value="1개월">
</form>
<br>
<form action="period_year.jsp" method=post>
<input type="submit" value="1년">
</form>
<br>
<form action="user_main.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>