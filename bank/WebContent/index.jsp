<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인 화면</title>
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
                <h1>계좌 관리시스템</h1>
                <form name="form1" method="post" action="do_login.jsp">
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="아이디">
                    </div>
                    <div class="form-group">
                        <label for="pass">비밀번호</label>
                        <input type="password" class="form-control" id="pass" name="pass" maxlength="10" placeholder="비밀번호">
                    </div>
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <a class="btn btn-link" href="signup.jsp">회원가입</a>
                </form>
            </div>
        </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
