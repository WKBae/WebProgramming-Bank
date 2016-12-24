<%@ page language="java" import = "java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
<head>
<title>Insert title here</title>
</head>
<body>
<form name="form1" method="post"  action="rewrite.jsp">
<br>
<input type="submit" value ="정보수정">
</form>

<form name="form2" method="post" action="logout_passing.jsp">
<br>
<input type="submit" value ="로그아웃">
</form>

<form name="form1" method="post" action="exit.jsp">
<br>
<input type="submit" value ="회원탈퇴">
</form>

<form name="form1" method="post" action="bank_use.jsp">
<br>
<input type="submit" value ="은행이용">
</form>
</body>
</html>