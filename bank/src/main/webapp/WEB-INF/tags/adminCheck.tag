<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Admin check scriptlet" pageEncoding="utf-8" %>

<c:set var="admin" value="${sessionScope.admin}"/>
<c:if test="${admin eq null or not admin}">
    <c:redirect url="/index.jsp?not=admin"/>
</c:if>
