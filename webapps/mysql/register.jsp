<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db_ini.jsp"%>
<html>
<head>
	<title>會員系統</title>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="./main.css">
</head>
<body>
<div id="div">
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
<fieldset>
	<legend>註冊</legend>
	<form action="register.jsp" name="form1" id="form" method="post">
	帳號:<input type="text" name="account" required>
	<br>密碼:<input type="password" name="password" required>
	<br>生日:<input type="date" name="birthday" value="1994-11-03" required>
	<br>Memo<textarea name="memo" rows="4" cols="50" style="resize:none" required></textarea>
	<br><input type="submit" value="註冊" />
	</form>
</fieldset>
</div>
</body>
</html>
