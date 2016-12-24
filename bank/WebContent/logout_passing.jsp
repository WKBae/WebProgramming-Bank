<%@ page language="java" import = "java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("id");
%>
<jsp:forward page="index.jsp"/>
</body>
</html>