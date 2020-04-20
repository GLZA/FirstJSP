<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script src="js/menu.js" type="text/javascript"></script>
<div id="nav">
	<div class="navs">
		<span class="one"><img src="img/leftstaff.png"/></span>
		<span class="ones">员工管理</span>
	</div>
    <ul style="display:none">
        <li id=""><a class="nava" href="index.jsp?action=101&staffac=102<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">员工信息列表</a></li>
        <li id=""><a class="nava" href="index.jsp?action=102<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">添加员工</a></li>
        <li><a class="nava" href="index.jsp?action=201&staffac=102<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">员工考勤</a></li>
        <li><a class="nava" href="index.jsp?action=202<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">员工假期登记</a></li>
    </ul>
    <div class="navs">
	    <span class="one"><img src="img/leftrep.png"/></span>
	    <span class="ones">部门管理</span>
	</div>
    <ul style="display:none">
    	<li id=""><a class="nava" href="index.jsp?action=105&deptac=102<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">部门信息</a></li>
    	<li id=""><a class="nava" href="index.jsp?action=105-1<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">添加部门</a></li>
        <li><a class="nava" href="index.jsp?action=301<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">部门报表</a></li>
    </ul>
<%--    <div class="navs">--%>
<%--	    <span class="one"><img src="img/leftrep.png"/></span>--%>
<%--	    <span class="ones">岗位管理</span>--%>
<%--	</div>--%>
<%--    <ul style="display:none">--%>
<%--    	<li id=""><a class="nava" href="index.jsp?action=106&jobac=102<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">岗位信息</a></li>--%>
<%--        <li><a class="nava" href="index.jsp?action=301<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">部门报表</a></li>   --%>
<%--    </ul>--%>
    <div class="navs">
	    <span class="one"><img src="img/leftad.png"/></span>
	    <span class="ones">权限管理</span>
	</div>
    <ul style="display:none">
        <li><a class="nava" href="index.jsp?action=401<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">员工权限</a></li>
        <li><a class="nava" href="index.jsp?action=402<%if(session.getAttribute("sName")==null){%>&logerr=-2<%}else{}%>">修改权限</a></li>
    </ul>
</div>


			