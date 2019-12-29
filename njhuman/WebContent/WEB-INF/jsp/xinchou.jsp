<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet" />
<link href="lib/css/icon.css" type="text/css" rel="stylesheet" />

<script src="lib/js/jquery.min.js" type="text/javascript"></script>
<script src="lib/js/jquery.easyui.min.js" type="text/javascript"></script>
<script src="lib/js/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body>
	<div id="tool">
		<a href="javascript:add()" class="easyui-linkbutton"  iconCls="icon-add">添加</a>&nbsp;&nbsp; 
		<a href="javascript:update()" class="easyui-linkbutton" iconCls="icon-edit">修改</a>&nbsp;&nbsp;
		<a href="javascript:del()" class="easyui-linkbutton" iconCls="icon-cut">删除</a>&nbsp;&nbsp;

	 	<br> 姓名：<input type="text" id="userNameSelect" /> 
		<a  href="javascript:search()" class="easyui-linkbutton"  iconCls="icon-search">查询</a>
	</div> 


	<table id="xinChoutb" toolbar="#tool">
		<!--toolbar将里面的东西加入到表格里面  -->

	</table>

	 <div id="myWindow" title="新增页面" class="easyui-window"
		style="width: 600px; height: 400px">
		<form id="myForm" method="get">
			<input type="hidden" name="id" id="myId">
			<div style="margin-bottom:5px">
				<span style="letter-spacing:8px">基本工资：</span>
			 <input type="text" name="basicIncome" id="bi" style="width:200px;">
			</div> 
			<br> 
			<div style="margin-bottom:5px">
				<span style="letter-spacing:8px">效绩工资：</span>
				
			<input type="text" name="xjIncome" id="xj" style="width:200px;"><br>
			</div> 
			<br>
				 <div style="margin-bottom:5px">
				<span style="letter-spacing:16px">奖金：</span>		
			 <input type="text" name="award" id="aw" style="width:200px;">
			</div> 
				<br> 
				 <div style="margin-bottom:5px">
				<span style="letter-spacing:16px">罚款： </span>
				
			 <input type="text" name="fine" id="fi" style="width:200px;">
			</div> 
				<br> 
				<div style="margin-bottom:5px">
				<span style="letter-spacing:16px">  时间： </span>
				
			 <input type="date" name="date" style="width:200px;"><br>
			</div> 
				<br>
				<div style="margin-bottom:5px">
				<span style="letter-spacing:16px">   姓名： </span>
				
			<input type="text" name="userName" style="width:200px;"/> 
			</div> <br>
			    <!--     薪酬数目： <input type="text" name="realIncome" id="real"><br>  -->
			     
				
				 <a href="javascript:saveUser()" class="easyui-linkbutton" style="margin-left:160px;" iconCls="icon-save">保存</a>

		</form>
	</div> 


</body>
<script>

function del(){
	 //获取一行数据
	   var row=$("#xinChoutb").datagrid("getSelected");
	   if(row!=null){
		 var id=row.id;
		 $.get("delete.do",{"id":id},function(data){
			 
			 $.messager.alert("提示框",data,"xc");
			 loadXinChou();
				closeWindow();
		 })//juery的提交方法
	   }else{
		   $.messager.alert("删除数据","请选择想要删除的数据行","xc");
	   }
  } 
  
function update(){
	  
	   //获取数据
	   var row=$("#xinChoutb").datagrid("getSelected");
	   console.log(row);
	   if(row!=null){
		   $("#myWindow").window("open");
		   //清空背后弹出框中表单原有数据
		   /*  $("#myForm").form("clear"); */
		   //加载选中 数据,把获取到数据对应装入form中
		   $("#myForm").form("load",row);
	   }else{
		   $.messager.alert("提示框","请选择您想要修改的数据","xc");
	   }
}
 
	   function saveUser(){
		   var myId=$("#myId").val();
		   var url;
		   if(myId==""){//根据id是否为空，来判断弹出框是增加还是修改
			   url="insert.do";
		   }
		   else{
			   url="update.do";
		   }
		   //juery-easyui的ajax提交表单数据
		   $("#myForm").form("submit",{//ajax的提交;，并非表单提交
			 url:url,
			 success:function(data){
				 $.messager.alert("提示框",data,"xc");
				 closeWindow();//关闭弹出框
				 loadXinChou();//重新加载一次
			 }
		   })
		   
	       }
	   
	   
       function add(){
	 $("#myWindow").window("open");
	   $("#myForm").form("clear");
      }
      
      function search(){
	 var userName=$("#userNameSelect").val();//juery取值
	 $("#xinChoutb").datagrid("load",{
		 "userName":userName//ajax传值
	 })
      }
      function closeWindow(){
		   $("#myWindow").window("close");
	   }
      
      $(function(){
    		loadXinChou();
    		closeWindow();
    	           })
    	           
    	           
  function loadXinChou(){
    	  $("#xinChoutb").datagrid({//会自己提供页码以及分页数
    			url:"selectXinchou.do",/*请求服务端地址  */
    			method:"get",
    			fitColumns:true,//使列表数据沾满整个屏幕
    			title:"薪酬列表",
    			columns:[[
    				{
    					field:"id",//配置字段，对应pojo的属性名称
    					title:"编号",//表的列名
    					width:70
    				},
    				{
    					field:"userName",
    					title:"姓名",
    					width:70
    				},
    				{
    					field:"basicIncome",
    					title:"基本工资",
    					width:70
    				},
    				{
    					field:"xjIncome",
    					title:"效绩工资",
    					width:70
    				},
    				{
    					field:"award",
    					title:"奖金",
    					width:70
    				},
    	                {
    					field:"fine",
    					title:"罚款",
    					width:70
    				},
    	            {
    					field:"realIncome",
    					title:"实际收入",
    					width:70
    				},
    	            {
    					field:"date",
    					title:"时间",
    					width:70
    				}
    				
    			]],
    			pagination:true,//让easyui支持数据库分页
    			pageSize:3,//每一页显示多少条数据
    			pageList:[3,5,10]//每一页选择显示多少条数据
    		  })/*easyui提供的表格数据  */
      }
	
      
</script>
</html>