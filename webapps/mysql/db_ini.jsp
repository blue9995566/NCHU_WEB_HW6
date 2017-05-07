<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String ip = "140.120.57.34:3306";
	String user = "jspuser";
	String pwd = "jspuser";
	String db = "jspdb";
	String driver = "com.mysql.jdbc.Driver";
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf8");
	try{
		String url = "jdbc:mysql://" + ip + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url,user,pwd);
		//out.println(con);
		//out.println(url);
	}catch(Exception ex){
		out.println(ex);
	}
%>