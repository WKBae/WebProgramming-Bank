<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.io.*"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    try(FileInputStream fis = new FileInputStream("c:/bankuser/" + id + ".txt")) {
        DataInputStream dis = new DataInputStream(fis);

        String name = dis.readUTF();
        id = dis.readUTF();
        String pass = dis.readUTF();
        String accountnum = dis.readUTF();

        request.setAttribute("name", name);
        request.setAttribute("id", id);
        request.setAttribute("pass", pass);
        request.setAttribute("accountnum", accountnum);
    }
%>
 <form name="form1" method="post" action="admin_user_infor_rewrite_suc.jsp">
이름 <input type="text" name="name" maxlength="10" value="${name}">
아이디(변경불가)<input type="text" name="id" maxlength="10" value="${id}" disabled >
비밀번호<input type="password" name="pass" maxlength="10" value="${pass}">
계좌<input type="text" name="accountnum" maxlength="10" value="${accountnum}">
<button type="submit">완료</button>
</form>
</body>
</html>