<%@page import="com.hh.util.DBConnector"%>
<%@page import="com.hh.notice.NoticeDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDTO noticeDTO = new NoticeDTO();
	
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));

	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();

	
	int result=0;
	
	try {
		result = noticeDAO.write(con, noticeDTO);
		} catch (Exception e) {
			result=0;
		e.printStackTrace();
	}
	

	String msg="";
	if(result>0){
		msg="등록성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");
		RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}else{
		msg="내용을 입력하세요";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");

		RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
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