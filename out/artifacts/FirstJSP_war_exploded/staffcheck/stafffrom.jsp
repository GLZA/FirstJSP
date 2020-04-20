<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/stafffrom.css">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/Chart.bundle.js"></script>
<%@include file="../check/mysql.jsp" %>
<%
	
	//select count(*) from staffinfoall where deptname = '人事部';
	//select count(*) from staffinfoall where deptname = '财务部';
	//select count(*) from staffinfoall where deptname = '后勤部';
	//select count(*) from staffinfoall where deptname = '行政部';
	//select deptname from staffinfoall group by deptname;
	sql="select deptname from deptinfo;";
	rs=statement.executeQuery(sql);
	String dept[] = new String[4];//将部门类型传给一个String数组
	
	int countrs[]={0,0,0,0};
	for(int i = 0;rs.next();i++)//循环，并将各个部门的人数传给一个int数组
	{
		dept[i]=rs.getString(1);
	}
	sql="select deptnum from deptinfo where deptname = '"+dept[0]+"';";
	rs = statement.executeQuery(sql);
	for(int i = 0;rs.next();i++)
	{
		countrs[0]=rs.getInt(1);
	}
	sql="select deptnum from deptinfo where deptname = '"+dept[1]+"';";
	rs = statement.executeQuery(sql);
	for(int i = 0;rs.next();i++)
	{
		countrs[1]=rs.getInt(1);
	}
	sql="select deptnum from deptinfo where deptname = '"+dept[2]+"';";
	rs = statement.executeQuery(sql);
	for(int i = 0;rs.next();i++)
	{
		countrs[2]=rs.getInt(1);
	}
	sql="select deptnum from deptinfo where deptname = '"+dept[3]+"';";
	rs = statement.executeQuery(sql);
	for(int i = 0;rs.next();i++)
	{
		countrs[3]=rs.getInt(1);
	}
	
%>
<canvas id="myChart"><!--创建画布，运用chart.js插件-->
	
</canvas>
<script type="text/javascript">
	var ctx = document.getElementById("myChart");
	var myChart =//
	new Chart(ctx,{
    	type:'bar',
    	data:
    		{
        		labels: ["<%=dept[0]%>", "<%=dept[1]%>", "<%=dept[2]%>", "<%=dept[3]%>"],
        		//String数组内的部门名字dept[0~3]
				datasets: 
				[{
					label:'部门报表(人数)',
					data: [<%=countrs[0]%>,<%=countrs[1]%>,<%=countrs[2]%>,<%=countrs[3]%>],
					//int数组内的部门人数countrs[0~3]
					backgroundColor:
					[
	                	'rgba(255, 99, 132, 0.2)',
	                	'rgba(255,255,0, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						
	            	],
					borderColor:
					[
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                
	            	],
	            	borderWidth:1.5
				}]
			},
		options:
		{
			scales:
			{
            	yAxes: 
            	[{
	                ticks:
					{
	                    beginAtZero:true
	                }
            	}]
			}
		}
	});
	
</script>
