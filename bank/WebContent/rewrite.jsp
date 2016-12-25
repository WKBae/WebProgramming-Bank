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
    <div class="container" role="main">
        <div class="row">
            <div class="col-xs-offset-1 col-xs-10 col-sm-offset-2 col-sm-8 col-md-offset-4 col-md-4">
            <%
                String id = (String) session.getAttribute("id");
                try(FileInputStream fis = new FileInputStream("c:/bankuser/" + id + ".txt")) {
                    DataInputStream dis = new DataInputStream(fis);

                    String name = dis.readUTF();
                    id = dis.readUTF();
                    String pass = dis.readUTF();
                    String accountnum = dis.readUTF();
            %>
                <form name="form1" method="post" action="rewrite_success.jsp">
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" maxlength="10" placeholder="이름" value="<%=name%>">
                    </div>
                    <div class="form-group">
                        <label for="id">아이디 (변경 불가)</label>
                        <input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="아이디" value="<%=id%>" disabled>
                    </div>
                    <div class="form-group">
                        <label for="pass">비밀번호</label>
                        <input type="password" class="form-control" id="pass" name="pass" maxlength="10" placeholder="비밀번호" value="<%=pass%>">
                    </div>
                    <div class="form-group">
                        <label for="accountnum">계좌</label>
                        <input type="text" class="form-control" id="accountnum" name="accountnum" maxlength="10" placeholder="계좌" value="<%=accountnum%>">
                    </div>
                    <button type="submit" class="btn btn-primary">완료</button>
                </form>
            <%  } %>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
