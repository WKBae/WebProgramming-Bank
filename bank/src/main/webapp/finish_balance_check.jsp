<%@ page language="java" import="java.text.SimpleDateFormat,java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("mychoose");
%>
<jsp:forward page="user_main.jsp" />
</body>
</html>