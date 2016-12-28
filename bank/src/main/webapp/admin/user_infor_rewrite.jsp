<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.io.*"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page import="net.wkbae.assignment.wp.User" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:adminCheck/>
<%
    String id = (String) request.getAttribute("id");
    User u = Users.findUser(id);
    pageContext.setAttribute("name", u.getName());
    pageContext.setAttribute("id", u.getId());
    pageContext.setAttribute("pass", u.getPass());
    pageContext.setAttribute("accountnum", u.getAccountnum());
%>
<t:userPage title="사용자 정보 수정">
    <jsp:attribute name="body">
        <form name="form1" method="post" action="user_infor_rewrite_suc.jsp">
            <input type="hidden" name="id" value="${id}">
            이름 <input type="text" name="name" maxlength="10" value="${name}">
            아이디(변경불가)<input type="text" name="id" maxlength="10" value="${id}" disabled >
            비밀번호<input type="password" name="pass" maxlength="10" value="${pass}">
            계좌<input type="text" name="accountnum" maxlength="10" value="${accountnum}">
            <button type="submit">완료</button>
        </form>
    </jsp:attribute>
</t:userPage>