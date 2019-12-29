<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet" />
		<link href="lib/css/icon.css" type="text/css" rel="stylesheet" />

		<script src="lib/js/jquery.min.js" type="text/javascript"></script>
		<script src="lib/js/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="lib/js/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body>
<div id="tool">
	<a href="javascript:add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
	<a href="javascript:update()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	<a href="javascript:del()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
	<br/>
	类型：<input type="text" list="itemlist" id="typeSelect">
<datalist id="itemlist">
    <option>请假</option>
    <option>旷工</option>
    <option>停工</option>
    <option>出差</option>
    <option>迟到</option>
    <option>调班</option>
    <option>加班</option>
</datalist> 
	<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
</div>
<div id="mywindow" title="考勤记录" class="easyui-window" style="width:600px;height:300px;padding-top: 30px;padding-left: 200px;">
<form id="myform" method="get">
员工编号:<input type="text" name="employeeid">
<br>
<br>
类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:&nbsp;
<input type="text" list="itemlist" name="type">
<datalist id="itemlist">
    <option>请假</option>
    <option>旷工</option>
    <option>停工</option>
    <option>出差</option>
    <option>迟到</option>
    <option>调班</option>
    <option>加班</option>
</datalist>  
<br><br>
奖惩金额:<input type="text" name="amount">
<br><br>
考&nbsp;勤&nbsp;人:&nbsp;<input type="text" name="person">
<input type="hidden" name="id" id="myid">
<br><br>
<a style="padding-left: 100px;"  href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-save" plain="true">保存</a>
</form>
</div>
<table id="userInfotb" toolbar="#tool">



</table>
</body>
<script type="text/javascript">
	function search(){
		var type=$("#typeSelect").val();
		$("#userInfotb").datagrid("load",{"type":type})
	}
	/**
	关闭函数
	*/
	function closeWin(){
		$("#mywindow").window("close");
	}
	function add(){
		$("#myform").form("clear");//清空表单数据
		$("#mywindow").window("open");
	}
	function del(){
		//获取选中数据
		var row=$("#userInfotb").datagrid("getSelected");
		if(row!=null){
			var id=row.id;
			$.get("sixdel.do",{"id":id},function(data){
				$.messager.alert("提示框",data,"info");
			});
			closeWin();
			loadUserInfo();
		}else{
			$.messager.alert("提示框","请选中删除行","info");
		}
	}
	 function update(){
		   //获取选中数据
		   var row=$("#userInfotb").datagrid("getSelected");
		   console.log(row)
		   if(row!=null){
			   $("#mywindow").window("open");//打开弹窗
			   $("#myform").form("clear");//清空表单数据
			   $("#myform").form("load",row);//加载选中的数据
		   }else{
			   $.messager.alert("提示框","请选中行","info");
		   }
	   }
	   
	 function saveUser(){
		   //拿到隐藏域的值
		   var myId=$("#myid").val();
		   var url;
		   if(myId==""){
			   url="sixinsert.do";
		   }else{
			   url="sixupdate.do";
		   }
		   //jquery-easyui的ajax提交表单数据
		   $("#myform").form("submit",{
			   url:url,  //配置后端地址
			   success:function(data){
				   //后端传过来的值
				   $.messager.alert("提示框",data,"info")
				   closeWin();
				   loadUserInfo();
			   }
		   })  
	   }
	/* 文档加载事件 */
	$(function(){
		loadUserInfo()
		closeWin()
	})
	/* 加载Userinfo表里面的数据 */
	function loadUserInfo(){
	$("#userInfotb").datagrid({
		url:"sixselect.do",
		method:"get",
		fitColumns:true,
		title:"员工考勤记录",
		columns:[[
		          {
		        	  field:"id",//配置字段，对应pojo类属性名称
		        	  title:"编号",//表的列名
		        	  width:100//当前列的宽度
		          },
		          {
		        	  field:"amount",//配置字段，对应pojo类属性名称
		        	  title:"金额",//表的列名
		        	  width:100//当前列的宽度
		          },
		          {
		        	  field:"person",//配置字段，对应pojo类属性名称
		        	  title:"人",//表的列名
		        	  width:100//当前列的宽度
		          },
		          {
		        	  field:"employeeid",//配置字段，对应pojo类属性名称
		        	  title:"员工编号",//表的列名
		        	  width:100//当前列的宽度
		          },
		          {
		        	  field:"type",//配置字段，对应pojo类属性名称
		        	  title:"类型",//表的列名
		        	  width:100//当前列的宽度
		          }
		          ]],
		          pagination:true,//支持数据库分页
		          pageSize:3,//每页显示几条数据
		          pageList:[3,5,10]
	})
	}

</script>
</html>