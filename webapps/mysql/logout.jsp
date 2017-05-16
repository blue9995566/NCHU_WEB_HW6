<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db_ini.jsp"%>
<html>
<head>
	<title>會員系統</title>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="./main.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div id="div1">
		<div class="jumbotron">
			<h3 align="center">會員系統</h3>
		</div>
	</div>
	<div class="row">
		 <div class="col-md-2"></div>
		 <div class="col-md-8" align="center">
			 <%
			 session.removeAttribute("login");
			 out.println("logout");
			 response.setHeader("Refresh" , "1;url=index.html");
			 %>

		</div>
		 <div class="col-md-2"></div>
	</div>
</div>
</body>
</html>
