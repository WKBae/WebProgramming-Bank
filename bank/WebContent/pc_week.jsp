<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String week = new String("week");
session.setAttribute("week",week);
%>
<script type="text/javascript">
               location.href="do_period_check.jsp";
               </script>
</body>
</html>