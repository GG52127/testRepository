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
	$(function(){
		$("#showNotPermissionByUser").tree({
			url:"showPermission",
			checkbox:true,
			onLoadSuccess:function(node,data){
				$.ajax({
					url:"showNotPermissionWithId",
					type:"post",
					dataType:"json",
					data:{
						pid:"${sessionScope.person.pid}"
					},
					success:function(){
						
					}
				})
			}
		})
	})
</script>
<body>
	<div>
		<ul id="showNotPermissionByUser"></ul>
		
	</div>
</body>
</html>