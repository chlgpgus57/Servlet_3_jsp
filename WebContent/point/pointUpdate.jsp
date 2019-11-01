<%@page import="com.hh.point.PointDAO"%>
<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection con = DBConnector.getConnection();
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = pointDAO.selectOne(con, num);
	
	con.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	
	
	<div class="container">
	  <h2>Point Update Page</h2>
	  
	  <form action="./pointUpdateResult.jsp" method="post">
	  	<input type="hidden" name="num" value="<%= pointDTO.getNum()%>">
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="<%=pointDTO.getName()%>">
	    </div>
	    <div class="form-group">
	      <label for="kor">kor:</label>
	      <input type="text" class="form-control" id="kor" placeholder="Enter kor" name="kor" value="<%=pointDTO.getKor()%>">
	    </div>
	     <div class="form-group">
	      <label for="eng">eng:</label>
	      <input type="text" class="form-control" id="eng" placeholder="Enter eng" name="eng" value="<%=pointDTO.getEng()%>">
	    </div>
	    <div class="form-group">
	      <label for="math">math:</label>
	      <input type="text" class="form-control" id="math" placeholder="Enter math" name="math" value="<%=pointDTO.getMath()%>">
	    </div>
	   
	  
	  
	    <button type="submit" class="btn btn-default">Submit</button>
	  </form>
	</div>


</body>
</html>