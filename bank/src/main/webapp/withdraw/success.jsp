<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
    // TODO 값을 파일에서 읽어와서 remaining에 저장
    request.setAttribute("remaining", 10);
%>

<t:userPage title="출금 결과">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <h2>출금 완료</h2>
            <br>
            현재 잔액 : ${remaining}원
            <form action="../user_main.jsp" method=post>
                <input type="submit" value="return home">
            </form>
        </div>
    </jsp:attribute>
</t:userPage>
