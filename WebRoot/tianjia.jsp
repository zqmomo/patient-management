<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>tianjiaxinxi</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="images/login.js"></script>
<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
 
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="userinfo.jsp?op=tianjia&" method="post">
	      <input type="hidden" name="to" value="reg"/>
		      		       <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">添加用户请注意格式</div>
                <li>
                	
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                 <li>
                	
                    <label for="phone"  class="input-tips2">手机号：</label>
                    <div class="inputOuter2">
                        <input type="text" id="phone" name="phone" maxlength="11" class="inputstyle2"/>
                    </div>
                    
                </li>
                 <li>
                	
                    <label for="e-mail"  class="input-tips2">邮箱：</label>
                    <div class="inputOuter2">
                        <input type="text" id="e-mail" name="e-mail" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg" style="margin-top:10px;margin-left:40%;" class="button_blue" value="添加">
                        <input type=reset style="margin-top:10px;" class="button_blue" value="重置"> 
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
           
    
    </div>
   
    
</body>
</html>