<%@ page language="java" import = "java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>메인화면</title>
</head>
<body>
	<h1>계좌 관리시스템</h1>
	<form name="form1" method="post" action="Loginpassing.jsp">
	<p>
	아이디 : <input type="text" name="id" maxlength=10>
	<p>
	비밀번호 : <input type="password" name="pass" maxlength=10>
	<p>
	<input type="submit" value="로그인">
	</form>
	<a href="sign.jsp">회원가입</a>
</body>
</html>
