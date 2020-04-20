<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="../../check/mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
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
	while(rs.next())
	{
		dataid=rs.getString("deptid");//匹对数据库是否有相同手机号
		if(deptid.equals(dataid))
		{
			pos=1;
			break;
		}
		else
		{
			continue;
		}
	}
	while(rs.next())
	{
		dataname = rs2.getString("deptname");//匹对数据库是否有相同身份证号
		if(deptname.equals(dataname))
		{
			pos=2;
			break;
		}
		else
		{
			continue;
		}
	}
	if(pos==1)
	{
		response.sendRedirect("../index.jsp?action=105-1&err=-1");
	}
	else if(pos==2)
	{
		response.sendRedirect("../index.jsp?action=105-1&err=-2");
	}
	else//没有相同数据进行增加数据
	{
		String insertsql = "insert into deptinfo(deptid,deptname,deptman,deptadd,deptnum)values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(insertsql);
		pstmt.setString(1,deptid);
		pstmt.setString(2,deptname);
		pstmt.setString(3,deptman);
		pstmt.setString(4,address);
		pstmt.setString(5,deptnum);
		i = pstmt.executeUpdate();
		if(i == 1)
		{
			response.sendRedirect("../../index.jsp?action=105-1&err=-3");
		}
		else
		{
			response.sendRedirect("../../index.jsp?action=105-1&err=-99");
		}
	}
%>