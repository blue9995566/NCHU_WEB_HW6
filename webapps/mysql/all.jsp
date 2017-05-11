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
			<table class="table">
			<tr>
				<th>帳號</th>
				<th>密碼</th>
				<th>生日</th>
				<th>Memo</th>
			 </tr>
			<%
				if(request.getParameter("asd")!=null){
					String sql = "select * from hw6;";
					pstmt=con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String account=rs.getString("account");
						String password=rs.getString("password");
						String birthday=rs.getString("birthday");
						String memo=rs.getString("memo");
			%>	
				<tr>
					<td><%=account%></td>
					<td><%=password%></td>
					<td><%=birthday%></td>
					<td><%=memo%></td>
				 </tr>
			<%
					}
				}
			%>
			</table>
			<button type="button" class="btn btn-primary" onclick=window.location.href="index.html"><span class="glyphicon glyphicon-home"></span>回首頁</button>
		</div>
		 <div class="col-md-2"></div>
	</div>
</div>
</body>
</html>