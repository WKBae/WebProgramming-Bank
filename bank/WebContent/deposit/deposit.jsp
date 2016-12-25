<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:userPage title="입금">
    <jsp:attribute name="body">
        입금 금액을 입력해주세요
        <form action="deposit.do" method="post">
            <input type="text" name="self_input" maxlength="10">
            <input type="submit" name="ok" value="확인">
        </form>
    </jsp:attribute>
</t:userPage>
