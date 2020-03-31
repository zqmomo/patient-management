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
        <li class="func"><a href="chaxun1.jsp">查询手术信息</a></li>
        <li class="func"><a href="tianjia2.html">添加手术信息</a></li>
        <li>修改手术信息</li>
      </ul>
      <h3 class="am-icon-users">医护管理</h3>
      <ul>
        <li class="func"><a href="chaxun2.jsp">查询医护信息</a> </li>
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
			
				<%
			//设置编码
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String shoushunum = request.getParameter("shoushunum");
			String sql = "select * from shoushu where shoushunum=?";
			Userinfo u=new Userinfo();
			 try
        {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql:///huanzhe?characterEncoding=utf-8",
				"root", "123");
		PreparedStatement psmt = con.prepareStatement(sql);
     //insert update delete <=>executeUpdate
     //select  <=>executeQuery()
     psmt.setString(1,shoushunum);
     ResultSet rs=psmt.executeQuery();
     while(rs.next())
     {
       
       //一行一行读取对象状态
       u.setShoushuname(rs.getString("shoushuname"));
       u.setYishengname(rs.getString("yishengname"));
       u.setBtime(rs.getString("btime"));
       u.setOtime(rs.getString("otime"));
       u.setName(rs.getString("name"));
       
    }
				} catch (Exception ex) {
				ex.printStackTrace();
			}
%>	
	
    <div class="fbneirong">
      <form name="form2" id="regUser" accept-charset="utf-8"  action="userin.jsp?op=updateshu" method="post">
        <ul>
			<li>手术编号:<input type="text" name="shoushunum" readonly="readonly" value="<%out.print(shoushunum);%>"></li>
			
			<li>手术名:<input type="text" name="shoushuname" value="<%out.print(u.getShoushuname()); %>"></li>
			
			<li>医生姓名:<input type="text" name="yishengname"  value="<%out.print(u.getYishengname()); %>"/></li>
			
			<li>患者姓名:<input type="text" name="name"  value="<%out.print(u.getName()); %>"/></li>
			
			<li>开始时间:<input type="text" name="btime"  value="<%out.print(u.getBtime()); %>"/></li>
			
			<li>结束时间:<input type="text" name="otime"  value="<%out.print(u.getOtime()); %>"/></li>
			
			</ul>
          <div class = "am-form-group am-cf">
          <div class="you" style = "margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">添加并关闭窗口</button>
          </div>
        </div>
      </form>

        </div>
</div>


</body>
</html>