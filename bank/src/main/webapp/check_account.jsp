<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:userCheck/>
<t:userPage title="거래내역 확인">
    <jsp:attribute name="body">
        <form name="form1" method="post" action="deposit/deposit.jsp">
            <input type="submit" class="btn btn-default" value="입금">
        </form>
        <br>
        <form name="form2" method="post" action="withdraw/index.jsp">
            <input type="submit" class="btn btn-default" value="출금">
        </form>
        <br>
        <form name="form1" method="post" action="balance_check.jsp">
            <input type="submit" class="btn btn-default" value="잔액조회">
        </form>
    </jsp:attribute>
</t:userPage>