
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

response.setCharacterEncoding("UTF-8");



//session.setAttribute("member", null);

//session.removeAttribute("member");

session.invalidate();

response.sendRedirect("../index.jsp");



%>