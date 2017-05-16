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
	if(request.getParameter("account")!=null && request.getParameter("password")!=null&& request.getParameter("birthday")!=null&& request.getParameter("memo")!=null){
		String sql = "select * from hw6 where account=?;";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("account"));
		rs=pstmt.executeQuery();
		if (rs.next()){
			out.println("This account has been registered");
		}else{
			String sql_insert = "insert into hw6 (account,password,birthday,memo)values(?,?,?,?);";
			pstmt=con.prepareStatement(sql_insert);
			pstmt.setString(1,request.getParameter("account"));
			pstmt.setString(2,request.getParameter("password"));
			pstmt.setString(3,request.getParameter("birthday"));
			pstmt.setString(4,request.getParameter("memo"));
			pstmt.executeUpdate();
			out.println("Register successfully!Wait one second to redirect");
			response.setHeader("Refresh" , "1;url=index.html");
		}
	}
%>

			<form action="register.jsp" name="form1" id="form" method="post">
			<div class="col-xs-3">
			</div>
			<div class="col-xs-6">
				<label>帳號</label>
				<input type="text" class="form-control" name="account" required>
				<label>密碼</label>
				<input type="password" class="form-control" name="password" required>
				<label>生日</label>
				<input type="date" class="form-control" name="birthday" value="1994-11-03" required>
				<label>Memo</label>
				<textarea name="memo" class="form-control" rows="4" cols="50" style="resize:none" required></textarea>
				<br><button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span>註冊</button>
			</div>
			<div class="col-xs-3">
			</div>
			</form>
		 </div>
		 <div class="col-md-2"></div>
	</div>
</div>
</body>
</html>
