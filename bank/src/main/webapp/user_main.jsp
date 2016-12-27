<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:userPage title="메인 메뉴">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <div class="row">
                <div class="col-xs-offset-1 col-xs-10 col-sm-offset-2 col-sm-8 col-md-offset-4 col-md-4">
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
            </div>
        </div>
    </jsp:attribute>
</t:userPage>
