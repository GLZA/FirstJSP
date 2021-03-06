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
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("id"));
	//↓将获取的id所对应的表输入至表单中
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
				   url="jdbc:mysql://kaiyu.work:3306/FristJSP?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false"
				   user="root"  password="LYY&css1314"/>
<sql:query dataSource="${snapshot}" var="result">
	SELECT * from deptinfo where deptid=<%=id%>;
</sql:query>
<div id="addstaffitem">
	<form id="add-form" action="deptad/deptcheck/DBdel.jsp?deleid=<%=id%>" onsubmit="return prom()" method="post"><!--提交表单时调用prom弹窗函数-->
		<c:forEach var="row" items="${result.rows}">
		<div>
			<span>部门ID</span>
			<input type="text" size="10px" class="inputposi" value="${row.deptid}"  id="deptid" name="deptid"  disabled="disabled" autocomplete="off" required/>
		</div>
		<div>
			<span>部门名</span><input type="text" class="inputposi" value="${row.deptname}" id="deptname"name="deptname"  disabled="disabled" autocomplete="off" required/>
		</div>
		<div>
			<span>部门经理</span><input type="text" class="inputposi" value="${row.deptman}" name="deptman" id="deptman"  disabled="disabled" autocomplete="off" required/>
		</div>
		<div>
			<span>部门地址</span><input type="text"class="inputposi" value="${row.deptadd}" name="address" id="" disabled="disabled" autocomplete="off" required/>
		</div>
		<div>
			<span>部门人数</span><input type="text"class="inputposi" value="${row.deptnum}" name="deptnum" id="" disabled="disabled" required/>
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
							out.print("<span style='color:#53ff53'>##删除成功!##</span>");
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
			<input type="submit" id="submit"  value="删除"/>
		</div>
		</c:forEach>
	</form>
</div>