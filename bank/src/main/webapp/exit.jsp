<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:userCheck/>

<t:userPage title="회원 탈퇴">
    <jsp:attribute name="body">
        정말로 회원탈퇴를 하시겠습니까?
        <form method="get" action="exit_complete.jsp">
            <input type="submit" class="btn btn-primary" value="예">
        </form>
        <a href="user_main.jsp" class="btn btn-default">아니오</a>
    </jsp:attribute>
</t:userPage>