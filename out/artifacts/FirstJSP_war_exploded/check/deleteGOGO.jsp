<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");//解决乱码
	int id=Integer.parseInt(request.getParameter("deleid"));//接收要删除的id
%>
<%
	int pos = 0;//pos机
	int i = 0;
%>
<%
		String deletesql = "delete from staffinfoall where staffid =?";//sql删除语句
		pstmt = conn.prepareStatement(deletesql);//数据库执行语句
		pstmt.setInt(1,id);//与上面问好匹对
		i = pstmt.executeUpdate();//上传数据成功为1否则为0；
		if(i == 1)
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../index.jsp?action=101&staffac=102&deleerr=99");//成功传参数99
		}
		else
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../index.jsp?action=104&deleerr=-1");//失败传参数-1
		}
%>