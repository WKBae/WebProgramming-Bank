<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("id");
session.removeAttribute("doing");
%>
 <jsp:forward page="admin/index.jsp" />
</body>
</html>