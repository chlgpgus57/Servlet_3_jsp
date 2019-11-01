<%@page import="com.hh.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.notice.NoticeDTO"%>
<%@page import="com.hh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	
	ArrayList<NoticeDTO> ar = noticeDAO.noticeList(con);
	
	con.close();
	
	//임시 쿠키발행
	//쿠키 생성시 생성자에 키와 밸류 입력
	Cookie cookie = new Cookie("name","iu");
	
	//쿠키가 정용되는 path 설정 : 보통 context path 적용
	cookie.setPath(request.getContextPath());
	
	//쿠키의 유효시간
	//단위 -> 초단위
	//설정을 하지 않으면 웹브라우저가 종료될 때 같이 종료됨.
	cookie.setMaxAge(60*60);
	
	
	//쿠키를 클라이언트로 전송
	response.addCookie(cookie);
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Notice List Page</h2>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>TITLE</th>
        <th>WRITER</th>
        <th>DATE</th>
        <th>HIT</th>
      </tr>
    </thead>
    <tbody>
	
		<%
			for(int i=0; i<ar.size(); i++){
				NoticeDTO noticeDTO = ar.get(i);
			%>
			
			 <tr>
		        <td><%= noticeDTO.getNum() %></td>
		        <td><a href="./noticeSelect.jsp?num=<%=noticeDTO.getNum()%>"><%= noticeDTO.getTitle()%></a></td>
		        <td><%= noticeDTO.getWriter()%></td>
		        <td><%= noticeDTO.getReg_date()%></td>
		        <td><%= noticeDTO.getHit()%></td>
		      </tr>
			
			
		<% }%>
		
     
    </tbody>
  </table>
  	<a class="btn btn-primary" href="./noticeWrite.jsp">글쓰기</a>
  </div>
</div>

</body>
</html>
