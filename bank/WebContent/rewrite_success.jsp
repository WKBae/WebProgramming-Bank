<%@ page language="java" import="java.io.DataOutputStream,java.io.FileOutputStream"
         contentType="text/html; charset=UTF-8"
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
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
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
    %>

    <div class="container" role="main">
        회원정보를 수정하였습니다.
        <form name="form1" method="post" action="index.jsp">
            <input type="submit" class="btn btn-primary" value="return home">
        </form>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
