<%@ page language="java" import="java.io.BufferedReader" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.FileReader" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminCheck/>
<%

%>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
    <form action="user_log_doing.jsp" method="post">
        <select name="list1">
            <c:forEach var="id" items="${Users.getUsers()}">
                <option value="${id}">${id}</option>
            </c:forEach>
        </select>

        <input type="submit" value="확인">
    </form>
    <br>
    <a href="index.jsp" class="btn btn-default">처음 화면으로</a>
</body>
</html>