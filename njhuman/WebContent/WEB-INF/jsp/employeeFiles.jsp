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
      <br>
      
            档案姓名 ：<input type="text" id="filesNameSelect">
     <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
  </div>
<table id="EmployeeInfotb" toolbar="#tool"></table>

 <!--  userName 是pojo类的属性-->
  <div id="myWindow" title="用户新增" class="easyui-window" style="width:600px;height:350px;padding:30px 100px">
    <form id="myForm" method="get"><!-- 不加action值 -->
    <input type="hidden" name="id" id="myId">
    <div style="margin-bottom:20px">
         <span style="letter-spacing:8px">   档案编号:</span>
            <input type="text" name="fileNum">
     </div>  
     <div style="margin-bottom:20px">
            <span style="letter-spacing:8px"> 员工编号:</span>
        <input type="text" name="employeeNum">
        </div>
         <div style="margin-bottom:20px">
           <span style="letter-spacing:8px">档案姓名:</span>
               <input type="text" name="filesName">
            </div>
        <div style="margin-bottom:20px">
          <span style="letter-spacing:8px">内容摘要:</span>
                <input type="text" name="filesSuma">
        </div>
          <div style="margin-bottom:20px">
        <span style="letter-spacing:16px">备&nbsp;注:</span>
        <input type="text" name="filesNotes">
           </div>
           <div style="margin-left: 40%;">
     <a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-save">保存</a><br>
     </div>
    </form>  
  </div>
</body>
<script type="text/javascript">
function saveUser(){
	var myId=$("#myId").val();
	var url;
	if(myId==""){//根据id是否为空判断调哪个弹窗 
		url="twoinsert.do";
	}else{
		url="twoupdate.do";
	}
	//jQuery-easyUI的ajax提交表单数据 
	$("#myForm").form("submit",{
		url:url,
		success:function(data){
			$.messager.alert("提示框",data,"info")//标题，传得值，图标 
			closeWin();//关闭弹窗
			loadEmployeeFiles();//重新加载数据
			
		}
	})//ajax提交 
}
 function add(){
	$("#myWindow").window("open");
	 //清空表单 
	  $("#myForm").form("clear");
}
 function del(){
	//获取数据 
	 var row=$("#EmployeeInfotb").datagrid("getSelected");
	if(row!=null){
		var id=row.id;
		//调用jquery的ajax方法 
		
		$.get("twodel.do",{"id":id},function(data){
			$.messager.alert("提示框",data,"info");
			closeWin();//关闭弹窗
			loadEmployeeFiles();//重新加载数据
		})
	}else{
		 $.messager.alert("提示框","请选中要删除的行","info");
	}
 }
 function update(){
	 
	 
	 //获取数据 
	 var row=$("#EmployeeInfotb").datagrid("getSelected");
	 console.log(row);
	
	 if(row!=null){
		//打开弹窗
		 $("#myWindow").window("open");
		 //清空表单 
		  $("#myForm").form("clear");
		 //加载选中的数据 
		 $("#myForm").form("load",row);
	 }else{
		 $.messager.alert("提示框","请选中要修改的行","info");
		
	 }
	 
 } 
 //查询
  function search(){
	  
	  var filesName=$("#filesNameSelect").val();
	  $("#EmployeeInfotb").datagrid("load",{"filesName":filesName})
  }
  /* 关闭新增窗口  */
  function closeWin(){
	  $("#myWindow").window("close");
  }
$(function(){
	
	loadEmployeeFiles()
	closeWin();
	  
})
//加载UserInfo表里的数据  对表格数据提到的datagrid()
function loadEmployeeFiles(){
	$("#EmployeeInfotb").datagrid({
		
		url:"selectFile.do",//请求的服务端地址
		method:"get",//请求的方式
		fitColumns:true,//列表数据占满整个屏幕
		title:"员工档案列表",//表名
		columns:[[
			//一个{}配一个列
			{
				field:"id",//配置字段，对应的时pojo类的属性名称
				title:"编号",//表的列名
				width:100//当前列的宽度
			},
			{
				field:"fileNum",//配置字段，对应的时pojo类的属性名称
				title:"档案编号",//表的列名
				width:100//当前列的宽度
			},
			{
				field:"employeeNum",//配置字段，对应的时pojo类的属性名称
				title:"员工编号",//表的列名
				width:100//当前列的宽度
			},
			{
				field:"filesName",//配置字段，对应的时pojo类的属性名称
				title:"档案姓名",//表的列名
				width:100//当前列的宽度
			},
			{
				field:"filesSuma",//配置字段，对应的时pojo类的属性名称
				title:"内容摘要",//表的列名
				width:100//当前列的宽度
			},
			{
				field:"filesNotes",//配置字段，对应的时pojo类的属性名称
				title:"备注",//表的列名
				width:100//当前列的宽度
			}
		]],
		pagination:true,//支持数据库分页
		pageSzie:3,//每页显示几条数据
		pageList:[3,5,10]//自动配置 每页显示条数选择框
		
		
		
	})
	
}


</script>
</html>