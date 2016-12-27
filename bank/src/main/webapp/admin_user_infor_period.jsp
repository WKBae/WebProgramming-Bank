<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<form action="admin_user_infor_period_doing.jsp" method=post>
<br>
<input type="radio" name="radio" value="1주일" checked>1주일
<br>
<input type="radio" name="radio" value="1개월">1개월
<br>
<input type="radio" name="radio" value="1년">1년
<input type="submit" value="확인">
</form>
<br>
<form action="finish_userinfor.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>