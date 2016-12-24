<%@ page language="java" import = "java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
String delid = (String)session.getAttribute("id");
File f=new File("c:/bankuser/"+delid+".txt");
File f_log=new File("c:/bankuser/"+delid+"_log.txt");
File user= new File("c:/bankuser/user.txt");
f.delete();
f_log.delete();
session.removeAttribute("id");
%>
<jsp:forward page="index.jsp"/>
</body>
</html>