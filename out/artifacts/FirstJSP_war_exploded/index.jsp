<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
  	<title></title>
  	<link rel="stylesheet" type="text/css" href="css/styles.css">
  	<base href="<%=basePath%>">
  </head>
  <body onload="showTime()">
  	<div id="continor">
  		<div>
  			<% 
  				if(session.getAttribute("sName")==null)
  				{%>
					<%@ include file="topunlogin.jsp"%>
				<%}
				else
				{%>
  					<%@ include file="top.jsp"%>
  				<%}%>
  			<%@ include file="main.jsp"%>
  		</div>
  	</div>
  </body>
</html>
