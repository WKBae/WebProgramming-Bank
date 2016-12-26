<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<c:if test="${empty param.type}">
    <c:redirect url="/user_main.jsp"/>
</c:if>

<t:userPage title="입금 결과">
    <jsp:attribute name="body">
        <h2>입금 실패</h2>
        <br>
        <c:choose>
            <c:when test="${param.type eq 1}">
                <h4>금액 입력이 비정상적입니다. 다시 시도해주세요.</h4>
            </c:when>
            <c:otherwise>
                <h4>알 수 없는 오류입니다.</h4>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>
</t:userPage>
