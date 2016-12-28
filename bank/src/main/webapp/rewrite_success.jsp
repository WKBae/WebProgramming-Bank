<%@ page language="java" import="java.io.DataOutputStream,java.io.FileOutputStream" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page import="net.wkbae.assignment.wp.User" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String id = (String) session.getAttribute("id");
    String pass = request.getParameter("pass");
    String accountnum = request.getParameter("accountnum");

    User user = Users.findUser(id);
    user.setName(name);
    user.setPass(pass);
    user.setAccountnum(accountnum);

    session.removeAttribute("id");
%>
<t:userPage title="개인정보 수정 결과">
    <jsp:attribute name="body">
        회원정보를 수정하였습니다.
        <a href="index.jsp" class="btn btn-primary">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>
