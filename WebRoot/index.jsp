<%@ page language="java"
	import="java.util.*,java.sql.*,com.bean.Userinfo" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户信息查询</title>
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
		<p align="center">
			用户信息
		</p>

		<table border="1" align="center" width="800px">

			<tr>
			    <td>
			                    用户编号
			    </td>
				<td>
					用户名
				</td>
				<td>
					注册时间
				</td>
				<td>
				     用户手机号
				</td>
				<td>
				   用户邮箱
				</td>
			</tr>
			<%
    String sql="select * from yonghuxinxi";
  try
  {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
				"root", "123");
		PreparedStatement psmt = con.prepareStatement(sql);
     //insert update delete <=>executeUpdate
     //select  <=>executeQuery()
    ResultSet rs=psmt.executeQuery();
    boolean flag=false;
    ArrayList<Userinfo> userList=new ArrayList<Userinfo>();
    while(rs.next())
    {
       Userinfo u=new Userinfo();
       
       //一行一行读取对象状态
       
       u.setUseremail(rs.getString("useremail"));
       u.setUsername(rs.getString("username"));
       u.setUserstr(rs.getString("userstr"));
       u.setUsertel(rs.getString("usertel"));
       u.setUserid(rs.getString("userid"));
       
       userList.add(u);
       
    }
    //测试
    //out.print(userList.size());
    //循环
    for(int i=0;i<userList.size();i++)
    {
    
       //输出
       out.print("<tr>");
       out.print("<td>"+userList.get(i).getUserid()+"</td><td>"+userList.get(i).getUsername()+"</td><td>"+userList.get(i).getUserstr()+"</td><td>"
       +userList.get(i).getUsertel()+"</td><td>"+userList.get(i).getUseremail()+"</td>");
       out.print("</tr>");
    }
    
    }
    catch(Exception e)
    {
     e.printStackTrace();
    }
    
     %>

		</table>
	</body>
</html>
