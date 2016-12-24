<%@ page language="java" import="java.io.*,java.util.Date" contentType="text/html; charset=UTF-8"
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

        File f = new File("c:/bankuser/" + id + ".txt");
        if(!f.isFile()) {
            FileOutputStream fos = new FileOutputStream(f);
            DataOutputStream dos = new DataOutputStream(fos);

            dos.writeUTF(name);
            dos.writeUTF(id);
            dos.writeUTF(pass);
            dos.writeUTF(accountnum);
            dos.writeUTF("\r\n");
            dos.close();
            fos.close();


            FileWriter bw = new FileWriter("c:/bankuser/user.txt", true);
            PrintWriter pw = new PrintWriter(bw, true);

            pw.write(id + "\r\n");
            bw.close();
            pw.close();


            Date now = new Date();
            String year = String.valueOf(now.getYear());
            String month = String.valueOf(now.getMonth() + 1);
            String date = String.valueOf(now.getDate());
            String hour = String.valueOf(now.getHours());
            String min = String.valueOf(now.getMinutes());
            String sec = String.valueOf(now.getSeconds());

            FileWriter bw2 = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
            PrintWriter pw2 = new PrintWriter(bw2, true);


            pw2.write(year + month + date + hour + min + sec + "\t");
            pw2.write("100000" + "\r\n");
            pw2.close();
            bw2.close();

        } else { %>
    <jsp:forward page="signup.jsp"/>
    <% } %>

    <div class="container" role="main">
        회원가입에 성공하셨습니다.
        <form name="form1" method="post" action="index.jsp">
            <input type="submit" class="btn btn-default" value="return home">
        </form>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
