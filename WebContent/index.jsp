<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<body>
	<%@include file="./layout/nav.jsp" %>
	
	
	<div class="container">
	<%  if(memberDTO != null){ %>
	 	<h1>After success login</h1>
	<%  }else{ %>
	 
	 <h1>before login</h1>
	 <% } %>
	</div>
	
	<div class="container">
		<%
			Cookie[] cookies = request.getCookies();
			for(int i=0; i<cookies.length;i++){
				%>
				<h1>name = <%= cookies[i].getName() %></h1>
				<h1>value = <%= cookies[i].getValue() %></h1>
				
		<% } %>
	</div>
	
	
</body>
</html>