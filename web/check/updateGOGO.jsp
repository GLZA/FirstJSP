<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("editid");//接收需要修改的ID号
	String sex = request.getParameter("staffsex");
	String deptname = request.getParameter("deptname");
	String staffborn = request.getParameter("staffborn");
	String nativeplace = request.getParameter("nativeplace");
	String residence = request.getParameter("residence");
	String address = request.getParameter("address");
	String Mrest = request.getParameter("Mrest");
	String salary = request.getParameter("salary");//获取需要修改的表单信息
%>
<%
	int pos = 0;
	int i = 0;
%>
<%
		String updatesql = "update staffinfoall set staffsex=?,deptname=?,staffborn=?,nativeplace=?,residence=?,address=?,Mrest=?,salary=? where staffid="+id;
		pstmt = conn.prepareStatement(updatesql);
		pstmt.setString(1,sex);
		pstmt.setString(2,deptname);
		pstmt.setString(3,staffborn);
		pstmt.setString(4,nativeplace);
		pstmt.setString(5,residence);
		pstmt.setString(6,address);
		pstmt.setString(7,Mrest);
		pstmt.setString(8,salary);
		i = pstmt.executeUpdate();
		if(i == 1)
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../index.jsp?action=103&err=-2&id="+id);
		}
		else
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../index.jsp?action=103&err=-99");
		}
%>