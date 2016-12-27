<%@ page language="java" import="java.io.File" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="net.wkbae.assignment.wp.Users" %>
<%
    String delid = (String) session.getAttribute("id");

    Users.removeUser(delid);

    session.removeAttribute("id");

    response.sendRedirect("index.jsp");
%>
