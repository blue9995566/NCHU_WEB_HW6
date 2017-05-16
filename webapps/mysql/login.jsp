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
				if(request.getParameter("account")!=null && request.getParameter("password")!=null){
					String sql = "select * from hw6 where account=? && password=?;";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,request.getParameter("account"));
					pstmt.setString(2,request.getParameter("password"));
					rs=pstmt.executeQuery();
					if (rs.next()){
						session.setAttribute("login","OK") ;
						String account=rs.getString("account");
						String birthday=rs.getString("birthday");
						String memo=rs.getString("memo");
			%>
						<h3><%=account%>---登入成功</h3>
						<h3>生日:<%=birthday%></h3>
						<h3>Memo:<%=memo%></h3>
						<button type="button" class="btn btn-danger" onclick="location.href='logout.jsp'"><span class="glyphicon glyphicon-log-out"></span>登出</button>
						<br><br>
						<button type="button" class="btn btn-primary" onclick="location.href='all.jsp'"><span class="glyphicon glyphicon-info-sign">列出所有使用者</button>
			<%
					}else{
			%>
						<h3>登入失敗</h3>
						<button type="button" class="btn btn-primary" onclick=window.location.href="index.html"><span class="glyphicon glyphicon-home"></span>回首頁</button>
			<%
					}
				}
			%>
		</div>
		 <div class="col-md-2"></div>
	</div>
</div>
</body>
</html>
