<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <form name="form1" method="get" action="rewrite.jsp">
            <input type="submit" class="btn btn-default" value="정보수정">
        </form>
        <br>
        <form name="form2" method="get" action="do_logout.jsp">
            <input type="submit" class="btn btn-default" value="로그아웃">
        </form>
        <br>
        <form name="form1" method="get" action="exit.jsp">
            <input type="submit" class="btn btn-default" value="회원탈퇴">
        </form>
        <br>
        <form name="form1" method="get" action="bank_use.jsp">
            <input type="submit" class="btn btn-default" value="은행이용">
        </form>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
