<%@ page language="java" import = "java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String accountnum = request.getParameter("accountnum");
		
		FileOutputStream fos = new FileOutputStream("c:/bankuser/"+id+".txt");
		DataOutputStream dos = new DataOutputStream( fos );
		
		
		dos.writeUTF(name);
		dos.writeUTF(id);
		dos.writeUTF(pass);
		dos.writeUTF(accountnum);
		fos.write('\n');
		
		session.removeAttribute("id");
		
		dos.close();
		fos.close();
	%>
회원정보를 수정하였습니다.
<form name="form1" method="post" action="index.jsp">
<input type="submit" value="return home">
</form>
</body>
</html>