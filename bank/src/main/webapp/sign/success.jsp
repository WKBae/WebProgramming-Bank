<%@ page language="java" import="java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:userPage title="회원가입 결과">
    <jsp:attribute name="body">
        회원가입에 성공하셨습니다.
        <a href="../index.jsp" class="btn btn-primary">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>
