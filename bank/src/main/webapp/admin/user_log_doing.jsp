<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="net.wkbae.assignment.wp.Users" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminCheck/>

<t:userPage title="개인정보 수정">
    <jsp:attribute name="body">
            <form action="user_log_doing.jsp" method="post">
                <select name="list1">
                <c:forEach var="username" items="${Users.getUsers()}">
                    <option value="${username}">${username}</option>
                </c:forEach>
                </select>

                <input type="submit" value="확인">

                <br>
                <c:set var="user" value="${Users.findUser(param.list1)}"/>
                <c:forEach var="day" items="${user.loginLog}">
                    <fmt:formatDate value="${day}" type="date" var="formatted" pattern="yyyy.MM.dd HH:mm:ss"/>
                    ${formatted} <br>
                </c:forEach>
            </form>
        <br>
    </jsp:attribute>
</t:userPage>