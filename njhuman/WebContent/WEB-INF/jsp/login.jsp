<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>人力资源管理系统</title>
		<!--引入样式-->
		<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet" />
		<link href="lib/css/icon.css" type="text/css" rel="stylesheet" />
		<link href="css/login.css" type="text/css" rel="stylesheet" />
		
		<!--导入jquery和easyui-->
		<script src="lib/js/jquery.min.js" type="text/javascript"></script>
		<script src="lib/js/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="lib/js/easyui-lang-zh_CN.js" type="text/javascript"></script>
		<script src="js/login.js" type="text/javascript"></script>
</head>
<body class="imgbody">
	<h1 class="myTitle">人脸识别考勤系统</h1>
	<div id="login" class="easyui-window" title="用户登录"
		style="padding: 35px; width: 400px; height: 270px;" >
		<div style="text-align: center; padding: 5px;">
			<form action="loginSubmit.do" method="post" id="myForm">
			
			<span style="color:red;">${info}</span>
			
				<div>
					<img src="images/user.png" widthe="20" height="20"
						style="position: relative; top: 5px;" />
					<!--用户登录输入框-->
					<label for="userName">用户名:&nbsp;</label>
					<input class="easyui-textbox" type="text" name="name"  placeholder="请输入用户名"></input>
				</div>
				<br />
				<div>
					<img src="images/pwd.png" widthe="20" height="20"
						style="position: relative; top: 5px;" />
					<!--密码登录输入框-->
					<label for="userPwd">密&nbsp;码:&nbsp;&nbsp;&nbsp; </label>
					<input class="easyui-textbox" type="password" name="num" ></input>
				</div>

			
				<br/> 
				<!--登录按钮-->
				<a href="javascript:void()" class="easyui-linkbutton" icon="icon-ok"
					onclick="login()">登录</a> &nbsp;&nbsp;&nbsp;	     
  				   <a href="javascript:void()" class="easyui-linkbutton" iconCls="icon-cancel"
					onclick="register()">注册</a>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	
		/* 登录触发方法 */
		function login() {
			//js的submit提交,myForm
			document.getElementById("myForm").submit();
		}
	
	</script>
</body>
</html>
