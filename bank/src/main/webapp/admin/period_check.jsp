<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminCheck/>

<t:userPage title="전체 계좌">
    <jsp:attribute name="body">
        <form action="period_check_doing.jsp" method="post">
            <select name="list1">
                <c:forEach var="id" items="${Users.getUsers()}">
                    <option value="${id}">${id}</option>
                </c:forEach>
            </select>
            <br>
            <input type="radio" name="radio" value="1주일" id="rad-week" checked><label for="rad-week">1주일</label>
            <br>
            <input type="radio" name="radio" value="1개월" id="rad-month"><label for="rad-month">1개월</label>
            <br>
            <input type="radio" name="radio" value="1년" id="rad-year"><label for="rad-year">1년</label>
            <input type="submit" class="btn btn-primary" value="확인">
        </form>
        <br>
        <a href="index.jsp" class="btn btn-default">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>