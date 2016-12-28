<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    if(session.getAttribute("id") != null) {
        response.sendRedirect("user_main.jsp");
    }
%>

<t:userPage title="로그인">
    <jsp:attribute name="body">
        <h1>계좌 관리시스템</h1>
        <form name="form1" method="post" action="login.do">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="아이디">
            </div>
            <div class="form-group">
                <label for="pass">비밀번호</label>
                <input type="password" class="form-control" id="pass" name="pass" maxlength="10" placeholder="비밀번호">
            </div>
            <button type="submit" class="btn btn-primary">로그인</button>
            <a class="btn btn-link" href="sign/signup.jsp">회원가입</a>
        </form>
    </jsp:attribute>
</t:userPage>
