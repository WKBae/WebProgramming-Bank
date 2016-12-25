<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:userPage title="출금">
    <jsp:attribute name="body">
        <div class="container" role="main">
            출금 금액을 입력해주세요
            <form action="withdraw.do" method="post">
                <input type="text" name="self_output" maxlength="10">
                <input type="submit" name="ok" value="확인">
            </form>
        </div>
    </jsp:attribute>
</t:userPage>
