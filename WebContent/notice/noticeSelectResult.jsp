<%@page import="com.hh.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDTO noticeDTO =(NoticeDTO)request.getAttribute("dto");
	
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
	<h1>Notice Select Page</h1>
	
	<form action="./noticeUpdate.jsp" method="post">
	<div class="container mt-3">
	  <h2>TITLE : <%=noticeDTO.getTitle()%></h2>
<%-- 	  	   <ul>
	 	  	<li>NUM	: <%=noticeDTO.getNum() %></li>
	 	    <li>title : <%=noticeDTO.getTitle() %></li>
	 	    <li>contents : <%=noticeDTO.getContents()  %></li>
	 	    <li>writer : <%=noticeDTO.getWriter()  %></li>
	 	    <li>hit : <%=noticeDTO.getHit()  %></li>
	 	    <li>date : <%=noticeDTO.getReg_date()  %></li>
	 	    
 	   </ul> --%>
		  <div class="media">
	    <div class="media-body">
	      <textarea class="form-control" rows="37" id="comment" readonly="readonly"><%=noticeDTO.getContents() %></textarea>
	    </div>
	    </div>
	 	<a  href="./noticeUpdate.jsp?num=<%=noticeDTO.getNum()%>" class="btn btn-danger">글 수정</a>
	 	<a  href="./noticeDeleteResult.jsp?num=<%=noticeDTO.getNum()%>" class="btn btn-danger">글 삭제</a>
	     <a href="./noticeList.jsp" class="btn btn-primary">글 목록</a>
	     
 	</div>
 	</form>
</body>
</html>