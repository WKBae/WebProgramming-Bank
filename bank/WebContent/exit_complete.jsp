<%@ page language="java" import="java.io.File" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String delid = (String) session.getAttribute("id");
    File f = new File("c:/bankuser/" + delid + ".txt");
    File f_log = new File("c:/bankuser/" + delid + "_log.txt");
    File f_account = new File("c:/bankuser/" + delid + "_account.txt");
    f.delete();
    f_log.delete();
    f_account.delete();
    session.removeAttribute("id");
%>
<jsp:forward page="index.jsp"/>
