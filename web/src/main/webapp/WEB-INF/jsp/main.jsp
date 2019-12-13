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
		$("#showPermission").tree({
			url : "showPermission",
			onLoadSuccess:function(node,data){
				$.ajax({
					url:"showPermissionWithId",
					type:'post',
					dataType:'json',
					data:{
						pid:"${sessionScope.person.pid}"
					},
					success:function(resp){
						if(resp.msg!=0){
							$.each(resp.msg,function(i,n){
								var node=$("#showPermission").tree("find",n);
								$("#showPermission").tree("remove",node.target)
							})
						}
					}
				})
			},
			onClick : function(node) {
				if (node.urlString != "no") {
					if ($("#permissionTabs").tabs("exists", node.text)) {
						$("#permissionTabs").tabs("select", node.text)
					} else {
						$("#permissionTabs").tabs("add", {
							title : node.text,
							closable : true,
							content:"<iframe src ="+node.urlString+" width='100%' height='100%'/>"
						})
					}
				}
			}
		})
	})
</script>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 100px"></div>
	<div
		data-options="region:'west',title:'hello,${sessionScope.person.pname }',collapsible:false"
		style="width: 250px">
		<ul id="showPermission"></ul>
	</div>
	<div data-options="region:'center'"
		style="padding: 5px; background: #eee">
		<div id="permissionTabs" class="easyui-tabs"
			data-options="fit:true,border:false"></div>
	</div>
</body>
</html>