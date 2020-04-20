<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/adreg.css">
<script type="text/JavaScript">
	function showTips(spanID,msg)
	{
		var span = document.getElementById(spanID);
		span.innerHTML = msg;
	}
	function check(inputID,num)
	{
		var uValue = document.getElementById(inputID).value;
		var span = document.getElementById('warm');
		switch(num)
		{
			case 1 :if(uValue.length<3)
					{
						span.innerHTML = "<font color='#ffb0b0' >用户名长度不能小于3！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 2 :if(uValue.length<11)
					{
						span.innerHTML = "<font color='#ffb0b0'>手机号码不能小于11！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 3 :if(uValue.length!=18)
					{
						span.innerHTML = "<font color='#ffb0b0'>身份证格式不对！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 4 :if(uValue.length<6)
					{
						span.innerHTML = "<font color='#ffb0b0'>密码长度小于6!</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
		}
	}
	function checkdata(num)
	{
		var span = document.getElementById('warm');
		switch(num)
		{
			case 1 :if(document.getElementById("staffname").value.length<3)
					{
						span.innerHTML = "<font color='#ffb0b0' >用户名名长度不能小于3！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 2 :if(document.getElementById("phnumber").value.length<11)
					{
						span.innerHTML = "<font color='#ffb0b0'>手机号码不能小于11！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 3 :if(document.getElementById("idcardnum").value.length!=18)
					{
						span.innerHTML = "<font color='#ffb0b0'>身份证格式不对！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 4 :if(document.getElementById("idcardnum").value.length<6)
					{
						span.innerHTML = "<font color='#ffb0b0'>密码长度小于6!</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
		}
	}
</script>
<div id="addstaffitem">
	<form id="add-form" action="check/REGGOGO.jsp"  method="post">
		<div>
			<span>用户名</span>
			<input type="text" size="10px" class="inputposi" id="Username" name="Username"onblur="check('Username',1)" autocomplete="off" required/>
		</div>
		<div>
			<span>密码</span>
			<input type="password" class="inputposi" id="Password"name="Password" onblur="check('Password',4)" autocomplete="off" required/>
		</div>
		<div>
			<span>手机号码</span>
			<input type="text" class="inputposi" id="phnumber" name="phnumber" onblur="check('phnumber',2)" autocomplete="off" required/>
		</div>
		<div>
			<span>身份证号</span>
			<input type="text" class="inputposi" id="idcardnum"name="idcardnum" onblur="check('idcardnum',3)" autocomplete="off" required/>
		</div>
		<div>
			<span>性别</span>
			<input type="radio" class="checkbox1"name="usersex" id="" value="男" required/>
			<a id="text1">男</a>
			<input type="radio" class="checkbox2" name="usersex" id="" value="女" required/>
			<a id="text2">女</a>
		</div>
		<div>
			<span>出生日期</span><input type="date"class="inputposi" name="borndate" id="" required/>
		</div>
		<div>
			<span>管理员权限密码</span><input type="password"class="inputposi" name="adkey" id="" required/>
		</div>
		<div>
			<span id="warm">
				<%
						if(request.getParameter("err")==null)
						{
							out.print("<span style='color:#ffb0b0'></span>");
						}
						else
						{
							String sErr=request.getParameter("regerr");
							if(sErr.equals("-1"))
							{
								out.print("<span style='color:#ffb0b0'>用户名已被注册！</span>");
							}
							else if(sErr.equals("-2"))
							{
								out.print("<span style='color:#ffb0b0'>用户身份证相同！</span>");
							}
							else if(sErr.equals("-3"))
							{
								out.print("<span style='color:#ffb0b0'>管理员密码错误!</span>");
							}
							else
							{
								out.print("<span style='color:#ffb0b0'>其他问题</span>");
							}
						}
					%>
			</span>
		</div>
		<div id="buttom">
			<input type="submit" id="submit"  value="注册"/>
			<input type="reset" id="reset" value="重置"/>
		</div>
	</form>
</div>