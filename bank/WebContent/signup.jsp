<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
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
                <h1>회원 정보</h1>
                <form name="form1" method="post" action="sign_success.jsp">
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" maxlength="10" placeholder="이름">
                    </div>
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="아이디">
                    </div>
                    <div class="form-group">
                        <label for="pass">비밀번호</label>
                        <input type="password" class="form-control" id="pass" name="pass" maxlength="10" placeholder="비밀번호">
                    </div>
                    <div class="form-group">
                        <label for="accountnum">계좌</label>
                        <input type="text" class="form-control" id="accountnum" name="accountnum" maxlength="10" placeholder="계좌">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">완료</button>
                        <p class="help-block">(기타 이메일 등 개인정보는 받지 않습니다.)</p>
                    </div>
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
