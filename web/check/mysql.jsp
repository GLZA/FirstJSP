<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
	String driver = "com.mysql.jdbc.Driver";
// URL指向要访问的数据库名
	String url = "jdbc:mysql://kaiyu.work:3306/FristJSP?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false";
// MySQL配置时的用户名
	String user ="root";
// Java连接MySQL配置时的密码
	String password ="LYY&css1314";
// 1 加载驱动程序
	Class.forName(driver);
// 2 连接数据库
	Connection conn= DriverManager.getConnection(url, user, password);
// 3 用来执行SQL语句
	Statement statement = conn.createStatement();
	PreparedStatement pstmt = null;
// 要执行的SQL语句
	String sql =null;
	ResultSet rs =null;
%>

