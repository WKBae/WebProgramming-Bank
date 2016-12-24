	<html>
	<head>
	</head>
	<body>

<%@ page language="java" import = "java.util.Date,java.sql.*,java.net.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String reqid = request.getParameter("id");
	String reqpass = request.getParameter("pass");
	
	File file = new File("c:/bankuser/"+reqid+".txt");
	
	if(file.isFile()){
	FileInputStream fis = new FileInputStream(file);
	DataInputStream dis = new DataInputStream( fis );
	
	String name=dis.readUTF();
	String id = dis.readUTF();
	String pass = dis.readUTF();
	dis.close();
	fis.close();
	if(id.equals(reqid) && pass.equals(reqpass)){
		Date now = new Date();
		String year = String.valueOf(now.getYear());
		String month = String.valueOf(now.getMonth()+1);
		String date =  String.valueOf(now.getDate());
		String hour = String.valueOf (now.getHours());
		String min =  String.valueOf(now.getMinutes());
		String sec =  String.valueOf(now.getSeconds());
		FileWriter bw = new FileWriter("c:/bankuser/"+id+"_log.txt",true);
		PrintWriter pw = new PrintWriter(bw,true);
		
		pw.write(year+month+date+hour+min+sec+"\r\n");
		
		pw.close();
		bw.close();
		
		session.setAttribute("id",id);
		%>
		<jsp:forward page="User_main.jsp"/>
		
		<%
	}
	else{
		%>
		<a href="index.jsp">로그인 실패</a>
		<%
	}
	}
	else
	{
		%>
		<a href="index.jsp">로그인 실패</a>
		
		<%
		
	}
	%>
	</body>
	</html>