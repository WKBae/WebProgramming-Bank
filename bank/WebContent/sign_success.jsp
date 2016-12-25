<%@ page language="java" import="java.io.*,java.util.Calendar" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String accountnum = request.getParameter("accountnum");

    File f = new File("c:/bankuser/" + id + ".txt");
    if(!f.isFile()) {
        try (FileOutputStream fos = new FileOutputStream(f);
             DataOutputStream dos = new DataOutputStream(fos)) {
            dos.writeUTF(name);
            dos.writeUTF(id);
            dos.writeUTF(pass);
            dos.writeUTF(accountnum);
            dos.writeUTF("\r\n");
        }

        try (FileWriter bw = new FileWriter("c:/bankuser/user.txt", true);
             PrintWriter pw = new PrintWriter(bw, true)) {
            pw.write(id + "\r\n");
        }

        Calendar cal = Calendar.getInstance();
        String year = String.valueOf(cal.get(Calendar.YEAR));
        String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
        if(month.length()==1)
            month="0"+month;
        String date = String.valueOf(cal.get(Calendar.DATE));
        if(date.length()==1)
            date="0"+date;
        String hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
        if(hour.length()==1)
            hour="0"+hour;
        String min = String.valueOf(cal.get(Calendar.MINUTE));
        if(min.length()==1)
            min="0"+min;
        String sec = String.valueOf(cal.get(Calendar.SECOND));
        if(sec.length()==1)
            sec="0"+sec;

        try (FileWriter bw2 = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
             PrintWriter pw2 = new PrintWriter(bw2, true)) {
            pw2.write(year + month + date + hour + min + sec + "\t");
            pw2.write("100000\t가입을 축하드립니다.\r\n");
        }

    } else {
        response.sendRedirect("signup.jsp");
    }
%>
<t:basicPage title="회원가입 결과">
    <jsp:attribute name="body">
        <div class="container" role="main">
            회원가입에 성공하셨습니다.
            <form name="form1" method="post" action="index.jsp">
                <input type="submit" class="btn btn-default" value="return home">
            </form>
        </div>
    </jsp:attribute>
</t:basicPage>
