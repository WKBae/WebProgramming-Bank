<%@ page language="java" import="net.wkbae.assignment.wp.Record, net.wkbae.assignment.wp.User"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminCheck/>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
    <form action="period_check_doing.jsp" method="post">
        <select name="list1">
            <c:forEach var="id" items="${Users.getUsers()}">
                <option value="${id}">${id}</option>
            </c:forEach>
        </select>
        <br>
        <input type="radio" name="radio" value="1주일" id="rad-week" checked><label for="rad-week">1주일</label>
        <br>
        <input type="radio" name="radio" value="1개월" id="rad-month"><label for="rad-month">1개월</label>
        <br>
        <input type="radio" name="radio" value="1년" id="rad-year"><label for="rad-year">1년</label>
        <input type="submit" class="btn btn-primary" value="확인">
    </form>
    <br>
    <a href="index.jsp" class="btn btn-default">처음 화면으로</a>

    <%
        request.setCharacterEncoding("UTF-8");
        String id = (String) request.getParameter("list1");
        String period = (String) request.getParameter("radio");

        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();

        Date account_date;
        String de_wi;
        long de_wi_money;
        long account_money;

        int k = 1;
        User u = Users.findUser(id);
    %>


    <table border=1 cellspacing=10 cellpadding=10 width=500>
        <tr>
            <th>No.</th>
            <th>날짜</th>
            <th>입/출금</th>
            <th>입/출금액</th>
            <th>잔액</th>
        </tr>
        <%
            SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
            for(Record record : u.getRecords()) {
                account_date = record.getTime();
                account_money = record.getBalance();
                de_wi = record.getAmount() >= 0 ? "입금" : "출금";
                de_wi_money = record.getAmount();

                cal2.setTime(account_date);

                Calendar temp = Calendar.getInstance();
                temp.setTime(cal2.getTime());
                int day = 0;
                while(!temp.after(cal1)) {
                    day++;
                    temp.add(Calendar.DATE, 1);
                }
                if(day <= 7 && period.equals("1주일")) {
                    if((!de_wi.equals("입금")) && (!de_wi.equals("출금"))) {
        %>
        <tr>
            <td><%=k %>
            </td>
            <td><%= df.format(account_date) %>
            </td>
            <td>입금</td>
            <td>100000</td>
            <td>100000</td>
        </tr>
        <%
        } else {
        %>

        <tr>
            <td><%=k %>
            </td>
            <td><%= df.format(account_date) %>
            </td>
            <td><%=de_wi %>
            </td>
            <td><%=de_wi_money %>
            </td>
            <td><%=account_money %>
            </td>
        </tr>
        <%
            }
        } else if(day <= 31 && period.equals("1개월")) {
            if((!de_wi.equals("입금")) && (!de_wi.equals("출금"))) {
        %>
        <tr>
            <td><%=k %>
            </td>
            <td><%= df.format(account_date) %>
            </td>
            <td>입금</td>
            <td>100000</td>
            <td>100000</td>
        </tr>
        <%
        } else {
        %>

        <tr>
            <td><%=k %>
            </td>
            <td><%= df.format(account_date) %>
            </td>
            <td><%=de_wi %>
            </td>
            <td><%=de_wi_money %>
            </td>
            <td><%=account_money %>
            </td>
        </tr>
        <%
            }
        } else if(day <= 365 && period.equals("1년")) {
            if((!de_wi.equals("입금")) && (!de_wi.equals("출금"))) {
        %>
        <tr>
            <td><%=k %>
            </td>
            <td><%= df.format(account_date) %>
            </td>
            <td>입금</td>
            <td>100000</td>
            <td>100000</td>
        </tr>
        <%
        } else {
        %>

        <tr>
            <td><%=k %>
            </td>
            <td><%= df.format(account_date) %>
            </td>
            <td><%=de_wi %>
            </td>
            <td><%=de_wi_money %>
            </td>
            <td><%=account_money %>
            </td>
        </tr>
        <%
                    }
                }
                k++;
            }
        %>
    </table>


</body>
</html>