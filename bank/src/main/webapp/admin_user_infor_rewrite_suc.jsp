<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.io.*"
         pageEncoding="UTF-8" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String id = (String) session.getAttribute("id");
    String pass = request.getParameter("pass");
    String accountnum = request.getParameter("accountnum");

    try (FileOutputStream fos = new FileOutputStream("c:/bankuser/" + id + ".txt");
         DataOutputStream dos = new DataOutputStream(fos)) {

        dos.writeUTF(name);
        dos.writeUTF(id);
        dos.writeUTF(pass);
        dos.writeUTF(accountnum);
        fos.write('\n');
        session.removeAttribute("id");
    }
    session.removeAttribute("id");
%>
   회원정보를 수정하였습니다.
            <form name="form1" method="post" action="admin_main.jsp">
                <input type="submit" value="return home">
            </form>
</body>
</html>