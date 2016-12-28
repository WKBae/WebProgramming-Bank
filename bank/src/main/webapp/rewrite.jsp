<%@ page language="java" import="net.wkbae.assignment.wp.User" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:userCheck/>
<%
    String id = (String) session.getAttribute("id");
    User u = Users.findUser(id);
    pageContext.setAttribute("name", u.getName());
    pageContext.setAttribute("id", u.getId());
    pageContext.setAttribute("pass", u.getPass());
    pageContext.setAttribute("accountnum", u.getAccountnum());
%>

<t:userPage title="개인정보 수정">
    <jsp:attribute name="body">
            <form name="form1" method="post" action="rewrite_success.jsp">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" name="name" maxlength="10" placeholder="이름" value="${name}">
                </div>
                <div class="form-group">
                    <label for="id">아이디 (변경 불가)</label>
                    <input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="아이디" value="${id}" disabled>
                </div>
                <div class="form-group">
                    <label for="pass">비밀번호</label>
                    <input type="password" class="form-control" id="pass" name="pass" maxlength="10" placeholder="비밀번호" value="${pass}">
                </div>
                <div class="form-group">
                    <label for="accountnum">계좌</label>
                    <input type="text" class="form-control" id="accountnum" name="accountnum" maxlength="10" placeholder="계좌" value="${accountnum}">
                </div>
                <button type="submit" class="btn btn-primary">완료</button>
            </form>
    </jsp:attribute>
</t:userPage>
