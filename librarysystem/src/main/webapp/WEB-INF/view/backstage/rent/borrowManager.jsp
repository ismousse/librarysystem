<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>借书管理</title>
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
		      <label class="layui-form-label">书籍名:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="bookname" autocomplete="off" class="layui-input">
		      </div>
		    </div>
			<div class="layui-inline">
		      <label class="layui-form-label">国际标准号:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="isbn" autocomplete="off" class="layui-input">
		      </div>
		    </div>
			<div class="layui-inline">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
			    <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
			</div>
		</div>
	</form>
	<!-- 搜索条件结束 -->
	
	<!-- 数据表格开始 -->
	<table class="layui-hide" id="bookTable" lay-filter="bookTable"></table>
	<div  id="bookBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">借阅</a>
	</div>
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px;" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">国际标准号:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="bookid">
						<input type="hidden" name="typeid">
						<input type="text" name="isbn" placeholder="请输入国际标准书号" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">读者条形码:</label>
					<div class="layui-input-inline">
						<input type="text" name="readerId" placeholder="请输入读者条形码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">记录:</label>
					<div class="layui-input-inline">
						<input type="text" name="remark"  placeholder="请输入记录" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item" style="text-align: left;">
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
	    layui.use([ 'jquery', 'layer', 'form', 'table', 'laydate'], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var laydate = layui.laydate;
			laydate.render({
				elem:'#createtime',
				type:'datetime'
			});
			tableIns=table.render({
				 elem: '#bookTable'
			    ,url:'${ctx}/book/querySomeBook.action'
			    ,title: '书籍数据表'
			    ,toolbar:"#bookToolBar"
			    ,height:'full-220'
			    ,cellMinWidth:100
			    ,page: true
			    ,cols: [[
			     {type: 'checkbox', fixed: 'left'}
			      ,{field:'bookid', title:'书籍编号',align:'center',width:'100'}
			      //每本书一个的
			      //,{field:'barcode', title:'条形码号',align:'center',width:'200'}
			      ,{field:'isbn', title:'国际标准书号',align:'center',width:'200'}
			      ,{field:'bookname', title:'书籍名',align:'center',width:'150'}
			      ,{field:'bookType', title:'书籍类型',width:'150',align:'center', templet:function(d){
			    	  return d.bookType.typename;
			      }}
			      ,{field:'bookShelf', title:'书架号',width:'130',align:'center', templet:function(d){
			    	  return d.bookShelf.name;
			      }}
			      ,{field:'author', title:'作者',align:'center',width:'150'}
			      ,{field:'bookcount', title:'库存量',align:'center',width:'100'}
			      ,{field:'price', title:'价格(元)',align:'center',width:'100'}
			      ,{field:'createtime', title:'录入时间',align:'center',width:'200'}
			      ,{field:'operator', title:'操作员',align:'center',width:'150'}
			      ,{fixed: 'right', title:'操作', toolbar: '#bookBar', width:100,align:'center'}
			    ]],
			    //处理删除数据是这一页的最后一条
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
			//模糊查询
			$("#doSearch").click(function(){
				var params=$("#searchFrm").serialize();
				tableIns.reload({
					url:"${ctx}/book/queryAllBook.action?"+params,
				    page:{
				    	curr:1
				    }
				})
			});
			//监听行工具事件
		    table.on('tool(bookTable)', function(obj){
			   var data = obj.data;
			   var layEvent = obj.event;
			   if(layEvent === 'edit'){
			      openBorrow(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开修改页面
			function openBorrow(data){
				mainIndex=layer.open({
					type:1,
					title:'添加借阅信息',
					content:$("#saveOrUpdateDiv"),
					area:['400px','300px'],
					success:function(index){
						form.val("dataFrm",data);
						url="${ctx}/borrow/addBorrow.action";
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