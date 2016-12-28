<%@ page language="java" import="net.wkbae.assignment.wp.Users" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Set" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:adminCheck/>
<%
    Set<String> users = Users.getUsers();
    pageContext.setAttribute("users", users);
%>
<t:userPage title="전체 계좌">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <c:set var="k" value="1"/>
            <c:forEach var="id" items="${users}">
                User: ${id}
                <c:set var="user" value="${Users.findUser(id)}"/>
                <br>
                <table>
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>날짜</th>
                        <th>입/출금</th>
                        <th>금액</th>
                        <th>잔액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="record" items="${user.records}">
                        <td>${k}</td>
                        <td><fmt:formatDate value="${record.time}" type="date" var="formatted"
                                            pattern="yyyy.MM.dd HH:mm:ss"/>${formatted}</td>
                        <td>
                            <c:choose>
                                <c:when test="${record.amount lt 0}">
                                    출금
                                </c:when>
                                <c:otherwise>
                                    입금
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${record.amount}</td>
                        <td>${record.balance}</td>
                    </c:forEach>
                    </tbody>
                </table>
                <br>
            </c:forEach>
            <br>
            <a href="index.jsp" class="btn btn-default">처음 화면으로</a>
        </div>
    </jsp:attribute>
</t:userPage>