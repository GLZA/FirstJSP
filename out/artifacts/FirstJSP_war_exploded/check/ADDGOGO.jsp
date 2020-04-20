<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("staffname");
	String sex = request.getParameter("staffsex");
	String phnumber = request.getParameter("phnumber");
	String idnum = request.getParameter("idcardnum");
	String deptname = request.getParameter("deptname");
	String staffborn = request.getParameter("staffborn");
	String staffentry = request.getParameter("staffentry");
	String nativeplace = request.getParameter("nativeplace");
	String residence = request.getParameter("residence");
	String address = request.getParameter("address");
	String Mrest = request.getParameter("Mrest");
	String salary = request.getParameter("salary");//接收表单信息
%>
<%
	sql = "select * from staffinfoall";//查询员工信息表
	rs = statement.executeQuery(sql);
	Statement stmt = conn.createStatement();
	ResultSet rs2 =null;
	int pos = 0;
	int i = 0;
	String dataph = null;
	String dataidcard = null;
%>
<%
	while(rs.next())
	{
		dataph=rs.getString("staffph");//匹对数据库是否有相同手机号
		if(phnumber.equals(dataph))
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
		dataidcard = rs2.getString("idcard");//匹对数据库是否有相同身份证号
		if(name.equals(dataidcard))
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
		response.sendRedirect("../index.jsp?action=102&err=-1");
	}
	else if(pos==2)
	{
		response.sendRedirect("../index.jsp?action=102&err=-2");
	}
	else//没有相同数据进行增加数据
	{
		String insertsql = "insert into staffinfoall(staffbuff,staffid,staffname,staffsex,staffph,idcard,deptname,staffborn,staffentry,nativeplace,residence,address,Mrest,salary)values(staffbuff,staffid,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(insertsql);
		pstmt.setString(1,name);
		pstmt.setString(2,sex);
		pstmt.setString(3,phnumber);
		pstmt.setString(4,idnum);
		pstmt.setString(5,deptname);
		pstmt.setString(6,staffborn);
		pstmt.setString(7,staffentry);
		pstmt.setString(8,nativeplace);
		pstmt.setString(9,residence);
		pstmt.setString(10,address);
		pstmt.setString(11,Mrest);
		pstmt.setString(12,salary);
		i = pstmt.executeUpdate();
		if(i == 1)
		{
			response.sendRedirect("../index.jsp?action=102&err=-3");
		}
		else
		{
			response.sendRedirect("../index.jsp?action=102&err=-99");
		}
	}
%>