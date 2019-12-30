<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>人力资源管理系统</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
			<script src="lib/js/jquery.min.js" type="text/javascript"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />人脸识别考勤系统</h1>
  </div>
  <div class="head-l">
  <a href="#" class="button button-little bg-green"  target="_blank"><span class="icon-home"></span> 系统首页</a> &nbsp;&nbsp;
  <a href="#" class="button button-little bg-blue"><span class="icon-wrench"></span> 修改密码</a> &nbsp;&nbsp;
  <a  href="#" class="button button-little bg-red"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>考勤情况</h2>
  <ul style="display:block">
    <li><a href="employer.do" target="right"><span class="icon-caret-right"></span>学生出勤</a></li>
    <li><a href="employeeFiles.do" target="right"><span class="icon-caret-right"></span>教师出勤</a></li>
    <li><a href="EmploAgree.do" target="right"><span class="icon-caret-right"></span>逃课名单</a></li> 
    <li><a href="EmploAgree.do" target="right"><span class="icon-caret-right"></span>视频回放</a></li> 
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>信息管理</h2>
  <ul style="display:block">
    <li><a href="transfer.do" target="right"><span class="icon-caret-right"></span>学生名单</a></li>   
    <li><a href="employeesInfo.do" target="right"><span class="icon-caret-right"></span>课表</a></li> 
    <li><a href="attendance.do" target="right"><span class="icon-caret-right"></span>教师信息</a></li>   
    <li><a href="xinchou.do" target="right"><span class="icon-caret-right"></span>上课地点</a></li>   
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});

//退出系统

</script>
<ul class="bread">
  <li><a href="info.jsp" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="shouye.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>