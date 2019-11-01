<%@page import="com.hh.notice.NoticeDTO"%>
<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	
	NoticeDAO noticeDAO = new  NoticeDAO();
	Connection con = DBConnector.getConnection();
	
	NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
	
	
	String msg="";
	if(noticeDTO == null){
		 msg="없는 페이지 입니다.";
		 
		 request.setAttribute("msg", msg);
		 request.setAttribute("path", "./noticeList.jsp");
		 RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
		 view.forward(request, response);

	}else{
		
		request.setAttribute("dto", noticeDTO);
		RequestDispatcher view= request.getRequestDispatcher("./noticeSelectResult.jsp");
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