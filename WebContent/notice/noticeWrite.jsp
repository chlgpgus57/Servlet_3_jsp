<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%



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
  <h2>Notice Write Page</h2>

  <form action="./noticeWriteResult.jsp" method="post">
    <div class="form-group">
      <label for="title">TITLE : </label>
        <div class="form-group">
     	 <input type="text" class="form-control form-control-sm" placeholder="Small form control" name="title">
   		</div>
      <label for="contents">CONTENTS : </label>
      <textarea class="form-control" rows="37" id="comment" name="contents"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">완료</button>
  </form>
</div>

</body>