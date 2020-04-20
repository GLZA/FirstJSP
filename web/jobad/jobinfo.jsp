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
<%
	request.setCharacterEncoding("UTF-8");
	int iAction=0;
	if(request.getParameter("deptac")==null){}
	else
	{
		iAction =Integer.parseInt(request.getParameter("deptac"));
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
						session.removeAttribute("Type");
						session.removeAttribute("Key");
						%>
							<sql:query dataSource="${snapshot}" var="result">
								SELECT * from deptinfo;
							</sql:query>
						<%} 
					else
					{
						session.setAttribute("Type",Type);
						session.setAttribute("Key",Key);
						%>
							<sql:query dataSource="${snapshot}" var="result">
								SELECT * from deptinfo where <%=Type%> like '%<%=Key%>%';
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
	}
%>
<div id="staffinfo">
	<div id="search">
		<span id="infotitle">部门信息表</span>
		<form action="?action=105&deptac=102" method="post">
			<ul>
				<li id="searchkey">关键字:&nbsp<input name="Key" type="text" autocomplete="OFF" value="${sessionScope.Key}"/></li>
				<li id="searchselect">&nbsp														<!--接受session关键字Key-->
					<select name="Type" id="select">
						<option value="deptid" <% if(session.getAttribute("Type")=="deptid"){%>selected="selected"<%}%>>
							部门ID
						</option>
						<option value="deptname" <% if(session.getAttribute("Type")=="deptname"){%>selected="selected"<%}%>>
							部门名		
						</option>
						<option value="deptman" <% if(session.getAttribute("Type")=="deptman"){%>selected="selected"<%}%>>
							部门经理		
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
					<th>部门ID</th>
					<th>部门名</th>
					<th>部门经理</th>
					<th>部门地址</th>
					<th>部门人数</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
					   <td><c:out value="${row.deptid}"/></td>
					   <td><c:out value="${row.deptname}"/></td>
					   <td><c:out value="${row.deptman}"/></td>
					   <td><c:out value="${row.deptadd}"/></td>
					   <td><c:out value="${row.deptnum}"/></td>
					   <td>
					   		<a href="index.jsp?action=105-1&id=<c:out value="${row.deptid}"/>"/><img src="img/recordedit.gif" title="修改"/></a>
					   		&nbsp		<!-- ${row.staffid}返还赋予修改的ID-->
					   		<a href="index.jsp?action=105-2&id=<c:out value="${row.deptid}"/>"/><img src="img/recorddelete.gif" title="删除"/></a>
					   </td> 
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>