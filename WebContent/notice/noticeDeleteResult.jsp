<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.notice.NoticeDTO"%>
<%@page import="com.hh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	int result = noticeDAO.delete(con, num);
	
	if(result>0){
		String msg="삭제성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");

		RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
		
	}else{

		response.sendRedirect("./noticeList.jsp");
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