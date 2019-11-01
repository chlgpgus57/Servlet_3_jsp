<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.notice.NoticeDAO"%>
<%@page import="com.hh.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection con = DBConnector.getConnection();
	
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);

	con.close();
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
  <h2>Notice 수정 Page</h2>

  <form action="./noticeUpdateResult.jsp" method="post">
  	<input type="hidden" name="num" value="<%= noticeDTO.getNum()%>">
    <div class="form-group">
      <label for="title">TITLE : </label>
        <div class="form-group">
     	 <input type="text" class="form-control form-control-sm" placeholder="Small form control" name="title" value="<%=noticeDTO.getTitle() %>">
   		</div>
      <label for="contents">CONTENTS : </label>
      <textarea class="form-control" rows="37" id="comment" name="contents" ><%=noticeDTO.getContents() %></textarea>
    </div>
    <button type="submit" class="btn btn-primary">완료</button>
  </form>
</div>
</body>
</html>