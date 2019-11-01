<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.member.MemberDAO"%>
<%@page import="com.hh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MemberDTO memberDTO= (MemberDTO)session.getAttribute("member");	
	
	MemberDAO memberDAO = new MemberDAO();
	
	Connection con = DBConnector.getConnection();
	int result = memberDAO.memberDelete(con, memberDTO);
	

	String msg="";
	
	if(result>0){
		msg="탈퇴 성공";
		session.invalidate();
		request.setAttribute("msg", msg);
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
		
	}else{
		msg="탈퇴 실패";
		request.setAttribute("msg", msg);
		request.setAttribute("path","../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
		
	}
	
	con.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>