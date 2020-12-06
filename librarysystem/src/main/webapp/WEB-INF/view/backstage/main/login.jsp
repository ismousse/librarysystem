<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loginHtml">
<head>
	<meta charset="utf-8">
	<title>网上书屋-登录</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="${ctx}/resources/favicon.ico">
	<link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/resources/css/public.css" media="all" />
</head>
<body class="loginBody">
	<form class="layui-form" id="loginFrm" method="post" action="${ctx }/login/login.action">
		<div class="login_face"><img src="${ctx}/resources/images/a.jpg" class="userAvatar"></div>
		<div class="layui-form-item input-item">
			<label for="username">用户名</label>
			<input type="text" placeholder="请输入用户名" autocomplete="off" name="username" class="layui-input" lay-verify="required">
		</div>
		<div class="layui-form-item input-item">
			<label for="password">密码</label>
			<input type="password" placeholder="请输入密码" autocomplete="off" name="password" class="layui-input" lay-verify="required">
		</div>
		<div class="layui-form-item">
			<button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
		</div>
		<div class="layui-form-item layui-row" style="text-align: center;color: red;">
			${error}
		</div>
	</form>
	<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/cache.js"></script>
	<script type="text/javascript">
	layui.use(['form','layer','jquery'],function(){
	    var form = layui.form,
	        layer = parent.layer === undefined ? layui.layer : top.layer
	        $ = layui.jquery;
	    form.on("submit(login)",function(data){
	        $(this).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
	        setTimeout(function(){
	           $("#loginFrm").submit();
	        },1000);
	        return false;
	    })
	    $(".loginBody .input-item").click(function(e){
	        e.stopPropagation();//阻止事件冒泡
	        $(this).addClass("layui-input-focus").find(".layui-input").focus();
	    })
	    $(".loginBody .layui-form-item .layui-input").focus(function(){
	        $(this).parent().addClass("layui-input-focus");
	    })
	    $(".loginBody .layui-form-item .layui-input").blur(function(){
	        $(this).parent().removeClass("layui-input-focus");
	        if($(this).val() != ''){
	            $(this).parent().addClass("layui-input-active");
	        }else{
	            $(this).parent().removeClass("layui-input-active");
	        }
	    })
	})
	</script>
</body>
</html>