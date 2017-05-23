<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="db_ini.jsp"%>
<%
	String account=request.getParameter("account");
	String sql = "select * from hw6 where account=?;";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("account"));
	rs=pstmt.executeQuery();
	if (rs.next()){
		out.print("<p style='color:red;'><span class='glyphicon glyphicon-remove'></span>This account has been registered</p>");
	}else{
		out.print("<p style='color:blue;'><span class='glyphicon glyphicon-ok'></span>OK!</p>");
	}
%>