<%@ page language="java" import="java.text.SimpleDateFormat,java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("mychoose");
session.removeAttribute("id");
%>
<jsp:forward page="admin_main.jsp" />
</body>
</html>