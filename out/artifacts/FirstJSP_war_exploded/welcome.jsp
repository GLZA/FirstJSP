<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/welcome.css">
<div id="wel">
	<div id="welmain">
		<div id="welhead">
			<span>登陆成功</span>
		</div>
		<%@include file="xiu.jsp" %>
		<div id="welinput">
			<span id="secscop">
				系统将在 
				<span id="secs">4</span>
				秒钟后跳转至主页,如果未能跳转,
				<a href="index.jsp" title="点击访问">请点击</a>.
			</span>
		</div>
		<script type="text/javascript">
			delayURL();
			function delayURL()
			{
				var delay = document.getElementById("secs").innerHTML;
				var t = setTimeout("delayURL()", 1000);
				if(delay>0)
				{
					delay--;
					document.getElementById("secs").innerHTML = delay;
				}
				else
				{
					clearTimeout(t);
					window.location.href = "index.jsp";
				}
			}
		</script>
	</div>
</div>