<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="themes/icon.css" />
</head>
<script type="text/javascript" src="js/jquery-1.8.1.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
		$("#t1").datagrid({
			url : "showStudents",
			columns : [ [ {
				field : "td",
				checkbox : true
			}, {
				field : "id",
				title : "编号",
				hidden : true,
				width : 100
			}, {
				field : "name",
				title : "姓名",
				width : 100
			} ] ],
			pagination : true,
			pageSize : 3,
			pageList : [ 1, 2, 3, 4 ],
			toolbar : [ {
				iconCls : "icon-add",
				text : "添加",
				handler : function() {
					$("#win1").window("open")
				}
			}, "-", {
				iconCls : "icon-remove",
				handler : function() {
					var arr = $("#t1").datagrid("getSelections")
					var ids = [];
					$.each(arr, function(i, n) {
						//console.log(i+":"+n.id) //i是数组索引，n是数据
						ids.push(n.id)
					})
					$.ajax({
						url : "yes",
						traditional : true,
						data : {
							"ids" : ids
						}
					})

				},
				text : "删除"
			}, "-", {
				iconCls : "icon-edit",
				handler : function() {
					$("#win2").window("open")
					var arr = $("#t1").datagrid("getSelections")
					console.log(arr[0])
					$("#ff").form("load", arr[0])

				},
				text : "修改"
			} ],
			rownumbers : true
		})
		//添加窗口1
		$("#win1").window({
			width : 600,
			height : 400,
			modal : true
		})
		$("#win1").window("close")
		//数据录入
		$("#tb").textbox({
			iconCls : "icon-man",
			iconAlign : "left"
		})
		//提交数据
		$("#save").click(function() {
			var name = $("#tb").textbox("getValue")
			$.ajax({
				url : "yes",
				data : {
					"name" : name
				}
			})
			$("#win1").window("close")
		})
		//添加窗口2
		$("#win2").window({
			width : 600,
			height : 400,
			modal : true
		})
		$("#win2").window("close")
		//数据录入
		$("#tb2").textbox({
			iconCls : "icon-man",
			iconAlign : "left"
		})
		//提交数据
		$("#update").click(function() {
			$("#ff").submit()
		})
		$("#ff").form({
			url : "yes",
			success : function(data) {
				alert(data)
			}
		})
		var myChart = echarts.init(document.getElementById("main"));
		var option = {
			title : {
				text : 'ECharts 入门示例'
			},
			tooltip : {},
			legend : {
				data : [ '销量' ]
			},
			xAxis : {
				data : [ "衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
			},
			yAxis : {},
			series : [ {
				name : '销量',
				type : 'bar',
				data : [ 5, 20, 36, 10, 10, 20 ]
			} ]
		};
		option.series[0].data = [ 10, 20, 36, 10, 10, 20 ]
		myChart.setOption(option);
	})
</script>
<body>
	<table id="t1"></table>
	<div id="win1" style="text-align: center">
		<input id="tb" type="text" style="width: 300px"><br>
		<button id="save">提交</button>
	</div>
	<div id="win2" style="text-align: center">
		<form id="ff" method="post">
			<input id="tb1" type="text" name="id" style="width: 300px"><br>
			<input id="tb2" type="text" name="name" style="width: 300px"><br>
		</form>
		<button id="update">更新</button>
	</div>
	<div id="main" style="width: 600px; height: 400px"></div>
</body>
</html>