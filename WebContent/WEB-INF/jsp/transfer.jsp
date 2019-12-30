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
  <br>
原职务: <input type="text" id="jobSelect">
 <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
</div>
<table id="transfertb" toolbar="#tool"></table>
<div id="myWindow" title="用户新增" class="easyui-window" style="width:600px;height:300px">
  <form id="myForm" method="get">
  <input type="hidden" name="id" id="myId">
   员工编号:<input type="text" name="eid">
  <br>
   原职务:<input type="text" name="job">
  <br>
   新职位:<input type="text" name="njob">
  <br>
   调动时间:<input type="text" name="dtime">
  <br>
  调动原因:<input type="text" name="dcase">
  <br>
  
  <a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-save">保存</a>
  </form>
</div>
</body>
<script>
function del(){
	 //获取选中数据
	 var row=$("#transfertb").datagrid("getSelected");
	 if (row!=null) {
		var id=row.id;
		$.get("delfour.do",{"id":id},function(data){
			$.messager.alert("提示框",data,"info")
			closeWin();
			loadTransfer()
		})
	} else {
		 $.messager.alert("提示框","请选中要删除的行","info")
	}
  }
  function update(){
	  
	   //获取选中数据
	   var row=$("#transfertb").datagrid("getSelected");
	   if(row!=null){
		   //打开弹窗
		   $("#myWindow").window("open");
		   //清空表单
		   $("#myForm").form("clear"); 
		   //加载选中的数据
		   $("#myForm").form("load",row);
	   }else {
		  $.messager.alert("提示框","请选中行","info")
	}
	   
  }

function saveUser(){
	   var myId=$("#myId").val();
	   console.log(myId)
	   var url;
	   if(myId!=""){
		   url="updatefour.do";
	   }else {
		   url="insertfour.do";
	}
	   //jquery的ajax提交表单数据
	   $("#myForm").form("submit",{
		   url:url,
		   success:function(data){
			   $.messager.alert("提示框",data,"info")
			   
			   closeWin();
			   loadTransfer();
		   }
	   })
}
  function add(){
	   $("#myWindow").window("open");
	   $("#myForm").form("clear"); 
}
function search() {
	var job=$("#jobSelect").val();
	$("#transfertb").datagrid("load",{"job":job})
}
$(function(){
	loadTransfer()
	   closeWin();
})
function closeWin(){
	    $("#myWindow").window("close");
   }

function loadTransfer(){
	$("#transfertb").datagrid({
		url:"selectfour.do",
		method:"get",
		fitColumns:true,//使列的元素充满整个屏幕
		title:"人事调动表",
		columns:[[
			{
				field:"id",//配置字段，对应的是pojo类的属性名称
				title:"编号",//标的列名
				width:50//当前列的宽度
			},
			{
				field:"eid",//配置字段，对应的是pojo类的属性名称
				title:"员工编号",//标的列名
				width:50//当前列的宽度
			},
			{
				field:"job",//配置字段，对应的是pojo类的属性名称
				title:"原职务",//标的列名
				width:50//当前列的宽度
			},
			{
				field:"njob",//配置字段，对应的是pojo类的属性名称
				title:"新职位",//标的列名
				width:50//当前列的宽度
			},
			{
				field:"dtime",//配置字段，对应的是pojo类的属性名称
				title:"调动时间",//标的列名
				width:50//当前列的宽度
			},
			{
				field:"dcase",//配置字段，对应的是pojo类的属性名称
				title:"调动原因",//标的列名
				width:50//当前列的宽度
			}
		]],
		pagination:true,//支持数据库分页
		pageSize:3,//每页显示几条数据
		pageList:[3,5,10]
	})
   }
</script>
</html>