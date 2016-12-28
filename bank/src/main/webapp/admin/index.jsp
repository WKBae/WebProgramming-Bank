<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:adminCheck/>
<t:userPage title="관리자">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <form action="period_check.jsp" method=post>
                <input type="submit" class="btn btn-default" value="기간별 입출력 내역 조회">
            </form>
            <br>
            <form action="user_infor.jsp" method=post>
                <input type="submit" class="btn btn-default" value="회원별 정보 조회">
            </form>
            <br>
            <form action="all_accounts.jsp" method=post>
                <input type="submit" class="btn btn-default" value="전체 계좌 내역 출력">
            </form>
            <br>
            <form action="user_log.jsp" method=post>
                <input type="submit" class="btn btn-default" value="회원 접속 로그 확인">
            </form>
            <br>
            <form action="../logout.do" method="post">
                <input type="submit" class="btn btn-default" value="로그아웃">
            </form>
        </div>
    </jsp:attribute>
</t:userPage>
