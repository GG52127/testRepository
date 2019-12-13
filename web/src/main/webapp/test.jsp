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
		$("#login").window({
			width : 600,
			height : 400,
			modal : true,
			collapsible : false,
			minimizable : false,
			maximizable : false,
			closable : false,
			title : "登录界面"
		})
		$("#user").textbox({
			iconCls : "icon-man",
			iconAlign : "left",
			prompt : "输入用户名",
			buttonText : "登录",
			onClickButton : function() {
				var user = $("#user").textbox("getValue")
				$.ajax({
					url : "login",
					type : 'post',
					data : {
						"user" : user
					},
					dataType : 'json',
					success : function(resp) {
						var rs = resp.msg;
						if (rs == 1) {
							location.href="main"
						}else{
							$.messager.alert("Warning","no this user","",function(){
								$("#user").textbox("clear")
							})
						}
					}
				})
			}
		})

	})
	/* function down() {
		console.log(event.keyCode)
		if (event.keyCode == 13) {
			$("#user").textbox("button").click
		}
	} */
</script>
<body>
	<div id="login" style="text-align: center">
		<div style="margin-top: 50px">
			<input id="user" type="text" style="width: 300px">
		</div>
	</div>
</body>
</html>