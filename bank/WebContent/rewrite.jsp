<%@ page language="java" import="java.io.DataInputStream,java.io.FileInputStream" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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

            dis.close();
            fis.close();
    %>
    <form name="form1" method="post" action="rewrite_success.jsp">
        <p>이름 : <input type="text" name="name" value="<%=name %>" maxlength="10"></p>
        <p>아이디 : <input type="text" value="<%=id%>" maxlength="10" name="id" readonly>(변경불가)</p>
        <p>비밀번호 : <input type="password" value="<%=pass%>" maxlength="10" name="pass"></p>
        <p>계좌 : <input type="text" value="<%=accountnum%>" maxlength="10" name="accountnum"></p>
        <p><input type="submit" value="완료"></p>
    </form>

    <% } %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
