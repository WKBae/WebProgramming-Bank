<%@ page language="java" import = "java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post"  action="rewrite.jsp">
<br>
<input type="submit" value ="입금">
</form>

<form name="form2" method="post" action="logout_passing.jsp">
<br>
<input type="submit" value ="출금">
</form>

<form name="form1" method="post" action="exit.jsp">
<br>
<input type="submit" value ="잔액조회">
</form>
</body>
</html>