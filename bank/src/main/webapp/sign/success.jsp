<%@ page language="java" import="java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:basicPage title="회원가입 결과">
    <jsp:attribute name="body">
        <div class="container" role="main">
            회원가입에 성공하셨습니다.
            <form name="form1" method="post" action="../index.jsp">
                <input type="submit" class="btn btn-default" value="return home">
            </form>
        </div>
    </jsp:attribute>
</t:basicPage>
