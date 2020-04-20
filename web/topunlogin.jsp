<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/top.css">
<script type="text/JavaScript">
	function touch(spID,msg)
	{
		var span = document.getElementById(spID);
		switch(msg)
		{
			case 404:span.innerHTML ="<font color='#fbffff' >未登录</font>";break;
			case 2:span.innerHTML ="<font color='#fbffff' >系统首页</font>";break;
			case 3:span.innerHTML ="<font color='#fbffff' >信息</font>";break;
			case 4:span.innerHTML ="<font color='#fbffff' >个人设置</font>";break;
			case 5:span.innerHTML ="<font color='#fbffff' >退出</font>";break;
		}
	}
	function out(spID,msg)
	{
		var span = document.getElementById(spID);
		switch(msg)
		{
			case 404:span.innerHTML ="";break;
			case 2:span.innerHTML ="";break;
			case 3:span.innerHTML ="";break;
			case 4:span.innerHTML ="";break;
			case 5:span.innerHTML ="";break;
		}
	}
</script>
<div id="top">
  	<div id="logo">
  		<img src="img/LOGO.png">
  		<span>
  			凯宇人事后台管理
  		</span>
  	</div>
  	<div id="set">
  		<ul>
  			<li><img src="img/baa.png"></li>
  			
  			<li class="bar">
  				<%
					if(session.getAttribute("sName")==null)
					{%>
						<a href="index.jsp?action=512" onmouseover="touch('indexuser',404)" onmouseout="out('indexuser',404)"><img src="img/a.png">
  						<span id="indexuser">
					<%}%>
  				</span></a>
  			</li>
  			
  			<li><img src="img/baa.png"></li>
  			
  			<li class="bar">
  				<a href="index.jsp?action=512" onmouseover="touch('indexhome',2)" onmouseout="out('indexhome',2)"><img src="img/b.png"><span id="indexhome"></span></a>
  			</li>
  			
  			<li><img src="img/baa.png"></li>
  			
  			<li class="bar">
  				<a href="index.jsp" onmouseover="touch('indexmsg',3)" onmouseout="out('indexmsg',2)"><img src="img/c.png"><span id="indexmsg"></span></a>
  			</li>
  			
  			<li><img src="img/baa.png"></li>
  			
  			<li class="bar">
  				<a href="index.jsp" onmouseover="touch('indexset',4)" onmouseout="out('indexset',2)"><img src="img/d.png"><span id="indexset"></span></a>
  			</li>
  			
  			<li><img src="img/baa.png"></li>
  			
  			<li class="bar">
  				<a href="check/quit.jsp" onmouseover="touch('indexquit',5)" onmouseout="out('indexquit',2)"><img src="img/e.png"><span id="indexquit"></span></a>
  			</li>
  		</ul>
  	</div>
</div>
			