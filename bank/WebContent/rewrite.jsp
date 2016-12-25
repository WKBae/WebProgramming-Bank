<%@ page language="java" import="java.io.DataInputStream,java.io.FileInputStream" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    String id = (String) session.getAttribute("id");
    try(FileInputStream fis = new FileInputStream("c:/bankuser/" + id + ".txt")) {
        DataInputStream dis = new DataInputStream(fis);

        String name = dis.readUTF();
        id = dis.readUTF();
        String pass = dis.readUTF();
        String accountnum = dis.readUTF();

        request.setAttribute("name", name);
        request.setAttribute("id", id);
        request.setAttribute("pass", pass);
        request.setAttribute("accountnum", accountnum);
    }
%>

<t:userPage title="개인정보 수정">
    <jsp:attribute name="body">
        <div class="container" role="main">
            <div class="row">
                <div class="col-xs-offset-1 col-xs-10 col-sm-offset-2 col-sm-8 col-md-offset-4 col-md-4">

                    <form name="form1" method="post" action="rewrite_success.jsp">
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name" maxlength="10" placeholder="이름" value="${name}">
                        </div>
                        <div class="form-group">
                            <label for="id">아이디 (변경 불가)</label>
                            <input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="아이디" value="${id}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="pass">비밀번호</label>
                            <input type="password" class="form-control" id="pass" name="pass" maxlength="10" placeholder="비밀번호" value="${pass}">
                        </div>
                        <div class="form-group">
                            <label for="accountnum">계좌</label>
                            <input type="text" class="form-control" id="accountnum" name="accountnum" maxlength="10" placeholder="계좌" value="${accountnum}">
                        </div>
                        <button type="submit" class="btn btn-primary">완료</button>
                    </form>
                </div>
            </div>
        </div>
    </jsp:attribute>
</t:userPage>
