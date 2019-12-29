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
       应聘者姓名:<input type="text" id="enameSelect">
       <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
   </div>
   <table id="employeesInfotb" toolbar="#tool"></table>
   <div id="myWindow" title="应聘者新增" class="easyui-window" style="width:600px;height:300px">
      <form id="myForm" method="get" align="center">
      
      <input type="hidden" name="id" id="myId">
      <br><br>
                 应聘者姓名:<input type="text" name="ename">
      <br><br>
                  应聘性别:<input type="text" name="sex">
      <br><br>
                  出生日期:<input type="date" name="birthday">
      <br><br>
                联系方式:<input type="text" name="tel">
      <br><br>
                 电子邮箱:<input type="text" name="email">
      <br><br>
      <a href="javascript:saveEmployees()" class="easyui-linkbutton" iconCls="icon-save">保存</a>
      </form>
      </div>     
   </body>
   <script>
   
   function del(){
	   //获取选中数据
	   var row=$("#employeesInfotb").datagrid("getSelected");
	   if(row!=null){
  		 var id=row.id;
  		 $.get("deleight.do",{"id":id},function(data){
  			 $.messager.alert("提示框",data,"info")
  			 closeWin();
			     loadEmployeesInfo();
  		 })
   }else{
		 $.messager.alert("提示框","请选中要删除的行","info")
	 }
   }
   
   function update(){
	 //获取选中数据
	   var row=$("#employeesInfotb").datagrid("getSelected");
	 
	   if(row!=null){
  		 //打开弹窗
      	   $("#myWindow").window("open");
  		 //清空表单的数据
  		 $("#myForm").form("clear");
  		 
  		 //加载选中的数据
      	   $("#myForm").form("load",row);
	   }else{
		   $.messager.alert("提示框","请选中行","info");
	   }
   }
   
   function saveEmployees(){
	   var myId=$("#myId").val();
	   var url;
	   if(myId==""){
		   url="inserteight.do";
	   }else{
		   url="updateeight.do";
	   }
	 //jquery的ajax提交的表单数据
	   $("#myForm").form("submit",{
		   url:url,
		   success:function(data){
			   $.messager.alert("提示框",data,"info")
			   closeWin();
			   loadEmployeesInfo();
		   }
	   })
   }
   
   function add(){
	   $("#myWindow").window("open");
	   $("#myForm").form("clear");
   }
   
   function search(){
	   var ename=$("#enameSelect").val();
	   $("#employeesInfotb").datagrid("load",{"ename":ename})
   }
 //关闭窗口
   function closeWin(){
	   $("#myWindow").window("close");
   }
   /*jquery文档加载事件*/
   $(function(){
   	loadEmployeesInfo()
   	closeWin();
   })
   
   /*加载employeesInfo表里的数据   #对应table 的id*/
    function loadEmployeesInfo(){
	   $("#employeesInfotb").datagrid({
   		url:"selecteight.do",
   		method:"get",
   		fitColumns:true,//自适应
   		title:'应聘者列表',//表头
   		columns:[[
   		{
   			field:"id",
   			title:"编号",
   			width:100
   		},
   		{
   			field:"ename",
   			title:"姓名",
   			width:100
   		},
   		{
   			field:"sex",
   			title:"性别",
   			width:100
   		},
   		{
   			field:"birthday",
   			title:"出生日期",
   			width:100
   		},
   		{
   			field:"tel",
   			title:"联系方式",
   			width:100
   		},
   		{
   			field:"email",
   			title:"邮箱",
   			width:100
   		}
   		]],
   		pagination:true,//支持数据库分页
		pageSize:3,//每页显示几条数据
		pageList:[3,5,10]//显示下拉列表，供选择
   		})
   }
   </script>
   
</html>