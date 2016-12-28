<%@ page language="java" contentType="text/html; charset=UTF-8" import="net.wkbae.assignment.wp.User"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:adminCheck/>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String accountnum = request.getParameter("accountnum");
    User u = Users.findUser(id);
    u.setName(name);
    u.setPass(pass);
    u.setAccountnum(accountnum);
%>
<t:userPage title="수정 완료">
    <jsp:attribute name="body">
        회원정보를 수정하였습니다.
        <a href="index.jsp" class="btn btn-primary">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>