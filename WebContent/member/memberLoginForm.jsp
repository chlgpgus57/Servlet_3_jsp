<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id = "";

	if(request.getParameter("id")!=null){
		id = request.getParameter("id");
	}

	Cookie [] cookies = request.getCookies();
	
/* 	for(Cookie cookie : cookies){
		if(cookie.getName().equals("id")){
			id=cookie.getValue();
			break;
		}
	} */

	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("id")){
			id=cookies[i].getValue();
			break;
		}
	}
	
%>    


<!DOCTYPE html>

<html>

<head>

<title>Bootstrap Example</title>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

  <style type="text/css">

  	#di{

  		width :inherit;

  		text-align: center;

  	}

  </style>

</head>

<body>

<%@ include file="../layout/nav.jsp" %>

<div class="container">

<div id="di">

  <h2>LOGIN</h2></div>

  <form action="memberLoginResult.jsp" method="post">

    <div class="form-group">

      <label for="email">ID:</label>

      <input type="text" checked="checked" class="form-control" id="id" placeholder="Enter ID" name="id" value="<%=id %>">

    </div>

    <div class="form-group">

      <label for="pwd">PW:</label>

      <input type="password" class="form-control" id="pw" placeholder="Enter PW" name="pw">

    </div>

    <div class="checkbox">
      <label><input type="checkbox" value="check" name="remember"> Remember me</label>
    </div>

    <button type="submit" class="btn btn-default">LOGIN</button>

  </form>

</div>

</body>

</html>