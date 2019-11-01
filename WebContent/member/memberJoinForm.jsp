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
  
</head>
<body>

	
	<%@include file="../layout/nav.jsp" %>
	
	<div class="container">
	  <h2>회원가입페이지</h2>
	  
	  <form action="./memberJoinResult.jsp" class="was-validated" method="post">
	    <div class="form-group">
	      <label for="name">name:</label>
	      <input type="text" class="form-control" id="pwd" placeholder="Enter name" name="name" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    
	    <div class="form-group">
	      <label for="uname">ID:</label>
	      <input type="text" class="form-control" id="uname" placeholder="Enter id" name="id" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pw" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    <div class="form-group form-check">
	      
	    </div>
	    
	    <div class="form-group">
	      <label for="phone">Phone:</label>
	      <input type="number" class="form-control" id="email" placeholder="Enter phone" name="phone" required>
	    </div>
	
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
	    </div>
	    
	    <button type="submit" class="btn btn-primary">가입하기</button>
	  </form>
	</div>


</body>
</html>