<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/themes/icon.css" />
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
		$("#showPersons").datagrid({
			url : "showPersonsNotPermission",
			columns : [ [ {
				field : "pid",
				title : "用户id",
				width : 100
			}, {
				field : "pname",
				title : "用户名",
				width : 100
			} ] ],
			pagination : true,
			pageSize : 2,
			pageList : [ 3, 10, 20, 50 ],
			onDblClickRow : function(rowIndex, rowData) {
				var name = rowData.pname;
				$(".name").text(name + ",welcome")
				var id = rowData.pid;
				$(".id").text(id)
				$("#showPermission").tree({
					url : "showPermission",
					checkbox : true,
					onLoadSuccess : function(node, data) {
						$("#PermissionWindow").window("open")
					}
				})
			}
		})
		$("#PermissionWindow").window({
			width : 600,
			height : 400,
			title : "权限设置窗口",
			modal : true
		})
		$("#PermissionWindow").window("close")
		$("button").click(
				function() {
					var pid = $(".id").text();
					var nodes = $("#showPermission").tree("getChecked",
							[ "checked", "indeterminate" ]);
					var permissionIds = [];
					$.each(nodes, function(i, n) {
						permissionIds.push(n.id)
					})
					console.log(pid)
					console.log(nodes)
					$.ajax({
						url : "savePermission",
						type : "post",
						dataType : "json",
						data : {
							pid : pid,
							permissionIds : permissionIds
						},
						traditional : true,
						success : function(resp) {
							if (resp.msg == 1)
								console.log(resp)
							else
								console.log("failed")
						}
					})
					$("#showPersons").datagrid("reload")
					$("#PermissionWindow").window("close")
				})
	})
</script>
<body>
	<table id="showPersons"></table>
	<div id="PermissionWindow">
		<span class="id" style="display: none"></span> <span class="name"></span>
		<ul id="showPermission"></ul>
		<button>提交</button>
	</div>
</body>
</html>