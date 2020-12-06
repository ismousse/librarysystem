<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>参数管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx }/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
<div class="layui-form-item">
<div class="layui-inline">
  <label class="layui-form-label">办卡费用:</label>
  <div class="layui-input-inline">
    <input type="text" name="number" id="a" readonly="readonly" autocomplete="off" class="layui-input">
  </div>
</div>
<div class="layui-inline">
  <label class="layui-form-label">卡有效期:</label>
  <div class="layui-input-inline">
    <input type="text" name="number" id="b" readonly="readonly" autocomplete="off" class="layui-input">
  </div>
</div>
</div>
<script src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use([ 'jquery', 'layer', 'form', 'table'], function() {
		var $ = layui.jquery;
		var layer = layui.layer;
		$.ajax({
			url: '${ctx}/config/value.action',
			type: 'get',
			success: function (data) {
				$("#a").val(data.makefee);
				$("#b").val(data.validtime);
			}
		});
	});
</script>
</body>
</html>