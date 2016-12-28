<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:userPage title="메인 메뉴">
    <jsp:attribute name="body">
        <form name="form1" method="get" action="rewrite.jsp">
            <input type="submit" class="btn btn-default" value="정보수정">
        </form>
        <br>
        <form name="form1" method="get" action="bank_use.jsp">
            <input type="submit" class="btn btn-default" value="은행이용">
        </form>
        <br>
        <form name="form2" method="get" action="logout.do">
            <input type="submit" class="btn btn-default" value="로그아웃">
        </form>
        <br>
        <form name="form1" method="get" action="exit.jsp">
            <input type="submit" class="btn btn-default" value="회원탈퇴">
        </form>
    </jsp:attribute>
</t:userPage>
