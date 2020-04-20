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
	function check(inputID,num)//判断员工信息是否填写正确并将错误信息写入id为warm的span标签
	{
		var uValue = document.getElementById(inputID).value;
		var span = document.getElementById('warm');
		switch(num)
		{
			case 1 :if(uValue.length!=3)
					{
						span.innerHTML = "<font color='#ffb0b0' >部门ID为3位数！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 2 :if(uValue.length<2)
					{
						span.innerHTML = "<font color='#ffb0b0'>部门名不小于2！</font>";
						return false;
					}
					else
					{
						span.innerHTML = "";
						return true;
					};break;
			case 3 :if(uValue.length<2)
					{
						span.innerHTML = "<font color='#ffb0b0'>经理姓名不正确！</font>";
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
	<form id="add-form" action="deptad/deptcheck/DBadd.jsp" onsubmit="return prom()" method="post"><!--提交表单时调用prom弹窗函数-->
		<div>
			<span>部门ID</span>
			<input type="text" size="10px" class="inputposi" id="deptid" name="deptid" onblur="check('deptid',1)" autocomplete="off" required/>
		</div>
		<div>
			<span>部门名</span><input type="text" class="inputposi" id="deptname"name="deptname" onblur="check('deptname',2)" autocomplete="off" required/>
		</div>
		<div>
			<span>部门经理</span><input type="text" class="inputposi"name="deptman" id="deptman" onblur="check('deptman',3)" autocomplete="off" required/>
		</div>
		<div>
			<span>部门地址</span><input type="text"class="inputposi"name="address" id="" autocomplete="off" required/>
		</div>
		<div>
			<span>部门人数</span><input type="text"class="inputposi"name="deptnum" id="" required/>
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
							out.print("<span style='color:#ffb0b0'>部门ID已存在！</span>");
						}
						else if(sErr.equals("-2"))
						{
							out.print("<span style='color:#ffb0b0'>部门名已存在！</span>");
						}
						else if(sErr.equals("-3"))
						{
							out.print("<span style='color:#53ff53'>##添加成功!##</span>");
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
			<input type="submit" id="submit"  value="添加"/>
			<input type="reset" id="reset" value="重置"/>
		</div>
	</form>
</div>