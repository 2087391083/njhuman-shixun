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
   <a href="javascript:add()" class="easyui-linkbutton" iconCls="icon-add" plain="true"> 新增</a>
   <a href="javascript:update()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"> 修改</a>
   <a href="javascript:del()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"> 删除</a> 
    <br />
      员工姓名：<input type="text" id="employeeNameSelect">
   <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
    </div>
    
    <table id="EmploAgreetb" toolbar="#tool"></table>
    
     <div id="myWindow" title="用户新增" class="easyui-window" style="width:600px;height:300px">
    <form id="myForm" method="get">
  <input type="hidden"  name="id" id="myId">
       
  档案编号:<input type="text" name="filenumber">
        <br><br>
  员工编号:<input type="text" name="employeenumber" >
    <br><br>
  员工姓名:<input type="text" name="employeename">
   <br><br> 
  开始日期:<input type="text" name="firstdate">
   <br><br>
  结束日期:<input type="text" name="enddate">
   <br><br>
  职 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务:<input type="text" name="duty">
   <br><br>
  档案内容:<input type="text" name="filecontent">
   <br><br>
  备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<input type="text" name="remark">
   <br><br>
   
     <a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-save">保存</a>   
   </form>         
</div>

</body>
<script type="text/javascript">

 function del(){
	var row=$("#EmploAgreetb").datagrid("getSelected");
	if(row!=null){
		var id=row.id;
		    $.get("threedel.do",{"id":id},function(data){
			$.messager.alert("提示框",data,"info");
			closeWin();
			loadEmploAgree()
			     })
	    }else{
		$.messager.alert("提示框","请选中要删除的行","info");}}
 function update(){
	 var row=$("#EmploAgreetb").datagrid("getSelected");
	 if(row!=null){
		 $("#myWindow").window("open");
		 $("myForm").form("clear");
	     $("#myForm").form("load",row);
	              }
	 else{
		 $.messager.alert("提示框","请选中行","info");
	      }
		         }
  function saveUser(){
    	 var myId=$("#myId").val();
    	 console.log("myId="+myId)
    	 var url;
    	 if(myId==""){
    		 url="threeinsert.do";
    	 }else{
    		 url="threeupdate.do";
    	 }
    	 $("#myForm").form("submit",{
    		 url:url,
    		 success:function(data){
    			 $.messager.alert("提示框",data,"info")
    			 closeWin();
    			 loadEmploAgree()
    		             }
    	                 })
    	  }
     function add(){
	 $("#myWindow").window("open");
	 $("#myForm").form("clear");
     } 
      function search(){
	 var employeeName=$("#employeeNameSelect").val();
	 $("#EmploAgreetb").datagrid("load",{"employeeName":employeeName})
 	} 
      function closeWin(){
    	 $("#myWindow").window("close");
     } 
    /* jquery 文档加载事件*/
    $(function(){
    	loadEmploAgree()
    	closeWin();
    })
    //加载userInfo表里的数据
    function loadEmploAgree(){
	$("#EmploAgreetb").datagrid({
		url:"selectAgree.do",
		method:"get",
		fitColumns:true,
		title:"档案管理",
		columns:[[
		          {
			        	field:"id",//配置字段
			        	title:"序号",//表的列名
			        	width:100//当前列的宽度
			          },
		         {
		        	field:"filenumber",//配置字段
		        	title:"档案编号",//表的列名
		        	width:100//当前列的宽度
		          },
		          {
		            field:"employeenumber",//配置字段
		        	title:"员工编号",//表的列名
		        	width:100//当前列的宽度
		        } , 
		         
		          {
		        	  field:"employeename",//配置字段
			        	title:"员工姓名",//表的列名
			        	width:100//当前列的宽度   	
		          },
		          {
		        	  field:"firstdate",//配置字段
			        	title:"开始日期",//表的列名
			        	width:100//当前列的宽度   	
		          },
		          {
		        	  field:"enddate",//配置字段
			        	title:"结束日期",//表的列名
			        	width:100//当前列的宽度   	
		          },
		          {
		        	  field:"duty",//配置字段
			        	title:"职务",//表的列名
			        	width:100//当前列的宽度   	
		          },
		          {
		        	  field:"filecontent",//配置字段
			        	title:"档案内容",//表的列名
			        	width:100//当前列的宽度   	
		          },
		          {
		        	  field:"remark",//配置字段
			        	title:"备注",//表的列名
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