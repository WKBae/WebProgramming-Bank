<%@ page import="net.wkbae.assignment.wp.User" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
    String id = (String) session.getAttribute("id");
    User u = Users.findUser(id);
    if(u == null) {
        response.sendRedirect("../index.jsp");
        return;
    }
    pageContext.setAttribute("remaining", u.getBalance());
%>

<t:userPage title="출금 결과">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <h2>출금 완료</h2>
            <br>
            현재 잔액 : ${remaining}원
            <a href="../user_main.jsp" class="btn btn-default">처음 화면으로</a>
        </div>
    </jsp:attribute>
</t:userPage>
