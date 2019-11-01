
<%@page import="java.net.CookieStore"%>
<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.member.MemberDAO"%>
<%@page import="com.hh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	/////////////////////////////////////////////////////

	String check = request.getParameter("remember");
	if(check!=null){
		Cookie cookie = new Cookie("id",id);
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
	}else{
		Cookie cookie = new Cookie("id","");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	

	
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();

	MemberDTO memberDTO = memberDAO.memberLogin(con, id, pw);
	
	

	String msg = "ID/PW가 일치하지 않습니다";
	String path = "../index.jsp";

	if(memberDTO != null){

		session.setAttribute("member", memberDTO);
		response.sendRedirect(path);

	}else{
		request.setAttribute("msg", msg);
		request.setAttribute("path", path);
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}

	

	con.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 리절트</title>
</head>
<body>

</body>
</html>