<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.point.PointDAO"%>
<%@page import="com.hh.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");


int num= Integer.parseInt(request.getParameter("num"));

PointDAO pointDAO = new PointDAO();
Connection con = DBConnector.getConnection();
int result = pointDAO.delete(con, num);



if(result>0){
	String msg="삭제성공";
	request.setAttribute("msg", msg);
	request.setAttribute("path", "./pointList.jsp");

	RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
	
}else{

	response.sendRedirect("./pointList.jsp");
}

	//성공하면 삭제성공 메세지띄우고 list로 돌아가기. 실패하면 메세지안띄우고 list로 바로이동

	
	
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