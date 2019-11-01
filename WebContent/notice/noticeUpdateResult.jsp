<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.notice.NoticeDAO"%>
<%@page import="com.hh.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	NoticeDTO noticeDTO = new NoticeDTO();

	noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	int result = noticeDAO.update(con, noticeDTO);
	
	con.close();
	
/* 	String msg="업데이트 실패";
	if(result>0){
		msg="업데이트 성공";
	}
	 
	
	 request.setAttribute("msg", msg);
	 request.setAttribute("path", "./noticeList.jsp");

	RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response); */
	
	
	if(result<0){
		String msg="업데이트 실패";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");

		RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	
	}
	 
	

	response.sendRedirect("./noticeList.jsp");
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