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
    <h1>회원정보</h1>
    <form name="form1" method="post" action="sign_success.jsp">
        <p>이름 : <input type="text" name="name" maxlength="10"></p>
        <p>아이디 : <input type="text" name="id" maxlength="10"></p>
        <p>비밀번호 : <input type="password" name="pass" maxlength="10"></p>
        <p>계좌 : <input type="text" name="accountnum" maxlength="10"></p>
        <p>(기타 이메일 등 개인정보는 안받겠습니다)</p>
        <p><input type="submit" value="완료"></p>
    </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
