<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/addstaff.css">
<%@include file="../check/mysql.jsp" %>
<%
	String js1="var cop=prompt(\"请输入管理员密码\",\"\");";//利用prompt弹窗接收弹窗中输入的管理员密码
	String js2="var adpass=cop;";
	String dataadkey=null;
	sql = "select * from adkey";
	rs = statement.executeQuery(sql);
	while(rs.next())
	{
		dataadkey=rs.getString("adpass");//将数据库中管理员的密码赋于
	}
	rs.close();
	statement.close();
	conn.close();//关闭连接
%>
<script type="text/JavaScript">
	function showTips(spanID,msg)
	{
		var span = document.getElementById(spanID);
		span.innerHTML = msg;
	}
	function check(inputID,num)//判断员工信息是否填写正确并将错误信息写入id为warm的span标签
	{
		var uValue = document.getElementById(inputID).value;
		var span = document.getElementById('warm');
		switch(num)
		{
			case 1 :if(uValue.length<2)
					{
						span.innerHTML = "<font color='#ffb0b0' >员工姓名长度不能小于2！</font>";
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
		}
	}
	function checkdata(num)
	{
		var span = document.getElementById('warm');
		switch(num)
		{
			case 1 :if(document.getElementById("staffname").value.length<2)
					{
						span.innerHTML = "<font color='#ffb0b0' >员工信息有误！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 2 :if(document.getElementById("phnumber").value.length<11)
					{
						span.innerHTML = "<font color='#ffb0b0'>员工信息有误！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 3 :if(document.getElementById("idcardnum").value.length!=18)
					{
						span.innerHTML = "<font color='#ffb0b0'>员工信息有误！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
		}
	}
	function prom()
	{
		<%=js1%>
		<%=js2%>
		if(cop)
		{
			if(adpass==<%=dataadkey%>)//匹对数据库中管理员的密码
			{
				return true;
			}
			else
			{
				alert("密码错误！");
				return false;
			}       
		}
		else
		{  
			alert("不能为空！");
			return false;
		}
	}
</script>
<div id="addstaffitem">
	<form id="add-form" action="check/ADDGOGO.jsp" onsubmit="return prom()" method="post"><!--提交表单时调用prom弹窗函数-->
		<div>
			<span>员工姓名</span>
			<input type="text" size="10px" class="inputposi" id="staffname" name="staffname"onblur="check('staffname',1)" autocomplete="off" required/>
		</div>
		<div>
			<span>性别</span>
			<input type="radio" class="checkbox1"name="staffsex" id="" value="男" required/>
			<a id="text1">男</a>
			<input type="radio" class="checkbox2" name="staffsex" id="" value="女" required/>
			<a id="text2">女</a>
		</div>
		<div>
			<span>手机号码</span><input type="text" class="inputposi" id="phnumber"name="phnumber" onblur="check('phnumber',2)" autocomplete="off" required/>
		</div>
		<div>
			<span>身份证号</span><input type="text" class="inputposi"name="idcardnum" id="idcardnum" onblur="check('idcardnum',3)" autocomplete="off" required/>
		</div>
		<div>
			<span>所属部门</span><input type="text"class="inputposi"name="deptname" id="" autocomplete="off" required/>
		</div>
		<div>
			<span>出生日期</span><input type="date"class="inputposi"name="staffborn" id="" required/>
		</div>
		<div>
			<span>入职日期</span><input type="date" class="inputposi" name="staffentry" id="" required/>
		</div>
		<div>
			<span>户籍所在地</span><input type="text" class="inputposi" name="nativeplace"  id="" autocomplete="off" required/>
		</div>
		<div>
			<span>现居住地</span><input type="text" class="inputposi" id=""  name="residence" autocomplete="off" required/>
		</div>
		<div>
			<span>详细地址</span><input type="text" class="inputposi" id="" name="address" autocomplete="off" required/>
		</div>
		<div>
			<span>月休息天数</span><input type="text" class="inputposi" id="" name="Mrest" autocomplete="off" required/>
		</div>
		<div>
			<span>基本薪资</span><input type="text" class="inputposi" id="" name="salary" autocomplete="off" required/>
		</div>
		<div>
			<span id="warm">
				<%
					if(request.getParameter("err")==null)//若err为空不做任何事
					{
						out.print("<span style='color:#ffb0b0'></span>");
					}
					else//否则
					{
						String sErr=request.getParameter("err");
						if(sErr.equals("-1"))//将对应获取的错误信息进行，错误提示
						{
							out.print("<span style='color:#ffb0b0'>此手机号已存在！</span>");
						}
						else if(sErr.equals("-2"))
						{
							out.print("<span style='color:#ffb0b0'>此身份证已被录入！</span>");
						}
						else if(sErr.equals("-3"))
						{
							out.print("<span style='color:#53ff53'>##录入成功!##</span>");
						}
						else
						{
								out.print("<span style='color:#ffb0b0'>未知错误</span>");
						}
					}
				%>
			</span>
		</div>
		<div id="buttom">
			<input type="submit" id="submit"  value="录入"/>
			<input type="reset" id="reset" value="重置"/>
		</div>
	</form>
</div>