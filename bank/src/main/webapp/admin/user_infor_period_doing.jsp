<%@ page language="java" import="java.io.BufferedReader, java.io.FileReader" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%@ page import="net.wkbae.assignment.wp.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.wkbae.assignment.wp.Record" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:adminCheck/>
<html>
<head>
    <title>사용자 정보</title>
</head>
<body>
    <form action="user_infor_period_doing.jsp" method=post>

        <br>
        <input type="radio" name="radio" value="1주일" checked>1주일
        <br>
        <input type="radio" name="radio" value="1개월">1개월
        <br>
        <input type="radio" name="radio" value="1년">1년
        <input type="submit" value="확인">
    </form>
    <br>
    <a href="../finish_userinfor.jsp" class="btn btn-default">처음 화면으로</a>

    <%
        request.setCharacterEncoding("UTF-8");
        String id = (String) request.getParameter("id");
        String doing = (String) request.getParameter("doing");
        String period = (String) request.getParameter("radio");

        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();

        Date account_date;
        String de_wi;
        long de_wi_money;
        long account_money;

        int account_year;
        int account_month;
        int account_day;

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
                    if(doing.equals("기간")) {
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
        } else if(doing.equals("입금")) {
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

        } else if(doing.equals("출금")) {
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
        } else if(day <= 31 && period.equals("1개월")) {
            if(doing.equals("기간")) {
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
        } else if(doing.equals("입금")) {
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

        } else if(doing.equals("출금")) {
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
        } else if(day <= 365 && period.equals("1년")) {
            if(doing.equals("기간")) {
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
        } else if(doing.equals("입금")) {
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

        } else if(doing.equals("출금")) {
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
