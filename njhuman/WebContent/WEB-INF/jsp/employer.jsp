<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
	<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet" />
		<link href="lib/css/icon.css" type="text/css" rel="stylesheet" />

		<script src="lib/js/jquery.min.js" type="text/javascript"></script>
		<script src="lib/js/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="lib/js/easyui-lang-zh_CN.js" type="text/javascript"></script>
		<script src="js/employer.js" type="text/javascript"></script>
</head>
<body>
		<!--工具栏开始-->
		<div id="tool" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
				<a href="javascript:add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
				<a href="javascript:update()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				<a href="javascript:del()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
		
			</div>
			<div>
				班级: <input class="easyui-textbox" style="width:100px" id="nameSelect"> 
				地点: <input class="easyui-textbox" style="width:100px" id="nameSelect"> 
				时间: <input class="easyui-textbox" style="width:100px" id="nameSelect"> 
<!-- 				年龄: <input class="easyui-textbox" style="width:80px"> -->

				<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
				<a href="javascript:search()" class="easyui-linkbutton">导出</a>
			</div>
		</div>

		<!--工具栏结束-->

		<!--设置表格样式-->
		<table id="userInfotb" toolbar="#tool"></table>

		<!--窗口-->
		<div id="myWindow" title="修改窗口" class="easyui-window" style="width:600px;height:600px;padding:30px 60px">
			<form id="myForm" method="get">
			
			<input type="hidden" name="id" id="myId" />
			<div style="margin-bottom:20px">
				<span style="letter-spacing:8px">编号:</span>
				<input class="easyui-textbox" name="num" id="empName" data-options="prompt:'请输入员工编号'"style="width:80%;height:32px">
			</div>
		
			<div style="margin-bottom:20px">
				<span style="letter-spacing:8px">姓名:</span>
				<input class="easyui-textbox" name="name" id="empName" data-options="prompt:'请输入姓名'"style="width:80%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<span style="letter-spacing:8px">性别:</span>
				<input type="radio" name="sex" value="男">男
				<input type="radio" name="sex" value="女">女
			</div>

			<div style="margin-bottom:20px">
				<span style="letter-spacing:8px">学历:</span>
				<select class="easyui-combobox" name="education" style="width:200px;">
					<option value="大专">大专</option>
					<option value="本科">本科</option>
					<option value="硕士">硕士</option>
					<option value="博士">博士</option>
				</select>
			</div>
			<div style="margin-bottom:20px">
				<span style="letter-spacing:8px">部门:</span>
				<select class="easyui-combobox" name="department" style="width:200px;">
					<option value="行政部">行政部</option>
					<option value="人事部">人事部</option>
					<option value="财政部">财政部</option>
					<option value="事业部">事业部</option>
				</select>
			</div>
			<div style="margin-bottom:20px">
				<span style="letter-spacing:8px">职务:</span>
			<select class="easyui-combobox" name="job" style="width:200px;">
					<option value="员工">员工</option>
					<option value="部门经理">部门经理</option>
					<option value="总经理">总经理</option>
					
				</select>
			</div>
			<div style="margin-bottom:20px">
				<span>出生日期:</span>
				<input class="easyui-datebox"   name="birthday" style="width:80%;height:32px">
				
			</div>
			<div style="margin-bottom:20px">
				<span>联系电话:</span>
				<input  class="easyui-textbox" name="tel" id="tel" style="width:80%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<span>邮箱地址:</span>
				<input  class="easyui-textbox" name="email" id="email" style="width:80%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<span>入职时间:</span>
				<input class="easyui-datebox"   name="time" style="width:80%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<span>人员状态:</span>
				<select class="easyui-combobox" name="states" style="width:200px;">
					<option value="在职">在职</option>
					<option value="离职">离职</option>
					<option value="兼职">兼职</option>
					
				</select>
			</div>
			<div style="margin-left: 40%;">
				<a href="javascript:saveUser()" class="easyui-linkbutton" icon="icon-ok" id="loginbtn"  >保存</a>
			</div>
		
			
			</form>
		</div>
	</body>
		
		<script>
	function del(){
		var row=$("#userInfotb").datagrid("getSelected");            
		if(row!=null){
			var id=row.id;
			$.get("del.do",{"id":id},function(data){
				$.messager.alert("提示框",data,"info")
				closeWin();
				loadEmployeeMsg();
				
			})//调用ajax的方法进行删除,get(地址，参数,函数)指的是提交
		}else{
			$.messager.alert("提示框","请选中要删除的行！","info");
		}
	}

	function update(){
		//获取选中数据
		var row=$("#userInfotb").datagrid("getSelected");
		if(row!=null){
			$("#myWindow").window("open");
			$("#myForm").form("clear");//清空表单
			console.log(row);
			//加载选中的数据
			$("#myForm").form("load",row);
		}else{
			$.messager.alert("提示框","请选中行！","info");
		}
	}

	function search(){
		var name=$("#nameSelect").val();
		console.log(name);
		$("#userInfotb").datagrid("load",{"name":name})//ajax请求，加载userName的值
	}

	function closeWin(){
		$("#myWindow").window("close");
	}/* 刚启动服务器时关闭窗口 */
	
	function add(){
		$("#myForm").form("clear");
		$("#myWindow").window("open");
	}
	
	function saveUser(){
		var myId=$("#myId").val();
		var url;
		if(myId==""){
			url="insertly.do";
		}else{
			url="updately.do";
		}
		
		/* jq-easyui的ajax提交表单数据 */
		$("#myForm").form("submit",{
			url:url,
			success:function(data){
				$.messager.alert("提示框",data,"info")
				closeWin();
				loadEmployeeMsg();
			}/* data为后端传过来的值 */
		});/* submit是指ajax提交，不是表单提交 */
	}
	
	$(function(){
		loadEmployeeMsg();
		closeWin();
	})/*jq的文档加载事件  */
	function loadEmployeeMsg(){
		$("#userInfotb").datagrid({
			url:"select.do",
			title:"学生考勤情况表",
			fitColumns:true,//让表哥中的数据自适应（宽度为100%）
			method:"get",
			columns:[[
				/* {
					field:"num",
					title:"编号",
					width:100
				}, */{
					field:"education",//配置字段，对应的是pojo类的属性名称
					title:"学号",
					width:100
				},{
					field:"name",
					title:"姓名",
					width:100
				},{
					field:"sex",
					title:"性别",
					width:100
				}/* ,{
					field:"birthday",
					title:"时间",
					width:100
				} *//* ,{
					field:"tel",
					title:"电话号码",
					width:100
				} */ ,{
					field:"email",
					width:100,
					title:"时间"
				},{
					field:"department",
					title:"地点",
					width:100
				},{
					field:"job",
					title:"签到情况",
					width:100
				} /* 一个大括号配一列 */
			]],
			pagination:true,//支持数据库分页
			pageSize:3,//每页显示几条数据
			pageList:[3,5,10]
		})//datagrid是easyui专门提供对表哥数据的处理
	}//加载userinfo表里的数据
	
	
	</script>
		
</html>