<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminCheck/>
<t:userPage title="사용자 정보">
    <jsp:attribute name="body">
        <form action="user_infor_doing.jsp" method=post>
            <select name="list1">
                <c:forEach var="id" items="${Users.getUsers()}">
                    <option value="${id}">${id}</option>
                </c:forEach>
            </select>

            <select name="list2" size=5>
                <option value="개인정보" selected>개인정보 조회 및 수정</option>
                <option value="접속로그">접속 로그 조회</option>
                <option value="기간">기간별 거래내역 조회</option>
                <option value="입금">입금 내역 조회</option>
                <option value="출금">출금 내역 조회</option>
            </select>

            <input type="submit" class="btn btn-primary" value="확인">
        </form>
        <br>
        <a href="index.jsp" class="btn btn-default">처음 화면으로</a>
    </jsp:attribute>
</t:userPage>