$(function() {
	loadStudent();
	//默认打开页面，对话框是关闭的
	closeD();

})

function loadStudent() {
	//表格的配置信息
	$('#myTable').datagrid({
		title : '员工列表', //表格名称
		iconCls : 'icon-save', //图标
		height : 'auto', //表格高度，可指定高度，可自动
		border : true, //表格是否显示边框
		url : 'employerSelect.do', //获取表格数据时请求的地址
		method : 'get', //表格数据获取方式,请求地址是上面定义的url
		fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
		columns : [ [ {
			field : 'id',
			title : '员工编号',
			width : 100,
			sortable : true, //排序字段
			hidden : false
		}, {
			field : 'empName',
			title : '姓名',
			width : 100

		}, {
			field : 'job',
			title : '职务',
			width : 100,
			hidden : false

		}

		] ],
		pagination : true, //如果表格需要支持分页，必须设置该选项为true
		pageSize : 5, //表格中每页显示的行数
		pageList : [ 5, 10, 15],

		striped : true, //奇偶行是否使用不同的颜色
		remoteSort : false, //是否从服务器排序数
		sortName : 'id', //按照ID列的值排序
		sortOrder : 'asc', //使用倒序排序 */
		idField : 'id',
		loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
		frozenColumns : [ [ //固定在表格左侧的复选框
		{
			field : 'ck',
			checkbox : true
		}, ] ]

	})

}

/**
 * 	窗口的设置
 */

$('#userWin').window({
	collapsible : false, //关闭折叠按钮
	maximizable : true, //关闭最大化按钮
	minimizable : false, //关闭最小化按钮
	modal : false
//true表示有遮盖层的效果，反之则没有
});

//打开修改弹窗
function openUpdate() {

	//获取选中行
	var row = $("#myTable").datagrid("getSelected");

	if (row) {
		$('#upForm input').each(function() {
			var name = this.name;
			if (name == 'myName') {
				$("#myName").textbox("setValue", row.className.myName);
			}
		});
		//把选中行的数据加载到upForm表单中
		$("#upForm").form("load", row);
		//打开弹窗
		$('#userWin').window('open');
		//更改窗口标题
		$('#userWin').window({
			title : '员工修改'
		});
	} else {
		$.messager.alert('警示框', '请选中要修改的数据', 'info');
	}

}

//打开新增窗口
function openAdd() {
	//更改窗口标题
	$('#userWin').window({
		title : '员工新增'
	});
	//清空表单中的数据
	$("#upForm").form("clear");
	//打开弹窗
	$('#userWin').window('open');
}

//关闭修改弹窗
function closeD() {
	$('#userWin').window('close');
}

//保存
function employerSave() {

	$("#upForm").form("submit",{
		url: "employerAdd.do",
		success: function(data) {
			$.messager.alert('警示框', data, 'info');
		}
	 })

}