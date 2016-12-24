<%@ page language="java" import = "java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
정말로 회원탈퇴를 하시겠습니까?
<form method="post" action="exit_complete.jsp">
<input type="submit" value ="예">
</form>
<form method="post" action="User_main.jsp">
<input type="submit" value = "아니오">
</form>
</body>
</html>