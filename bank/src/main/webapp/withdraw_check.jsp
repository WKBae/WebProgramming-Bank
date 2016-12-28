<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:userCheck/>

<%
    session.setAttribute("mychoose", "입금");
%>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
    <form action="period_week.jsp" method=post>
        <input type="submit" value="1주일">
    </form>
    <br>
    <form action="period_month.jsp" method=post>
        <input type="submit" value="1개월">
    </form>
    <br>
    <form action="period_year.jsp" method=post>
        <input type="submit" value="1년">
    </form>
    <br>
    <a href="user_main.jsp" class="btn btn-default">처음 화면으로</a>
</body>
</html>