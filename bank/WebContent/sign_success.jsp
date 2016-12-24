<html>
<head>
<title></title>
</head>
<body>

<%@ page language="java" import = "java.util.Date,java.io.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String accountnum = request.getParameter("accountnum");
		
		File f = new File("c:/bankuser/"+id+".txt");
		if(!f.isFile()){
		FileOutputStream fos = new FileOutputStream(f);
		DataOutputStream dos = new DataOutputStream( fos );
		
		FileWriter bw = new FileWriter("c:/bankuser/user.txt",true);
		PrintWriter pw = new PrintWriter(bw,true);
		
		Date now = new Date();
		String year = String.valueOf(now.getYear());
		String month = String.valueOf(now.getMonth()+1);
		String date =  String.valueOf(now.getDate());
		String hour = String.valueOf (now.getHours());
		String min =  String.valueOf(now.getMinutes());
		String sec =  String.valueOf(now.getSeconds());
		
		FileWriter bw2 = new FileWriter("c:/bankuser/"+id+"_account.txt",true);
		PrintWriter pw2 = new PrintWriter(bw,true);
		
		
		pw2.write(year+month+date+hour+min+sec+"     ");
		pw2.write("100000"+"\r\n");
		pw2.close();
		bw2.close();
		
		pw.write(id + "\r\n");
		bw.close();
		pw.close();
		
		
		dos.writeUTF(name);
		dos.writeUTF(id);
		dos.writeUTF(pass);
		dos.writeUTF(accountnum);
		dos.writeUTF("\r\n");
		dos.close();
		fos.close();
		}
		else{
			%>
			<jsp:forward page="sign.jsp"/>
			<%
		}
	%>

회원가입에 성공하셨습니다.
<form name="form1" method="post" action="index.jsp">
<input type="submit" value="return home">
</form>
</body>
</html>