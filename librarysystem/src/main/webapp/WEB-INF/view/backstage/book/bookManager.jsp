<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>书籍管理</title>
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
		      <label class="layui-form-label">书籍类型:</label>
		      <div class="layui-input-inline">
		      <!-- <select name="typeid" id="typeid" lay-filter="xmFilter">
				  <option value=""></option>
			  </select> -->
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
	<div style="display: none;" id="bookToolBar">
	   <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
       <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
	</div>
	<div  id="bookBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px;" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">国际标准号:</label>
					<div class="layui-input-inline">
						<input type="text" name="isbn" placeholder="请输入国际标准书号" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">书籍名:</label>
					<div class="layui-input-inline">
						<input type="text" name="bookname" placeholder="请输入书籍名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">作者:</label>
					<div class="layui-input-inline">
						<input type="text" name="author"  placeholder="请输入作者" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">库存量:</label>
					<div class="layui-input-inline">
						<input type="text" name="bookcount" placeholder="请输入库存量" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">价格(元):</label>
					<div class="layui-input-inline">
						<input type="text" name="price" placeholder="请输入价格" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">书籍类型:</label>
					<div class="layui-input-inline">
						<select name="typeid" id="typeid" lay-filter="xmFilter">
							<option value="0">请选择</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">书架号:</label>
					<div class="layui-input-inline">
						<select name="shelfid" id="shelfid" lay-filter="xmFilter">
							<option value=""></option>
						</select>
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
			    ,url:'${ctx}/book/queryAllBook.action'
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
			      ,{fixed: 'right', title:'操作', toolbar: '#bookBar', width:180,align:'center'}
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
			//监听头部工具栏事件
			table.on("toolbar(bookTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				      openAddBook();
				    break;
				    case 'deleteBatch':
				      deleteBatch();
					break;
				  };
			})
			//监听行工具事件
		    table.on('tool(bookTable)', function(obj){
			   var data = obj.data;
			   var layEvent = obj.event;
			   if(layEvent === 'del'){
				  layer.confirm('确认删除书籍【'+data.booknumber+'】吗', function(index){
				       $.post("${ctx}/book/deleteBook.action",{booknumber:data.booknumber},function(res){
				    	    layer.msg(res.msg);
						    tableIns.reload();
				       })
				  });
			   } else if(layEvent === 'edit'){
			      openUpdateBook(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开添加页面
			function openAddBook(){
				mainIndex=layer.open({
					type:1,
					title:'添加书籍',
					content:$("#saveOrUpdateDiv"),
					area:['400px','480px'],
					success:function(index){
						$.ajax({
							url: '${ctx}/booktype/loadAllBookTypeName.action',
							dataType: 'json',
							type: 'get',
							success: function (data) {
								$("#typeid").empty();
								$('#typeid').append(new Option("请选择"));
								$.each(data, function (index, item) {
									$('#typeid').append(new Option(item.typename, item.id));
								});
								layui.form.render("select");
							}
						});
						$.ajax({
							url: '${ctx}/bookshelf/loadAllBookShelfName.action',
							dataType: 'json',
							type: 'get',
							success: function (data) {
								$("#shelfid").empty();
								$('#shelfid').append(new Option("请选择"));
								$.each(data, function (index, item) {
									$('#shelfid').append(new Option(item.name, item.id));
								});
								layui.form.render("select");
							}
						});
						$("#dataFrm")[0].reset();
						url="${ctx}/book/addBook.action";
					}
				});
			}
			//打开修改页面
			function openUpdateBook(data){
				mainIndex=layer.open({
					type:1,
					title:'修改书籍',
					content:$("#saveOrUpdateDiv"),
					area:['400px','480px'],
					success:function(index){
						var a = data.bookType.typename;
						var b = data.bookShelf.name;
						$.ajax({
							url: '${ctx}/booktype/loadAllBookTypeName.action',
							dataType: 'json',
							type: 'get',
							success: function (data) {
								$("#typeid").empty();
								$.each(data, function (index, item) {
				                    var option = new Option(item.typename, item.id);
				                    if(a == item.typename) {
				                        option.setAttribute("selected",'true');
				                    }
					                $('#typeid').append(option);
								});
								layui.form.render("select");
							}
						});
						$.ajax({
							url: '${ctx}/bookshelf/loadAllBookShelfName.action',
							dataType: 'json',
							type: 'get',
							success: function (data) {
								$("#shelfid").empty();
								$.each(data, function (index, item) {
				                    var option = new Option(item.name, item.id);
				                    if(b == item.name) {
				                        option.setAttribute("selected",'true');
				                    }
					                $('#shelfid').append(option);
								});
								layui.form.render("select");
							}
						});
						form.val("dataFrm",data);
						url="${ctx}/book/updateBook.action";
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
			
			//批量删除
			function deleteBatch(){
				var checkStatus = table.checkStatus('bookTable');
			    var data = checkStatus.data;
			    var params="";
			    $.each(data,function(i,item){
			    	if(i==0){
			    		params+="ids="+item.bookid;
			    	}else{
			    		params+="&ids="+item.bookid;
			    	}
			    });
			    layer.confirm('确认删除选中的这些书籍吗', function(index){
				       $.post("${ctx}/book/deleteBatchBook.action",params,function(res){
				    	   layer.msg(res.msg);
							tableIns.reload();
				       })
				 }); 
			}
			
		});
	</script>
</body>
</html>