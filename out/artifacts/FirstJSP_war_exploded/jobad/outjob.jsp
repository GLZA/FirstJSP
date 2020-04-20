<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/editstaff.css">
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("id"));
	
%>
<%@ include file="../check/mysql.jsp" %>
<%
	String js1="var cop=prompt(\"请输入管理员密码\",\"\");";//同增加员工页面一样
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
	conn.close();
%>
<script type="text/javascript">
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
</script>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
				   url="jdbc:mysql://kaiyu.work:3306/FristJSP?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false"
				   user="root"  password="LYY&css1314"/>
<sql:query dataSource="${snapshot}" var="result">
	SELECT * from staffinfoall where staffid=<%=id%>;
</sql:query>
<div id="editstaffitem">
	<form id="edit-form" action="check/deleteGOGO.jsp?deleid=<%=id%>" onsubmit="return prom()" method="post"><!--提交表单时调用prom弹窗函数-->
		<c:forEach var="row" items="${result.rows}">
		<div>
			<span>员工姓名</span>
			<input type="text" size="10px" class="inputposi" id="staffname" name="staffname"onblur="check('staffname',1)" autocomplete="off" disabled="disabled" value="${row.staffname}" required/>
		</div>
		<div>
			<span>性别</span><input type="text" class="inputposi" name="" id="" value="${row.staffsex}" disabled="disabled" required/>
		</div>
		<div>
			<span>手机号码</span><input type="text" class="inputposi" id="phnumber"name="phnumber" onblur="check('phnumber',2)" autocomplete="off" disabled="disabled" value="${row.staffph}" required/>
		</div>
		<div>
			<span>身份证号</span><input type="text" class="inputposi"name="idcardnum" id="idcardnum" onblur="check('idcardnum',3)" autocomplete="off" disabled="disabled" value="${row.idcard}" required/>
		</div>
		<div>
			<span>所属部门</span><input type="text"class="inputposi"name="deptname" id="" autocomplete="off" value="${row.deptname}" disabled="disabled" required/>
		</div>
		<div>
			<span>入职日期</span><input type="date" class="inputposi" name="staffentry" id="" disabled="disabled" value="${row.staffentry}" disabled="disabled" required/>
		</div>
		<div>
			<span>户籍所在地</span><input type="text" class="inputposi" name="nativeplace"  id="" value="${row.nativeplace}" disabled="disabled" required/>
		</div>
		<div>
			<span>月休息天数</span><input type="text" class="inputposi" id="" name="Mrest" autocomplete="off" value="${row.Mrest}" disabled="disabled" required/>
		</div>
		<div>
			<span>基本薪资</span><input type="text" class="inputposi" id="" name="salary" autocomplete="off" value="${row.salary}" disabled="disabled" required/>
		</div>
		<div>
			<span id="warm">
				<%
					if(request.getParameter("deleerr")==null)
					{
						out.print("<span style='color:#ffb0b0'></span>");
					}
					else
					{
						String sErr=request.getParameter("deleerr");
						if(sErr.equals("-1"))
						{
							out.print("<span style='color:#ffb0b0'>删除失败！</span>");
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