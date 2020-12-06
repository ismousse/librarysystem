<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>书籍分类管理</title>
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
	<!-- 数据表格开始 -->
	<table class="layui-hide" id="booktypeTable" lay-filter="booktypeTable"></table>
	<div style="display: none;" id="booktypeToolBar">
	   <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
	</div>
	<div  id="booktypeBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<label class="layui-form-label">分类名称:</label>
				<div class="layui-input-block">
					<input type="hidden" name="id">
					<input type="text" name="typename" lay-verify="required" placeholder="请输入分类名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">可借阅最大天数:</label>
				<div class="layui-input-inline">
					<input type="text" name="days" placeholder="可借阅最大天数 " autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
			      <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
			      <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
			    </div>
		  	</div>
		</form>
	
	</div>
	<!-- 添加和修改的弹出层结束 -->
	
	<script src="${ctx }/resources/layui/layui.js"></script>
	<script type="text/javascript">
	    var tableIns;
	    layui.use([ 'jquery', 'layer', 'form', 'table'], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			tableIns=table.render({
				 elem: '#booktypeTable'
			    ,url:'${ctx}/booktype/loadAllBookType.action'
			    ,title: '书籍分类表'
			    ,toolbar:"#booktypeToolBar"
			    ,height:'full-200'
			    ,cellMinWidth:100
			    ,page: true
			    ,cols: [[
			      {field:'id', title:'书籍分类编号',align:'center',width:'120'}
			      ,{field:'typename', title:'书籍分类名称',align:'center',width:'150'}
			      ,{field:'days', title:'可借阅最大天数',align:'center',width:'200'}
			      ,{fixed: 'right', title:'操作', toolbar: '#booktypeBar', width:150,align:'center'}
			    ]]
			})
			//监听头部工具栏事件
			table.on("toolbar(booktypeTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				      openAddBooktype();
				    break;
				  };
			})
			//监听行工具事件
		    table.on('tool(booktypeTable)', function(obj){
			   var data = obj.data; 
			   var layEvent = obj.event; 
			   if(layEvent === 'del'){
				  layer.confirm('确认删除【'+data.typename+'】这个分类吗', function(index){
				       $.post("${ctx}/booktype/deleteBookType.action",{id:data.id},function(res){
				    	   layer.msg(res.msg);
							tableIns.reload();
				       })
				     }); 
			   } else if(layEvent === 'edit'){
			     openUpdateBooktype(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开添加页面
			function openAddBooktype(){
				mainIndex=layer.open({
					type:1,
					title:'添加分类',
					content:$("#saveOrUpdateDiv"),
					area:['400px','300px'],
					success:function(index){
						$("#dataFrm")[0].reset();
						url="${ctx}/booktype/addBookType.action";
					}
				});
			}
			//打开修改页面
			function openUpdateBooktype(data){
				mainIndex=layer.open({
					type:1,
					title:'修改分类',
					content:$("#saveOrUpdateDiv"),
					area:['400px','300px'],
					success:function(index){
						form.val("dataFrm",data);
						url="${ctx}/booktype/updateBookType.action";
					}
				});
			}
			//保存
			form.on("submit(doSubmit)",function(obj){
				var params=$("#dataFrm").serialize();
				$.post(url,params,function(obj){
					layer.msg(obj.msg);
					layer.close(mainIndex)
					tableIns.reload();
				})
			});
		});
	</script>
</body>
</html>