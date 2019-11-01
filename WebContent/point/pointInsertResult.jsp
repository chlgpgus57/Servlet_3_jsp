<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.point.PointDAO"%>
<%@page import="com.hh.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	PointDTO pointDTO = new PointDTO();

	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getTotal()/3.0);
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	int result = pointDAO.insert(con, pointDTO);
	
	con.close();
	
	String msg="등록실패";
	if(result>0){
		msg="등록성공";
	}
	
	 request.setAttribute("msg", msg);
	 request.setAttribute("path", "./pointList.jsp");

	RequestDispatcher view= request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	location.href="../common/common_result.jsp?msg=<%=msg%>";

</script>


</head>
<body>

</body>
</html>