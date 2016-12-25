<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:basicPage title="회원가입">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <div class="row">
                <div class="col-xs-offset-1 col-xs-10 col-sm-offset-2 col-sm-8 col-md-offset-4 col-md-4">
                    <h1>회원 정보</h1>
                    <form name="form1" method="post" action="sign.do">
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
                            <input type="text" class="form-control" id="accountnum" name="accountnum" maxlength="10"
                                   placeholder="계좌">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">완료</button>
                            <p class="help-block">(기타 이메일 등 개인정보는 받지 않습니다.)</p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:attribute>
</t:basicPage>
