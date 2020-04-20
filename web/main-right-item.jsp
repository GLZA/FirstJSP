<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/item.css">
<div id="item">
	<%if(session.getAttribute("sName")==null)
	{
	%>
		<%if(request.getParameter("action")==null){%>
			<%@ include file="MyJsp.jsp"%>
		<%}else if(request.getParameter("action").equals("224")){%>
			<%@ include file="adreg.jsp"%>
		<%}else{%>
			<%@ include file="login.jsp"%>
		<%}%>
	<%}
	else
	{
		request.setCharacterEncoding("UTF-8");
		String itemcode = request.getParameter("action");
		if(itemcode==null)
		{%>
			<%@ include file="MyJsp.jsp"%>
		<%}
		else if(itemcode.equals("666"))
		{%>
			<%@ include file="welcome.jsp"%>
		<%}
		else if(itemcode.equals("224"))
		{%>
			<%@ include file="adreg.jsp"%>
		<%}
		else if(itemcode.equals("101"))
		{ %>
			<%@ include file="staffad/staffinfo.jsp"%>
		<%} 
		else if(itemcode.equals("102"))
		{ %>
			<%@ include file="staffad/addstaff.jsp"%>
		<%} 
		else if(itemcode.equals("103"))
		{ %>
			<%@ include file="staffad/editstaff.jsp"%>
		<%}
		else if(itemcode.equals("104"))
		{ %>
			<%@ include file="staffad/outstaff.jsp"%>
		<%}
		else if(itemcode.equals("105"))
		{ %>
			<%@ include file="deptad/deptinfo.jsp"%>
		<%} 
		else if(itemcode.equals("105-1"))
		{ %>
			<%@ include file="deptad/adddept.jsp"%>
		<%} 
		else if(itemcode.equals("105-2"))
		{ %>
			<%@ include file="deptad/editdept.jsp"%>
		<%}
		else if(itemcode.equals("105-3"))
		{ %>
			<%@ include file="deptad/outdept.jsp"%>
		<%}
		else if(itemcode.equals("106"))
		{ %>
			<%@ include file="jobad/jobinfo.jsp"%>
		<%}
		else if(itemcode.equals("106-1"))
		{ %>
			<%@ include file="jobad/jobinfo.jsp"%>
		<%}
		else if(itemcode.equals("106-2"))
		{ %>
			<%@ include file="jobad/jobinfo.jsp"%>
		<%}
		else if(itemcode.equals("106-3"))
		{ %>
			<%@ include file="jobad/jobinfo.jsp"%>
		<%}
		else if(itemcode.equals("201"))
		{ %>
			<%@ include file="staffcheck/staffV.jsp"%>
		<%} 
		else if(itemcode.equals("202"))
		{ %>
			<%@ include file="staffcheck/staffrest.jsp"%>
		<%}
		else if(itemcode.equals("301"))
		{ %>
			<%@ include file="staffcheck/stafffrom.jsp"%>
		<%}
		else
		{ %>
			<%@ include file="MyJsp.jsp"%>
		<%}}%>
</div>
			