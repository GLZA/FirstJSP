<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/staffrest.css">
<%@include file="../check/mysql.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String js1="var cop=prompt(\"请输入管理员密码\",\"\");";//##接收prompt弹窗输入的信息##
	String js2="var adpass=cop;";
	String dataadkey=null;
	sql = "select * from adkey";
	rs = statement.executeQuery(sql);
	while(rs.next())
	{
		dataadkey=rs.getString("adpass");
	}
	rs.close();
	statement.close();
%>
<%
	String name="";
	String dept="";
	String sex="";
	String idcard="";
	String rest="";
	String ph="";
	String id="";
	if(request.getParameter("restid")==null){}
	else
	{
		id=request.getParameter("restid");
		sql="select * from staffinfoall where staffid="+id;
		Statement stmt2 = conn.createStatement();
		ResultSet rs3= stmt2.executeQuery(sql);
		while(rs3.next())
		{
			name =	rs3.getString("staffname");
			dept =	rs3.getString("deptname");
			sex =	rs3.getString("staffsex");
			ph =	rs3.getString("staffph");
			rest =	rs3.getString("Mrest");
			idcard = rs3.getString("idcard");//将数据库内的数据传入几个Sring类型的变量
		}
		rs3.close();
		stmt2.close();
		conn.close();
	}
%>
<script type="text/JavaScript">
	function prom()
	{
		<%=js1%>
		<%=js2%>
		if(cop)
		{
			if(adpass==<%=dataadkey%>)
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
	function jump()
	{
		var id=document.getElementById("staffID").value;
		location.href="check/restsearch.jsp?staffID="+id;
	}
</script>
<div id="addstaffitem">
	<form id="add-form" action="check/restGOGO.jsp" onsubmit="return prom()" method="post">
		<div>
			<span>员工ID</span>
			<input type="text" size="10px" class="inputposi" id="staffID" value="${sessionScope.staffID}" name="staffID" autocomplete="off" required/>
			<input type="button" id="call" onclick="jump()" value="搜索"/>
		</div>
		<div>
			<span>员工姓名</span>
			<input type="text" size="10px" class="inputposi" id="staffname" name="staffname" disabled="disabled" value="<%=name%>" autocomplete="off" required/>
		</div>
		<div>
			<span>性别</span><input type="text" class="inputposi" name="" id="" value="<%=sex%>" disabled="disabled" required/>
		</div>
		<div>
			<span>手机号码</span><input type="text" class="inputposi" id="phnumber"name="phnumber" value="<%=ph%>" autocomplete="off" disabled="disabled" required/>
		</div>
		<div>
			<span>身份证号</span><input type="text" class="inputposi"name="idcardnum" id="idcardnum" value="<%=idcard%>" autocomplete="off" disabled="disabled" required/>
		</div>
		<div>
			<span>所属部门</span><input type="text"class="inputposi"name="deptname" id="" autocomplete="off" disabled="disabled" value="<%=dept%>" required/>
		</div>
		<div>
			<span>月休息天数</span><input type="text" class="inputposi" id="" name="Mrest" value="<%=rest%>" disabled="disabled" autocomplete="off" required/>
		</div>
		<div>
			<span id="warm">
				<%
					if(request.getParameter("resterr")==null)
					{
						out.print("<span style='color:#ffb0b0'></span>");
					}
					else
					{
						String sErr=request.getParameter("resterr");
						if(sErr.equals("-1"))
						{
							out.print("<span style='color:#53ff53'>##登记成功!##</span>");
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
			<input type="submit" id="submit"  value="登记"/>
		</div>
	</form>
</div>