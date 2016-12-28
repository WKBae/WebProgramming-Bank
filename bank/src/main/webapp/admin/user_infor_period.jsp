<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:adminCheck/>

<t:userPage title="사용자 정보">
    <jsp:attribute name="body">
        <form action="user_infor_period_doing.jsp" method=post>
            <input type="hidden" name="id" value="${param.id}">
            <input type="hidden" name="doing" value="${param.doing}">
            <br>
            <input type="radio" name="radio" value="1주일" checked>1주일
            <br>
            <input type="radio" name="radio" value="1개월">1개월
            <br>
            <input type="radio" name="radio" value="1년">1년
            <input type="submit" class="btn btn-primary" value="확인">
        </form>
        <br>
        <a href="../finish_userinfor.jsp" class="btn btn-default">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>