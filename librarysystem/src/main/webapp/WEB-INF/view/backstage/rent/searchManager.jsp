<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>借阅信息管理</title>
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
	<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>查询条件</legend>
	</fieldset>
	<form class="layui-form" method="post" id="searchFrm">
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">人条形码号:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="readerId" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">书条形码号:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="barcode" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
				<label class="layui-form-label">开始时间:</label>
				<div class="layui-input-inline">
					<input type="text" name="startTime" id="startTime" readonly="readonly" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">结束时间:</label>
				<div class="layui-input-inline">
					<input type="text" name="endTime" id="endTime" readonly="readonly" autocomplete="off" class="layui-input">
				</div>
			</div>
		 </div>
		 <div  class="layui-form-item" style="text-align: center;">
		   <div class="layui-input-block" >
		      <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
		      <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
		    </div>
		 </div>
	</form>
	<!-- 搜索条件结束 -->
	
	<!-- 数据表格开始 -->
	<table class="layui-hide" id="borrowTable" lay-filter="borrowTable"></table>
	<script type="text/html" id="borrowBar">
	{{#if (d.ifback == 0) { }}
	<a class="layui-btn layui-btn-xs" lay-event="edit">归还</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	{{# }else{ }}
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	{{# } }}
	</script> 
	<!-- <div  id="borrowBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">归还</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div> -->
	<!-- 数据表格结束 -->
	
	<script src="${ctx }/resources/layui/layui.js"></script>
	<script type="text/javascript">
	    var tableIns;
	    layui.use([ 'jquery', 'layer', 'form', 'table', 'laydate'], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var laydate = layui.laydate;
			laydate.render({
				elem:'#startTime',
				type:'datetime'
			});
			laydate.render({
				elem:'#endTime',
				type:'datetime'
			});
	    
			 tableIns=table.render({
				 elem: '#borrowTable'
			    ,url:'${ctx}/borrow/queryAllBorrow.action'
			    ,title: '借阅信息数据表'
			    ,toolbar:"#borrowToolBar" 
			    ,height:'full-200'
			    ,cellMinWidth:100
			    ,page: true 
			    ,cols: [[
		    	  {field:'id', title:'借阅信息编号',align:'center',width:'120'}
			      ,{field:'readerId', title:'读者条形码',align:'center',width:'150'}
			      ,{field:'bookid', title:'书籍编号',align:'center',width:'120'}
			      ,{field:'barcode', title:'书籍条形码',align:'center',width:'150'}
			      ,{field:'borrowTime', title:'借阅开始时间',align:'center',width:'150'}
			      ,{field:'backTime', title:'预计归还时间',align:'center',width:'200'}
			      ,{field:'realbackTime', title:'真实归还时间',align:'center',width:'200'}
			      ,{field:'ifback', title:'是否归还',align:'center',width:'100',templet:function(d){
			    	  return d.ifback=='1'?'<font color=blue>已归还</font>':'<font color=red>未归还</font>';
			      }}
			      ,{field:'giveoperator', title:'借阅操作员',align:'center',width:'150'}
			      ,{field:'backoperator', title:'归还操作员',align:'center',width:'150'}
			      ,{field:'remark', title:'记录',align:'center',width:'200'}
			      ,{fixed: 'right', title:'操作', toolbar: '#borrowBar', width:150,align:'center'}
			    ]]
			})
			
			//模糊查询
			$("#doSearch").click(function(){
				var params=$("#searchFrm").serialize();
				tableIns.reload({
					url:"${ctx}/borrow/loadAllBorrow.action?"+params
				})
			});
			
		   //监听行工具事件
		   table.on('tool(borrowTable)', function(obj){
			   var data = obj.data; 
			   var layEvent = obj.event; 
			   if(layEvent === 'del'){
				  layer.confirm('确认删除【'+data.id+'】这个借阅信息吗', function(index){
				       $.post("${ctx}/borrow/deleteBorrow.action",{id:data.id},function(res){
				    	    layer.msg(res.msg);
							tableIns.reload();
				       })
				   }); 
			   } else if(layEvent === 'edit'){
				   layer.confirm('确认归还【'+data.barcode+'】这本图书吗', function(index){
				       $.post("${ctx}/borrow/updateBorrow.action",{id:data.id, bookid:data.bookid},function(res){
				    	    layer.msg(res.msg);
							tableIns.reload();
				       })
				   });
			   }
			 });
			
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