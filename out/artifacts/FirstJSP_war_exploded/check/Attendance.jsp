<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %><%//链接数据库 %>
<%
	request.setCharacterEncoding("UTF-8");//解决乱码
	int id=Integer.parseInt(request.getParameter("buffid"));//接收员工id
	int checkbuff=Integer.parseInt(request.getParameter("buff"));//接收更改出勤信息
	if(checkbuff==0||checkbuff==1||checkbuff==2)//0未出勤，1出勤，2请假
	{
		int buff=checkbuff;//将接收更改出勤信息传给一个变量
		int i = 0;
		String updatesql = "update staffinfoall set staffbuff=? where staffid="+id;
		pstmt = conn.prepareStatement(updatesql);
		pstmt.setInt(1,buff);//更改出勤信息
		i = pstmt.executeUpdate();
		if(i == 1)
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../index.jsp?action=201&staffac=102");
		}
		else
		{
			pstmt.close();
			conn.close();
			response.sendRedirect("../index.jsp?action=201&staffac=102&bufferr=-99");
		}
	}	
%>