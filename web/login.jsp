<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/JavaScript">
	function checkData()
	{
		var userid = document.getElementById("loginuser");  
   		var t = userid.value;  
    	var textValue = t.replace(/(^\s*)|(\s*$)/g, "");   
		// 替换输入内容当中所有的空字符
		if(textValue==null || textValue=="") 
		{
			alert("用户ID不能为空!");
			SetTimeout(function()
			       		{
			       			document.getElementById('loginuser').focus();
			       		},0)
			return false;
	    }
		var passwd = document.getElementById("loginpass");  
   		var t = passwd.value;  
    	var textValue = t.replace(/(^\s*)|(\s*$)/g, "");   
		if(textValue==null || textValue=="") 
		{
		    alert("用户密码不能为空!");  
		    setTimeout(function()
			       		{
			       			document.getElementById('loginpass').focus();
			       		},0)
		     return false;
	    }
			return true;
				
	}
	function jump()
	{
		location.href="index.jsp?action=224";
	}
			
		</script>
<div id="login">
	<div id="loginmain">
		<div id="loginhead">
			<span>Sign In</span>
		</div>
		<div id="logininput">
			<form action="check/logincheck.jsp" id="" method="post">
				<div id="loginuserdiv">
					<span id="ui">userID</span>
					<input name="UserId" id="loginuser" type="text"autocomplete="off"/>
				</div>
				<div id="loginpassdiv">
					<span id="ps">password</span>
					<input name="PassWd" id="loginpass" type="password" autocomplete="off"/>
				</div>
				<span id="warm">
					<%
						if(request.getParameter("logerr")==null)
						{
							out.print("<span style='color:#ffb0b0'></span>");
						}
						else
						{
							String sErr=request.getParameter("logerr");
							if(sErr.equals("-1"))
							{
								out.print("<span style='color:#ffb0b0'>用户身份验证不通过！</span>");
							}
							else if(sErr.equals("-2"))
							{
								out.print("<span style='color:#ffb0b0'>请先登录！</span>");
							}
							else if(sErr.equals("-3"))
							{
								out.print("<span style='color:#53ff53'>注册成功！请登录~</span>");
							}
							else
							{
								out.print("<span style='color:#ffb0b0'>其他问题</span>");
							}
						}
					%>
				</span>
				<div id="loginbottom">
					<input type="submit" id="loginsubmit" value="Sign in" onclick="checkData(1)"/>
					<input type="button" id="reggoing" value="Reg" onclick="jump()"/>
					<a href=#" id="forget">forget your password?</a>
				</div>
			</form>
		</div>
	</div>
</div>