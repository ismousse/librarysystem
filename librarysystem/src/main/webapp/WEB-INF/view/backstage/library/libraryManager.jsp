<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>图书馆信息</title>
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
	<table class="layui-hide" id="libraryTable" lay-filter="libraryTable"></table>
	<div style="display: none;" id="libraryToolBar">
	   <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
	</div>
	<div  id="bookBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px;width:550px;" id="saveOrUpdateDiv" >
		<form class="layui-form layui-row layui-col-space10"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-col-md9 layui-col-xs7">
				<div style="display: none;" class="layui-form-item magt3">
					<label class="layui-form-label">图书馆编号:</label>
					<div class="layui-input-block">
						<input type="text" name="id" id="id" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">图书馆名:</label>
					<div class="layui-input-block">
						<input type="text" name="libraryname" placeholder="请输入图书馆名" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item magt3">
					<label class="layui-form-label">馆长:</label>
					<div class="layui-input-block">
						<input type="text" name="curator" class="layui-input" placeholder="请输入馆长">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">电话:</label>
					<div class="layui-input-block">
						<input type="text" name="tel" class="layui-input" placeholder="请输入电话">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">地址:</label>
					<div class="layui-input-block">
						<input type="text" name="address" class="layui-input" placeholder="请输入地址">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱:</label>
					<div class="layui-input-block">
						<input type="text" name="email" class="layui-input" placeholder="请输入邮箱">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">网址:</label>
					<div class="layui-input-block">
						<input type="text" name="url" class="layui-input" placeholder="请输入网址">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">创建时间:</label>
					<div class="layui-input-block">
						<input type="text" name="createDate" id="createDate" class="layui-input" placeholder="请输入创建时间">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">简介:</label>
					<div class="layui-input-block">
						<input type="text" name="introduce" class="layui-input" lay-verify="required" placeholder="请输入简介">
					</div>
				</div>
				<div class="layui-form-item magb0" style="text-align: center;">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
				      <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
				    </div>
			  	</div>
			</div>
		</form>
	</div>
	<!-- 添加和修改的弹出层结束 -->
	
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
				elem:'#createDate',
				type:'datetime'
			});
			tableIns=table.render({
				 elem: '#libraryTable'
			    ,url:'${ctx}/library/queryAllLibrary.action'
			    ,title: '图书馆信息表'
			    ,toolbar:"#libraryToolBar"
			    ,height:'full-220'
			    ,cellMinWidth:100
			    ,page: true
			    ,cols: [[
			      {field:'id', title:'图书馆编号',align:'center',width:'100'}
			      ,{field:'libraryname', title:'图书馆名',align:'center',width:'150'}
			      ,{field:'curator', title:'馆长',align:'center',width:'100'}
			      ,{field:'tel', title:'电话',align:'center',width:'200'}
			      ,{field:'address', title:'地址',align:'center',width:'200'}
			      ,{field:'email', title:'邮箱',align:'center',width:'200'}
			      ,{field:'url', title:'网址',align:'center',width:'200'}
			      ,{field:'createDate', title:'创建时间',align:'center',width:'180'}
			      ,{field:'introduce', title:'简介', align:'center', width:'300'}
			      ,{fixed: 'right', title:'操作', toolbar: '#bookBar', width:180,align:'center'}
			    ]],
			    done:function(data,curr,count){
			    	if(data.data.length==0&&curr!=1){
			    		tableIns.reload({
						    page:{
						    	curr:curr-1
						    }
						});
			    	}
			    }
			})
			//监听头部工具栏事件
			table.on("toolbar(libraryTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				      openAddLibrary();
				    break;
				  };
			})
			//监听行工具事件
		    table.on('tool(libraryTable)', function(obj){
			   var data = obj.data;
			   var layEvent = obj.event;
			   if(layEvent === 'del'){
				  layer.confirm('确认删除图书馆【'+data.libraryname+'】吗', function(index){
				       $.post("${ctx}/library/deleteLibrary.action",{id:data.id},function(res){
				    	    layer.msg(res.msg);
						    tableIns.reload();
				       })
				  });
			   } else if(layEvent === 'edit'){
			      openUpdateLibrary(data);
			   }else if(layEvent==='viewImage'){
				   showBookImage(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开添加页面
			function openAddLibrary(){
				mainIndex=layer.open({
					type:1,
					title:'添加图书馆',
					content:$("#saveOrUpdateDiv"),
					area:['400px','500px'],
					success:function(index){
						$("#dataFrm")[0].reset();
						url="${ctx}/library/addLibrary.action";
						$("#id").removeAttr("readonly");
					}
				});
			}
			//打开修改页面
			function openUpdateLibrary(data){
				mainIndex=layer.open({
					type:1,
					title:'修改图书馆',
					content:$("#saveOrUpdateDiv"),
					area:['400px','500px'],
					success:function(index){
						form.val("dataFrm",data);
						//$("#id").attr("readonly","readonly");
						url="${ctx}/library/updateLibrary.action";
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