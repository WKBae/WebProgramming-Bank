<%@ page language="java" import = "java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<html>
<head>
<title>회원가입</title>
</head>
<body>
	<h1>회원정보</h1>
	<p>
	<form name="form1" method="post" action="sign_success.jsp">
	이름 : <input type="text" name="name" maxlength=10>
	<p>
	아이디 : <input type="text" name="id" maxlength=10>
	<p>
	비밀번호 : <input type="password" name="pass" maxlength=10>
	<p>
	계좌 : <input type="text" name="accountnum" maxlength=10>
	<p>
	(기타 이메일 등 개인정보는 안받겠습니다)
	<p>
	<input type="submit" value="완료">
	</form>
</body>
</html>