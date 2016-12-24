<%@ page language="java" import = "java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>

</head>
<body>
<%
String id = (String)session.getAttribute("id");
FileInputStream fis = new FileInputStream("c:/bankuser/"+ id + ".txt");
DataInputStream dis = new DataInputStream( fis );

String name = dis.readUTF();
id = dis.readUTF();
String pass = dis.readUTF();
String accountnum = dis.readUTF();

dis.close();
fis.close();
%>
<form name="form1" method="post" action="rewrite_success.jsp">
	이름 : <input type="text" name="name" value="<%=name %>" maxlength=10>
	<p>
	아이디 : <input type="text" value="<%=id%>" maxlength=10 name="id" readonly>(변경불가)
	<p>
	비밀번호 : <input type="password" value="<%=pass%>" maxlength=10 name="pass">
	<p>
	계좌 : <input type="text" value="<%=accountnum%>" maxlength=10 name="accountnum">
	<p>
	<input type="submit" value="완료">
	</form>
</body>
</html>