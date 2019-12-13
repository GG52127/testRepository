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
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
		$("#d1").window({
			width : 500,
			height : 400,
			//modal:true,
			title : "登录窗口",
			collapsible : false, //折叠
			onOpen : function() {
				console.log("opened")
			},
			onMove : function(left, top) {
				console.log("left:" + left)
				console.log("top:" + top)
			}
		})

		$("#b1").click(function() {
			var a = Math.random() * 1400;
			var b = Math.random() * 500;
			$("#d1").window("move", {
				left : a,
				top : b
			})
		})
		
		$("[name='name']").textbox({
        	buttonText:'Search',
        	iconCls:'icon-man',
        	iconAlign:'left'
        	})
        	
		$("#b2").linkbutton({
			iconCls : "icon-add",
			onClick : function() {
				var name=$("#t1").val()
				console.log(name)
				var name1=$("#t1").textbox("getValue")
				console.log(name1)
				$("#ff").submit()
			}
		})
		
		$("#ff").form({
			url:"jsp",
			success:function(data){
				
			}
		})
	})
</script>
<body class="easyui-layout">
	<div data-options="region:'north',title:'North Title',split:true"
		style="height: 100px;"></div>
	<div data-options="region:'south',title:'South Title',split:true"
		style="height: 100px;"></div>
	<div data-options="region:'east',title:'East',split:true"
		style="width: 100px;"></div>
	<div data-options="region:'west',title:'West',split:true,disabled:true"
		style="width: 100px;"></div>
	<div data-options="region:'center',title:'center title'"
		style="padding: 5px; background: #eee;">
		<div id="d1">
			<form id="ff" method="post">
				<div>
					<label for="name">Name:</label> <input class="easyui-validatebox"
						type="text" id="t1" name="name" data-options="required:true" />
				</div>
				<div>
					<label for="email">Email:</label> <input class="easyui-validatebox"
						type="text" name="email" data-options="validType:'email'" />
				</div>
				...
			</form>
		</div>
		<button id="b1" class="easyui-linkbutton">yes</button>
		<button id="b2">no</button>
	</div>
</body>
</html>