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
<table>
<tr>
    <th>帳號</th>
	<th>密碼</th>
    <th>生日</th>
    <th>Memo</th>
 </tr>
<%
	if(request.getParameter("account")!=null){
		String sql = "select * from hw6;";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			out.println("<tr>");
			String account=rs.getString("account");
			String password=rs.getString("password");
			String birthday=rs.getString("birthday");
			String memo=rs.getString("memo");
			out.println("<td>"+account+"</td>");
			out.println("<td>"+password+"</td>");
			out.println("<td>"+birthday+"</td>");
			out.println("<td>"+memo+"</td>");
			out.println("</tr>");
			
		}
	}
%>
</table>


</div>
</body>
</html>