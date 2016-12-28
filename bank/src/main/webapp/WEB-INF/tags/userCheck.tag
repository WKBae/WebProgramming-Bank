<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag import="net.wkbae.assignment.wp.Users" %>
<%@tag description="User check scriptlet" pageEncoding="utf-8" %>

<c:set var="id" value="${sessionScope.id}"/>
<c:set var="user" value="${Users.findUser(id)}"/>
<c:if test="${user eq null}">
    <c:redirect url="/index.jsp?not=user"/>
</c:if>
