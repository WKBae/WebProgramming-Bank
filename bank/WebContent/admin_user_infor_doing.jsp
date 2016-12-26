<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("list1");
String doing = request.getParameter("list2");

session.setAttribute("id", id);

if(doing.equals("개인정보")){
	%>
	<jsp:forward page="admin_user_infor_rewrite.jsp" />
	<%
}
else if(doing.equals("접속로그")){
	%>
	<jsp:forward page="admin_user_infor_log.jsp" />
	<%
}
else if(doing.equals("기간") || doing.equals("입금") || doing.equals("출금")){
	session.setAttribute("doing", doing);
	%>
	<jsp:forward page="admin_user_infor_period.jsp" />
	<%
}

%>
</body>
</html>