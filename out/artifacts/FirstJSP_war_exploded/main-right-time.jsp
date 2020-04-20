<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" type="text/css" href="css/item.css">
<script src="js/time.js" type="text/javascript"></script>
<jsp:useBean id="date" class="item.DateTimeBean"></jsp:useBean>

<div id="toptime">
	<span id="showtime">

	</span>	
	<span id="showweek">
		<jsp:getProperty property="week" name="date"/>
	</span>	
</div>
			