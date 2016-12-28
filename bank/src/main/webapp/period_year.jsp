<%@ page language="java" import="java.io.BufferedReader,java.io.FileReader,java.util.Calendar"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.wkbae.assignment.wp.Record" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:userCheck/>

<html>
<head>
    <title>사용자 정보</title>
</head>
<body>
    <form action="period_week.jsp" method=post>
        <input type="submit" value="1주일">
    </form>
    <br>
    <form action="period_month.jsp" method=post>
        <input type="submit" value="1개월">
    </form>
    <br>
    <form action="period_year.jsp" method=post>
        <input type="submit" value="1년">
    </form>
    <br>
    <a href="finish_balance_check.jsp" class="btn btn-default">처음 화면으로</a>

    <%
        String id = (String) session.getAttribute("id");
        String mychoose = (String) session.getAttribute("mychoose");

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
                if(day <= 365) {
                    if(mychoose.equals("기간")) {
                        if((!de_wi.equals("입금")) && (!de_wi.equals("출금"))) {
        %>
        <tr>
            <td><%=k %>
            </td>
            <td><%=df.format(account_date) %>
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
            <td><%=df.format(account_date) %>
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
        } else if(mychoose.equals("입금")) {
            if((!de_wi.equals("입금")) && (!de_wi.equals("출금"))) {
        %>
        <tr>
            <td><%=k %>
            </td>
            <td><%=df.format(account_date) %>
            </td>
            <td>입금</td>
            <td>100000</td>
            <td>100000</td>
        </tr>
        <%
        } else if(de_wi.equals("입금")) {
        %>

        <tr>
            <td><%=k %>
            </td>
            <td><%=df.format(account_date) %>
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

        } else if(mychoose.equals("출금")) {
            if(de_wi.equals("출금")) {
        %>

        <tr>
            <td><%=k %>
            </td>
            <td><%=df.format(account_date) %>
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
                }
                k++;
            }

        %>
    </table>


</body>
</html>
