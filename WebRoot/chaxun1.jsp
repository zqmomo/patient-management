<%@ page language="java"
	import="java.util.*,java.sql.*,com.bean.Userinfo" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>患者系统管理</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="apple-touch-icon-precomposed" href="images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/amazeui.min.css"/>
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.min.js"></script>
<script src="js/app.js"></script>
<title>Insert title here</title>
</head>
<body>
<header class="am-topbar admin-header">
  <div style="color:red;text-align:center;font-style:italic;font-size:x-large">患者信息管理</div>

</header>
<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu">
      <h2 class="am-icon-flag"><em></em> <a href="yisheng.html">主页</a></h2>
      <h3 class="am-icon-flag">病人管理</h3>
      <ul>
        <li class="func"><a href="chaxun.jsp">查询病人信息</a></li>
        <li class="func"><a href="tianjia1.html">添加病人信息</a></li>
        <li class="func"><a href="xiugai.html">修改病人信息</a></li>
        <li class="func"><a href="shanchu.html">删除病人信息</a></li>
      </ul>
      <h3 class="am-icon-cart-plus on"> 手术管理</h3>
      <ul>
        <li>查询手术信息</li>
        <li class="func"><a href="tianjia2.html">添加手术信息</a></li>
      </ul>
      <h3 class="am-icon-users">医护管理</h3>
      <ul>
        <li class="func"><a href="chaxun2.jsp">查询医护信息 </a></li>
        <li class="func"><a href="tianjia3.html">添加医护信息</a></li>
        <li class="func"><a href="xiugai2.html">修改医护信息</a></li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 

   <div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 首页 </li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">病人管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">手术管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>	
			</ul>

       

	
</div>

</div>
</div>
</div>
<div class="admin-biaogelist">
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on">栏目名称</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 > <a href="#">手术管理</a></dl>
 
    </div>
		<p align="center">
			手术信息
		</p>

		<table border="1" align="center" width="800px">

			<tr>
			<td>
			手术编号
			</td>
			    <td>
			                    手术名
			    </td>
				<td>
					医生姓名
				</td>
				<td>
				患者姓名
				</td>
				<td>
					开始时间
				</td>
				<td>
				     结束时间
				</td>
				<td>
				     操作
				</td>
			</tr>
			
				<%
    String sql="select * from shoushu";
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
       u.setShoushunum(rs.getString("shoushunum"));
       u.setShoushuname(rs.getString("shoushuname"));
       u.setYishengname(rs.getString("yishengname"));
       u.setBtime(rs.getString("btime"));
       u.setOtime(rs.getString("otime"));
       u.setName(rs.getString("name"));
       
       userList.add(u);
       
    }
    //测试
    //out.print(userList.size());
    //循环
    for(int i=0;i<userList.size();i++)
    {
    
       //输出
       out.print("<tr>");
       out.print("<td>"+userList.get(i).getShoushunum()+"</td><td>"+userList.get(i).getShoushuname()+"</td><td>"+userList.get(i).getYishengname()+"</td><td>"+userList.get(i).getName()+"</td><td>"
       +userList.get(i).getBtime()+"</td><td>"+userList.get(i).getOtime()+"</td><td>"+"<a href='xiugai1.jsp?shoushunum="+userList.get(i).getShoushunum()+"'><input name='update' type='button' id='update' value='修改'>"+"</td>");
       out.print("</tr>");
    }
    
    }
    catch(Exception e)
    {
     e.printStackTrace();
    }
    
     %>
		</table>	
</div>

</body>
</html>