<%@ page language="java" import="java.io.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String readline = "";

FileReader fr = new FileReader("C:/bankuser/user.txt");
BufferedReader br = new BufferedReader(fr);
%>
<form action="admin_user_log_doing.jsp" method=post>
<select name="list1">
<%
while((readline=br.readLine())!=null){
	String id=readline;
	%>
	<option value=<%=id %>><%=id%></option>
	<%
}
br.close();
fr.close();

%>	
</select>

<input type="submit" value="확인">
</form>
<br>
<form action="admin_main.jsp" method=post>
<input type="submit" value="return home">
</form>
</body>
</html>