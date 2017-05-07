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
	if(request.getParameter("account")!=null && request.getParameter("password")!=null){
		String sql = "select * from hw6 where account=? && password=?;";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("account"));
		pstmt.setString(2,request.getParameter("password"));
		rs=pstmt.executeQuery();
		if (rs.next()){
			String account=rs.getString("account");
			String birthday=rs.getString("birthday");
			String memo=rs.getString("memo");
			out.println(account+"--登入成功<br>");
			out.println("生日:"+birthday+"<br>");
			out.println("Memo:"+memo+"<br>");
			out.println("<input type='button' onclick='location.href=\"index.html\"' value='登出' />");
		}else{
			out.println("--登入失敗");
			out.println("<input type='button' onclick='location.href=\"index.html\"' value='上一頁' />");
		}
	}
%>

</div>
</body>
</html>