<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:userCheck/>

<c:set var="id" value="${sessionScope.id}"/>
<c:set var="user" value="${Users.findUser(id)}"/>

<t:userPage title="관리자">
    <jsp:attribute name="body">
        현재잔액 : ${user.balance}

        <br><br>
        <form method="post" action="period_check.jsp">
            <input type="submit" value="기간별 거래 조회">
        </form>
        <br>
        <form method="post" action="deposit_check.jsp">
            <input type="submit" value="입금 내역 조회">
        </form>
        <br>
        <form method="post" action="withdraw_check.jsp">
            <input type="submit" value="출금 내역 조회">
        </form>
    </jsp:attribute>
</t:userPage>
