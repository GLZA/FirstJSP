<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file="mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userName=null;
	String passWord=null;
	String sName=request.getParameter("UserId");
	String sPass=request.getParameter("PassWd");//获取login.jsp的表单
%>
<%
	sql = "select * from user";//登陆用户表
	rs = statement.executeQuery(sql);//执行查询
	int i = 0;
%>
<%
	while(rs.next())
	{
		userName=rs.getString("username");
		passWord = rs.getString("userpass");
		if(sName.equals(userName)&&sPass.equals(passWord))//与数据库中的值进行匹对
		{
			i=1;//匹对成功i赋值1
			break;//跳出循环
		}
		else
		{
			i=0;//刷新i值
			continue;//继续
		}
	}
	if(i!=1)
	{
		response.sendRedirect("../index.jsp?action=512&logerr=-1");//传输错误代码logerr=-1
	}
	else if(i==1)//如果i==1，将用户名密码保存至两个session对象里面
	{
		session.setAttribute("sName",sName);
		session.setAttribute("sPass",sPass);
		response.sendRedirect("../index.jsp?action=666");//欢迎页面
	}
	else
	{
		response.sendRedirect("../index.jsp?action=512&logerr=-99");//未知错误代码
	}
%>