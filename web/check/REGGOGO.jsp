<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("Username");
	String pass = request.getParameter("Password");
	String phnumber = request.getParameter("phnumber");
	String idcardnum = request.getParameter("idcardnum");
	String usersex = request.getParameter("usersex");
	String borndate = request.getParameter("borndate");
	String adkey = request.getParameter("adkey");
	sql = "select * from adkey";
	rs = statement.executeQuery(sql);
	Statement stmt = conn.createStatement();
	ResultSet rs2 =null;
	String datauser =null;
	String dataidcard =null;
	String dataadkey =null;
	int i = 0;
	int pos = 0;//POS机
	while(rs.next())//匹对管理员密码是否正确
	{
		dataadkey=rs.getString("adpass");
		if(adkey.equals(dataadkey))
		{
			
		}
		else
		{
			response.sendRedirect("../index.jsp?action=224&regerr=-3");
		}
	}
	sql = "select * from user";
	rs2 = stmt.executeQuery(sql);
	while(rs2.next())
	{
		datauser = rs2.getString("username");
		if(name.equals(datauser))//数据库内匹配是否有相同的用户名
		{
			pos=1;
			break;//跳出循环---有相同的用户
		}
		else
		{
			continue;//未有相同用户---继续循环遍历
		}
		}
	while(rs2.next())
	{
		dataidcard = rs2.getString("useridcard");
		if(idcardnum.equals(dataidcard))//数据库内匹配是否有相同的身份证号
		{
			pos=2;
			break;//跳出循环---有相同的身份证号
		}
		else
		{
			continue;//未有相同用户---继续循环遍历
		}
	}
	if(pos==1)
	{
		response.sendRedirect("../index.jsp?action=224&regerr=-1");//注册错误代码-1
	}
	else if(pos==2)
	{
		response.sendRedirect("../index.jsp?action=224&regerr=-2");//注册错误代码-2
	}
	else
	{
		String updatesql = "insert into user(userid,username,userpass,userphnum,useridcard,usersex,userborn)values(userid,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(updatesql);//执行增加sql语句
		pstmt.setString(1,name);//对应每个'？'
		pstmt.setString(2,pass);
		pstmt.setString(3,phnumber);
		pstmt.setString(4,idcardnum);
		pstmt.setString(5,usersex);
		pstmt.setString(6,borndate);
		i = pstmt.executeUpdate();
		if(i == 1)
		{
			response.sendRedirect("../index.jsp?action=512&logerr=-3");
		}
		else
		{
			response.sendRedirect("../index.jsp?action=224&regerr=-99");
		}
	}
%>

