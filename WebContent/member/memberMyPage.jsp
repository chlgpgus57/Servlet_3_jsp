<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">

#btn_right {
	float: right;
}

#contents {
	height: auto;
}

h2 {
	text-align: center;
	margin-bottom: 25px;
}

#contents{
	min-height: 500px;
}

#bt_gp{
	margin-left: 17%;

}
</style>
</head>

<body>
<%@include file="../layout/nav.jsp" %>
		<h2>NOTICE S-R-page</h2>

<% if(memberDTO == null) { 
		String msg = "꺼져";
		String path = "../index.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("path", path);
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>		

<div class="container">
		<form class="form-horizontal" action="memberUpdate.jsp" onsubmit=true>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id" name="id"readonly="readonly" value="<%=memberDTO.getId()%>">
					
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name" id="hit_lb">NAME</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name" name="name"
						readonly="readonly" value="<%=memberDTO.getName()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">EMAIL</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email" name="email"
						readonly="readonly" value="<%=memberDTO.getEmail() %>">
				</div>

			</div>
			<div class="form-group">

				<label class="control-label col-sm-2" for="phone">PHONE</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone" name="phone" readonly="readonly" value="<%=memberDTO.getPhone()%>">
			</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="lev">LEVEL</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="lev" name="lev"
						readonly="readonly" value="<%=memberDTO.getGrade() %>">
				</div>
			</div>
		<a class="btn btn-warning" id="btn_right" href="./memberUpdateForm.jsp">수정</a>
		<a class="btn btn-danger" href="./memberDeleteResult.jsp" >탈퇴</a>
		</form>
		<!--**********************버튼그룹 -->

	</div>

</body>



</html> 