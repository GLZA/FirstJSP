<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("staffID"));//获取需要搜索的员工ID号
	session.setAttribute("staffID",id);//将Id赋值至一个session对象
	response.sendRedirect("../index.jsp?action=202&restid="+id);
%>