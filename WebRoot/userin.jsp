<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
<%@page import="java.sql.DriverManager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			//统一流程

			String op = request.getParameter("op");
			System.out.print(op);
			if (op.equals("regedit")) {
				java.text.SimpleDateFormat form = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date curr = new java.util.Date();
				//rgeditUser.jsp<=>userinfo.jsp
				//处理数据
				//请求  
				//细节  中文
				String binglinum = request.getParameter("binglinum");
				String name = request.getParameter("name");
				//String usersex = request.getParameter("usersex");
				String ttime = form.format(curr);
				String yishengname = request.getParameter("yishengname");
				

				//jdbc
				String sql = "insert into bingli (binglinum,name,ttime,yishengname) values(?,?,?,?)";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1, binglinum);
					psmt.setString(2, name);
					psmt.setString(3, ttime);
					psmt.setString(4, yishengname);
					//执行
					//insert,update,delete 返回受影响的行数
					int count = psmt.executeUpdate();
					//流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun.jsp");

					} else {
						out.print("<script>alert('添加失败');</script>");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
					
			if (op.equals("delete")) {
				//获取删除用户name
				String name = request.getParameter("name");
				String sql = "delete from bingli where name=? ";
				try{
				  //jdbc
				  Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1,name);
				   int count=psmt.executeUpdate();
				   //流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun.jsp");

					} 
				}
				catch(Exception ex)
				{
				ex.printStackTrace();
				}

			}
			
			
			if(op.equals("update"))
			{
			    //保存修改之后的数据到数据库
			    //updateUser.jsp <=> userinfo.jsp
			    java.text.SimpleDateFormat form = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date curr = new java.util.Date();
			    String id=request.getParameter("id");
			    String binglinum=request.getParameter("binglinum");
			    String name=request.getParameter("name");
			    String ttime = form.format(curr);
			    String yishengname=request.getParameter("yishengname");
			    
			    String sql="update bingli set binglinum=?,name=?,ttime=?,yishengname=? where id=?";
			    //jdbc
			    
			    try{
				  //jdbc
				  Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1,binglinum);
					psmt.setString(2,name);
					psmt.setString(3,ttime);
					psmt.setString(4,yishengname);
					psmt.setString(5,id);
				   int count=psmt.executeUpdate();
				   //流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun.jsp");

					}
					else{
					   out.print("<script>alert('修改失败');</script>");
					} 
				}
				catch(Exception ex)
				{
				ex.printStackTrace();
				}
			    
			    
			}
			
			if (op.equals("shoushu")) {
				//rgeditUser.jsp<=>userinfo.jsp
				//处理数据
				//请求  
				//细节  中文
				String shoushunum = request.getParameter("shoushunum");
				String shoushuname = request.getParameter("shoushuname");
				String yishengname = request.getParameter("yishengname");
				String name = request.getParameter("name");
				String btime = request.getParameter("btime");
				String otime = request.getParameter("otime");
				//jdbc
				String sql = "insert into shoushu (shoushunum,shoushuname,yishengname,name,btime,otime) values(?,?,?,?,?,?)";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1, shoushunum);
					psmt.setString(2, shoushuname);
					psmt.setString(3, yishengname);
					psmt.setString(4,name);
					psmt.setString(5,btime);
					psmt.setString(6,otime);
					//执行
					//insert,update,delete 返回受影响的行数
					int count = psmt.executeUpdate();
					//流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun1.jsp");

					} else {
						out.print("<script>alert('添加失败');</script>");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(op.equals("updateshu"))
			{
			    //保存修改之后的数据到数据库
			    //updateUser.jsp <=> userinfo.jsp
			    String shoushunum=request.getParameter("shoushunum");
			    String shoushuname=request.getParameter("shoushuname");
			    String yishengname=request.getParameter("yishengname");
			    String name=request.getParameter("name");
			    String btime=request.getParameter("btime");
			    String otime=request.getParameter("otime"); 
			    
			    String sql="update shoushu set shoushuname=?,yishengname=?,name=?,btime=?,otime=? where shoushunum=?";
			    //jdbc
			    
			    try{
				  //jdbc
				  Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1,shoushuname);
					psmt.setString(2,yishengname);
					psmt.setString(3,name);
					psmt.setString(4,btime);
					psmt.setString(5,otime);
					psmt.setString(6,shoushunum);
				   int count=psmt.executeUpdate();
				   //流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun1.jsp");

					}
					else{
					   out.print("<script>alert('修改失败');</script>");
					} 
				}
				catch(Exception ex)
				{
				ex.printStackTrace();
				}
			    
			    
			}
			
			if (op.equals("yihu")) {
				//rgeditUser.jsp<=>userinfo.jsp
				//处理数据
				//请求  
				//细节  中文
				String yishengnum = request.getParameter("yishengnum");
				String yishengname = request.getParameter("yishengname");
				String sex = request.getParameter("sex");
				String keshi = request.getParameter("keshi");
				//jdbc
				String sql = "insert into doctor (yishengnum,yishengname,sex,keshi) values(?,?,?,?)";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1, yishengnum);
					psmt.setString(2, yishengname);
					psmt.setString(3,sex);
					psmt.setString(4,keshi);
					//执行
					//insert,update,delete 返回受影响的行数
					int count = psmt.executeUpdate();
					//流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun2.jsp");

					} else {
						out.print("<script>alert('添加失败');</script>");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(op.equals("updateyi"))
			{
			    //保存修改之后的数据到数据库
			    //updateUser.jsp <=> userinfo.jsp
			    String yishengnum=request.getParameter("yishengnum");
			    String yishengname=request.getParameter("yishengname");
			    String sex=request.getParameter("sex");
			    String keshi=request.getParameter("keshi");
			    
			    String sql="update doctor set yishengname=?,sex=?,keshi=? where yishengnum=?";
			    //jdbc
			    
			    try{
				  //jdbc
				  Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1,yishengname);
					psmt.setString(2,sex);
					psmt.setString(3,keshi);
					psmt.setString(4,yishengnum);
				   int count=psmt.executeUpdate();
				   //流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chaxun2.jsp");

					}
					else{
					   out.print("<script>alert('修改失败');</script>");
					} 
				}
				catch(Exception ex)
				{
				ex.printStackTrace();
				}
			    
			    
			}
		%>
  </body>
</html>
