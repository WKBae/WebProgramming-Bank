<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminCheck/>

<c:set var="id" value="${param.list1}"/>
<c:set var="doing" value="${param.list2}"/>

<c:if test="${doing eq '개인정보'}">
	<c:redirect url="user_infor_rewrite.jsp?id=${id}" />
</c:if>
<c:if test="${doing eq '접속로그'}">
	<c:redirect url="user_infor_log.jsp?id=${id}" />
</c:if>
<c:if test="${doing eq '기간' or doing eq '입금' or doing eq '출금'}">
	<c:redirect url="user_infor_period.jsp?id=${id}&doing=${doing}" />
</c:if>