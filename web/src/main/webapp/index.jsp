<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.1.js"></script>
<script type="text/javascript">
	$(function() {
		var host = window.location.host;
		var websocket;
		if ('WebSocket' in window) {
			// alert("浏览器支持Websocket")
			if (websocket == null) {
				//以下用的是ip路径，那么在本地启动项目时也需要使用ip地址进行访问
				websocket = new WebSocket("ws://" + host
						+ "${pageContext.request.contextPath}" + "/a");
			}
		} else {
			console.log('当前浏览器 Not support websocket')
		}
		websocket.onopen = function() {
			alert("WebSocket连接成功")
		}
		//接收到消息的回调方法
		websocket.onmessage = function(event) {
			alert("接收到消息的回调方法")
		}
		//连接关闭的回调方法
		websocket.onclose = function() {
			alert("连接关闭")
		}
		//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		window.onbeforeunload = function() {
			websocket.close();
		}
		$("button").click(function() {
			websocket.send("hahaha");
		})
	})
</script>
<body>
	<button>点击发送消息</button>
</body>
</html>