<%@ page language="java" contentType="text/html; charset=UTF-8" import="net.wkbae.assignment.wp.User"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<t:adminCheck/>
<c:set var="id" value="${param.id}"/>
<c:set var="user" value="${Users.findUser(id)}"/>

<t:userPage title="개인정보 수정">
    <jsp:attribute name="body">
        <c:forEach var="date" items="user.loginLog">
            <fmt:formatDate value="${record.time}" type="date" var="formatted" pattern="yyyy.MM.dd HH:mm:ss"/>
            ${formatted} <br>
        </c:forEach>
		<a href="index.jsp" class="btn btn-default">처음 화면으로</a>
	</jsp:attribute>
</t:userPage>