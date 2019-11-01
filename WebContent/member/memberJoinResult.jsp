<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.member.MemberDAO"%>
<%@page import="com.hh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MemberDTO memberDTO = new MemberDTO();
	
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setEmail(request.getParameter("email"));

	MemberDAO memberDAO = new MemberDAO();
	
	Connection con = DBConnector.getConnection();
	int result=0;
	
	result = memberDAO.join(con, memberDTO);
	
	String msg="";
	
	String message = "회원가입 실패";

	String path = "../index.jsp";

	

	if(result>0){
	
		message = "회원가입 성공";
	
	}

	request.setAttribute("msg", message);

	request.setAttribute("path", path);

	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");

	view.forward(request, response);

		
	
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