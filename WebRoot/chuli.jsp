<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>xiugaishanchu</title>
</head>
<body>
<form action="userinfo.jsp?op=delete" method="post">
<div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">需删除用户编号：</label>
                <div class="inputOuter" id="uArea">                    
                    <input type="text" id="u" name="userid" class="inputstyle"/>
                </div>
                </div> 
                <div style="padding-left:50px;margin-top:20px;">
                <input type="submit" value="确认删除" style="width:150px;" class="button_blue"/></div>
              </form>
<form action="userinfo.jsp?op=update"method="post">
<div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">需修改用户编号：</label>
                <div class="inputOuter" id="uArea">                    
                    <input type="text" id="u" name="userid" class="inputstyle"/>
                </div>
                 <label class="input-tips" for="u">用户名：</label>
                <div class="inputOuter" id="uArea">                    
                    <input type="text" id="u" name="username" class="inputstyle"/>
                </div>
                <label class="input-tips" for="u">用户密码：</label>
                <div class="inputOuter" id="uArea">                    
                    <input type="password" id="p" name="userpwd" class="inputstyle"/>
                </div>
                </div>
                <div style="padding-left:50px;margin-top:20px;">
                <input type="submit" value="确认修改" style="width:150px;" class="button_blue"/></div>
              </form> 
</body>
</html>