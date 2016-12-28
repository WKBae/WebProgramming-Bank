<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    session.setAttribute("mychoose", "기간");
%>
<t:userPage title="기간 선택">
    <jsp:attribute name="body">
        <form action="period_week.jsp" method="post">
            <input type="submit" value="1주일">
        </form>
        <br>
        <form action="period_month.jsp" method="post">
            <input type="submit" value="1개월">
        </form>
        <br>
        <form action="period_year.jsp" method="post">
            <input type="submit" value="1년">
        </form>
        <br>
        <a href="user_main.jsp" class="btn btn-default">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>
