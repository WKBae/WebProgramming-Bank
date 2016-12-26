<%@ page language="java" import="java.io.DataOutputStream,java.io.FileOutputStream" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String id = (String) session.getAttribute("id");
    String pass = request.getParameter("pass");
    String accountnum = request.getParameter("accountnum");

    try (FileOutputStream fos = new FileOutputStream("c:/bankuser/" + id + ".txt");
         DataOutputStream dos = new DataOutputStream(fos)) {

        dos.writeUTF(name);
        dos.writeUTF(id);
        dos.writeUTF(pass);
        dos.writeUTF(accountnum);
        fos.write('\n');
        session.removeAttribute("id");
    }
%>
<t:userPage title="개인정보 수정 결과">
    <jsp:attribute name="body">
        <div class="container" role="main">
            회원정보를 수정하였습니다.
            <form name="form1" method="post" action="index.jsp">
                <input type="submit" class="btn btn-primary" value="return home">
            </form>
        </div>
    </jsp:attribute>
</t:userPage>
