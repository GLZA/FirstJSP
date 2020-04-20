<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="../../check/mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("editid");
	String deptid = request.getParameter("deptid");
	String deptname = request.getParameter("deptname");
	String deptman = request.getParameter("deptman");
	String address = request.getParameter("address");
	String deptnum = request.getParameter("deptnum");//接收表单信息
%>
<%
	sql = "select * from deptinfo";//查询员工信息表
	rs = statement.executeQuery(sql);
	Statement stmt = conn.createStatement();
	ResultSet rs2 =null;
	int pos = 0;
	int i = 0;
	String dataid = null;
	String dataname = null;
%>
<%
		String updatesql = "update deptinfo set deptname=?,deptman=?,deptadd=?,deptnum=?where deptid="+id;
		pstmt = conn.prepareStatement(updatesql);
		pstmt.setString(1,deptname);
		pstmt.setString(2,deptman);
		pstmt.setString(3,address);
		pstmt.setString(4,deptnum);
		i = pstmt.executeUpdate();
		if(i == 1)
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../../index.jsp?action=105-1&err=-3");
		}
		else
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../../index.jsp?action=105-1&err=-99");
		}
%>