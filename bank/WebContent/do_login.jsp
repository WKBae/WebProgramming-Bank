<%@ page language="java" import="java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
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
        String reqid = request.getParameter("id");
        String reqpass = request.getParameter("pass");

        File file = new File("c:/bankuser/" + reqid + ".txt");

        if(file.isFile()) {
            FileInputStream fis = new FileInputStream(file);
            DataInputStream dis = new DataInputStream(fis);

            String name = dis.readUTF();
            String id = dis.readUTF();
            String pass = dis.readUTF();
            dis.close();
            fis.close();
            if(id.equals(reqid) && pass.equals(reqpass)) {
                Calendar cal = Calendar.getInstance();
                String year = String.valueOf(cal.get(Calendar.YEAR));
                String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
                String date = String.valueOf(cal.get(Calendar.DATE));
                String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
                String min = String.valueOf(cal.get(Calendar.MINUTE));
                String sec = String.valueOf(cal.get(Calendar.SECOND));
                FileWriter bw = new FileWriter("c:/bankuser/" + id + "_log.txt", true);
                PrintWriter pw = new PrintWriter(bw, true);

                pw.write(year + month + date + hour + min + sec + "\r\n");

                pw.close();
                bw.close();

                session.setAttribute("id", id);
    %>
                <jsp:forward page="User_main.jsp"/>

    <%      } else { %>
                <a href="index.jsp">로그인 실패</a>
    <%      }
        } else { %>
            <a href="index.jsp">로그인 실패</a>
    <%  } %>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
