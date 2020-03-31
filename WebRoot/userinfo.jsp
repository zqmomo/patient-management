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

		<title>My JSP 'userinfo.jsp' starting page</title>

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
			//java 语言
			//.jsp<=>java 类 细节
			//场景     get  ?
			//Login.jsp  <=>   userinfo.jsp?op=login
			//rgeditUser.jsp<=> userinfo.jsp?op=regedit
			//updateUser.jsp<=>userinfo.jsp?op=update
			//deleteUser.jsp<=>userinfo.jsp?op=delete

			//内置对象  不需要实例化,页面已经包含对象
			//请求 request
			//getParameter() 根据提交的表单的元素的名称获取元素的值value
			//响应 response
			//统一编号
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			//统一流程

			String op = request.getParameter("op");
			//细节 String 比较 
			if (op.equals("login")) {
				//完成login

				String username = request.getParameter("username");
				String userpwd = request.getParameter("userpwd");


				//测试  System.out.print(); 向控制输入信息
				// out.print () 向页面输入字符
				//out.print("用户名:"+username);
				/*jdbc*/
				String sql = "select * from yonghuxinxi where username=? and userpwd=?";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1, username);
					psmt.setString(2, userpwd);
					//insert update delete <=>executeUpdate
					//select  <=>executeQuery()
					ResultSet rs = psmt.executeQuery();
					boolean flag = false;
					while (rs.next()) {
						//有数据
						flag = true;
						break;//退出循环
					}
					//响应
					if (flag == true ) {
						//跳转到index.jsp
				        if(flag == true && !username.equals("zq")) {
						//跳转 到Login.jsp
						response.sendRedirect("yisheng.html");
					    }
				        else{
				        	response.sendRedirect("zhujiemian.html");
				        }
					}
					else{
						response.sendRedirect("index.html");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (op.equals("regedit")) {
				java.text.SimpleDateFormat form = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date curr = new java.util.Date();
				//rgeditUser.jsp<=>userinfo.jsp
				//处理数据
				//请求  
				//细节  中文
				String username = request.getParameter("user");
				String userpwd = request.getParameter("passwd");
				//String usersex = request.getParameter("usersex");
				String userstr = form.format(curr);
				String useremail = request.getParameter("e-mail");
				String usertel = request.getParameter("phone");
				

				//jdbc
				String sql = "insert into yonghuxinxi (username,userpwd,userstr,usertel,useremail) values(?,?,?,?,?)";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1, username);
					psmt.setString(2, userpwd);
					psmt.setString(3, userstr);
					psmt.setString(4, usertel);
					psmt.setString(5, useremail);
					//执行
					//insert,update,delete 返回受影响的行数
					int count = psmt.executeUpdate();
					//流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("chenggong.jsp");

					} else {
						response.sendRedirect("index.html");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if (op.equals("tianjia")) {
				java.text.SimpleDateFormat form = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date curr = new java.util.Date();
				//rgeditUser.jsp<=>userinfo.jsp
				//处理数据
				//请求  
				//细节  中文
				String username = request.getParameter("user");
				String userpwd = request.getParameter("passwd");
				//String usersex = request.getParameter("usersex");
				String userstr = form.format(curr);
				String useremail = request.getParameter("e-mail");
				String usertel = request.getParameter("phone");

				//jdbc
				String sql = "insert into yonghuxinxi (username,userpwd,userstr,usertel,useremail) values(?,?,?,?,?)";
				//异常 处理
				//java  try{ 存放可能出现异常的代码段} catatch(Exception ex){}
				//try{} catatch(){}fin...{关闭资源}

				try {

					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1, username);
					psmt.setString(2, userpwd);
					psmt.setString(3, userstr);
					psmt.setString(4, useremail);
					psmt.setString(5, usertel);
					//执行
					//insert,update,delete 返回受影响的行数
					int count = psmt.executeUpdate();
					//流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("index.jsp");

					} else {
						out.print("<script>alert('添加失败');</script>");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if (op.equals("delete")) {
				//获取删除用户id
				String userid = request.getParameter("userid");
				String sql = "delete from yonghuxinxi where userid=? ";
				try{
				  //jdbc
				  Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1,userid);
				   int count=psmt.executeUpdate();
				   //流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("index.jsp");

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
			    String username=request.getParameter("username");
			    String userpwd=request.getParameter("userpwd");
			    String userid=request.getParameter("userid");
			    
			    String sql="update yonghuxinxi set username=?,userpwd=? where userid=?";
			    //jdbc
			    
			    try{
				  //jdbc
				  Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
							"root", "123");
					PreparedStatement psmt = con.prepareStatement(sql);
					psmt.setString(1,username);
					psmt.setString(2,userpwd);
					psmt.setString(3,userid);
				   int count=psmt.executeUpdate();
				   //流程
					//响应 response
					if (count > 0) {
						response.sendRedirect("index.jsp");

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
