<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("staffID"));
	int buff=2;
	int i = 0;
	String updatesql = "update staffinfoall set staffbuff=? where staffid="+id;
	pstmt = conn.prepareStatement(updatesql);
	pstmt.setInt(1,buff);
	i = pstmt.executeUpdate();//修改将数据库某个id的员工的状态设置为请假buff=2
	if(i == 1)
	{
		pstmt.close();
		conn.close();
		response.sendRedirect("../index.jsp?action=202&resterr=-1&restid="+id);
	}
	else
	{
		pstmt.close();
		conn.close();
		response.sendRedirect("../index.jsp?action=202&resterr=-99");
	}	
%>