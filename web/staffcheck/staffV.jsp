<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/staffinfo.css">
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
				   url="jdbc:mysql://kaiyu.work:3306/FristJSP?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false"
				   user="root"  password="LYY&css1314"/>
<script type="text/javascript">
	document.onreadystatechange = function () {//当页面加载成功时
    if(document.readyState==="complete")
    { //当页面加载状态为完全结束时进入
    	var buff = document.getElementsByClassName("buffview");//状态视图
    	var i=0;
    	for(i=0;i<=buff.length;i++)
    	{
    		if(buff[i].value==0)//状态为0为红色，未出勤
    		{
    			buff[i].style.color='#ff5555';
    			buff[i].style.backgroundColor='#ff5555';
    		}
    		else if(buff[i].value==1)//状态为1为绿色，出勤
    		{
    			buff[i].style.color='#4fff4f';
    			buff[i].style.backgroundColor='#4fff4f';
    		}
    		else if(buff[i].value==2)//状态为2为橙色，请假
    		{
    			buff[i].style.color='#ff9326';
    			buff[i].style.backgroundColor='#ff9326';
    		}
    	}
    	<%if(request.getParameter("bufferr")==null)
		{
			
		}
		else
		{
			String alert=request.getParameter("bufferr");
			if(alert.equals("-99"))
			{
			%>
				alert("##错误##");
			<%
			}
		}
    	%>
    }
}
</script>
<%
	request.setCharacterEncoding("UTF-8");
	int iAction =Integer.parseInt(request.getParameter("staffac"));//查询代码
	switch(iAction)
	{
		case 102:
				String Type = null,Key = null;
				if(request.getParameter("Type")!=null)
				{
					Type = request.getParameter("Type");
					Key = request.getParameter("Key");
				}
				if(Key==null||Key.equals(""))
				{
					//利用关键字来约束查询的表单
					session.removeAttribute("Type");
					session.removeAttribute("Key");%>
					<sql:query dataSource="${snapshot}" var="result">
						SELECT * from staffinfoall;
					</sql:query>
				<%} 
				else
				{
					session.setAttribute("Type",Type);
					session.setAttribute("Key",Key);%>
					<sql:query dataSource="${snapshot}" var="result">
						SELECT * from staffinfoall where <%=Type%> like '%<%=Key%>%';
					</sql:query>
				<%}break;
		case 109: 
			
				  break;
		case 103: break;
		case 104: break;
		case 201: break;
		case 301: break;
		case 401: break;
		default:out.println("操作代码错误！iAction="+iAction);
	}
%>
<div id="staffinfo">
	<div id="search">
		<span id="infotitle">员工考勤表</span>
		<form action="?action=201&staffac=102" method="post">
			<ul>
				<li id="searchkey">关键字:&nbsp<input name="Key" type="text" autocomplete="OFF" value="${sessionScope.Key}"/></li>
				<li id="searchselect">&nbsp
					<select name="Type" id="select">
						<option value="staffid" <% if(session.getAttribute("Type")=="staffid"){%>selected="selected"<%}%>>
							员工ID
						</option>
						<option value="staffname" <% if(session.getAttribute("Type")=="staffname"){%>selected="selected"<%}%>>
							员工姓名		
						</option>
						<option value="staffsex" <% if(session.getAttribute("Type")=="staffsex"){%>selected="selected"<%}%>>
							员工性别
						</option>
						<option value="staffph" <% if(session.getAttribute("Type")=="staffph"){%>selected="selected"<%}%>>
							手机号码		
						</option>
						<option value="deptname" <% if(session.getAttribute("Type")=="deptname"){%>selected="selected"<%}%>>
							所属部门
						</option>
						<option value="staffentry" <% if(session.getAttribute("Type")=="staffentry"){%>selected="selected"<%}%>>
							入职日期		
						</option>
						<option value="nativeplace" <% if(session.getAttribute("Type")=="nativeplace"){%>selected="selected"<%}%>>
							籍贯
						</option>
						<option value="Mrest" <% if(session.getAttribute("Type")=="Mrest"){%>selected="selected"<%}%>>
							月休息天数		
						</option>
						<option value="salary" <% if(session.getAttribute("Type")=="salary"){%>selected="selected"<%}%>>
							基本薪资		
						</option>
					</select>
				</li>
				<li id="">&nbsp&nbsp<input type="submit" id="insearch" value="搜索" /></li>
			</ul>
		</form>
	</div>
	<div id="scrollbar">
		<div id="tableposi">
		    <table width="1000" id="table" align="center" cellpadding="4" cellspacing="1" >
				<tr>
					<th>状态</th>
					<th>员工ID</th>
					<th>员工姓名</th>
					<th>员工性别</th>
					<th>手机号码</th>
					<th>所属部门</th>
					<th>入职日期</th>
					<th>籍贯</th>
					<th>月休息天数</th>
					<th>基本薪资</th>
				</tr>
				<c:forEach var="row" items="${result.rows}"><!--用JSTL调用数据源，迭代输出数据-->
					<tr>
					   <td><input type="password" class="buffview" value="<c:out value="${row.staffbuff}"/>" readonly="ture"/></td>
					   <td><c:out value="${row.staffid}"/></td>
					   <td><c:out value="${row.staffname}"/></td>
					   <td><c:out value="${row.staffsex}"/></td>
					   <td><c:out value="${row.staffph}"/></td>
					   <td><c:out value="${row.deptname}"/></td>
					   <td><c:out value="${row.staffentry}"/></td>
					   <td><c:out value="${row.nativeplace}"/></td>
					   <td><c:out value="${row.Mrest}"/></td>
					   <td><c:out value="${row.salary}"/></td>
					   <td>
					   		<a href="check/Attendance.jsp?buff=1&buffid=<c:out value="${row.staffid}"/>"><img src="img/V.png" title="出勤"/></a>
					   		&nbsp<!-- ${row.staffid}返还赋予修改的ID-->
					   		<a href="check/Attendance.jsp?buff=0&buffid=<c:out value="${row.staffid}"/>"><img src="img/X.png" title="未到"/></a>
					   </td> 
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>