<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>读者管理</title>
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
		      <label class="layui-form-label">读者姓名:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="name" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">条形码号:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="barcode" autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
				<label class="layui-form-label">开始时间:</label>
				<div class="layui-input-inline">
					<input type="text" name="startTime" id="startTime" readonly="readonly"   autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">结束时间:</label>
				<div class="layui-input-inline">
					<input type="text" name="endTime" id="endTime"  readonly="readonly"  autocomplete="off"
						class="layui-input">
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
	<table class="layui-hide" id="readerTable" lay-filter="readerTable"></table>
	<div style="display: none;" id="readerToolBar">
	   <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
       <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
	</div>
	<div  id="readerBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">读者姓名:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="readerId">
						<input type="text" name="name" lay-verify="required" placeholder="请输入读者姓名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">读者性别:</label>
					<div class="layui-input-inline">
						 <input type="radio" name="sex" value="1" checked="checked" title="男">
						 <input type="radio" name="sex" value="0" title="女">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">条形码号:</label>
					<div class="layui-input-inline">
						<input type="text" name="barcode" readonly="readonly"  placeholder="添加成功后自动生成" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">职业:</label>
					<div class="layui-input-inline">
						<input type="text" name="vocation"  placeholder="请输入职业" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">出生日期:</label>
					<div class="layui-input-inline">
						<input type="text" name="birthday" id="birthday" placeholder="请输入出生日期" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">读者类型:</label>
					<div class="layui-input-inline">
						<select name="typeid" id="typeid" lay-verify="required" lay-filter="xmFilter">
							<option value="0">请选择</option>
						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">证件类型:</label>
					<div class="layui-input-inline">
						 <input type="radio" name="paperType" value="1" checked="checked" title="身份证">
						 <input type="radio" name="paperType" value="0" title="学生证">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">证件号:</label>
					<div class="layui-input-inline">
						<input type="text" name="paperNO" placeholder="请输入证件号" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">读者电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="tel" placeholder="请输入读者电话" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">读者邮箱:</label>
					<div class="layui-input-inline">
						<input type="text" name="email" placeholder="请输入读者邮箱" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">备份:</label>
					<div class="layui-input-inline">
						<input type="text" name="remark" placeholder="请输入备份信息" autocomplete="off" class="layui-input">
					</div>
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
	    layui.use([ 'jquery', 'layer', 'form', 'table', 'laydate'], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var laydate = layui.laydate;
			laydate.render({
				elem:'#birthday',
				type:'datetime'
			});
			laydate.render({
				elem:'#startTime',
				type:'datetime'
			});
			laydate.render({
				elem:'#endTime',
				type:'datetime'
			});
	    
			 //渲染数据表格
			 tableIns=table.render({
				 elem: '#readerTable'
			    ,url:'${ctx}/reader/loadAllReader.action'
			    ,title: '读者数据表'//数据导出来的标题
			    ,toolbar:"#readerToolBar"   //表格的工具条
			    ,height:'full-200'
			    ,cellMinWidth:100 //设置列的最小默认宽度
			    ,page: true  //是否启用分页
			    ,cols: [[   //列表数据
			     {type: 'checkbox', fixed: 'left'}
			      ,{field:'readerId', title:'读者编号',align:'center',width:'120'}
			      ,{field:'name', title:'读者姓名',align:'center',width:'150'}
			      ,{field:'sex', title:'读者性别',align:'center',width:'100',templet:function(d){
			    	  return d.sex=='1'?'<font color=blue>男</font>':'<font color=red>女</font>';
			      }}
			      ,{field:'barcode', title:'条形码号',align:'center',width:'200'}
			      ,{field:'vocation', title:'职业',align:'center',width:'150'}
			      ,{field:'birthday', title:'出生日期',align:'center',width:'150'}
			      ,{field:'readerType', title:'读者类型',width:'150',align:'center', templet:function(d){
			    	  return d.readerType.typename;
			      }}
			      ,{field:'paperType', title:'证件类型',align:'center',width:'150',templet:function(d){
			    	  return d.paperType=='0'?'<font color=blue>学生证</font>':'<font color=blue>身份证</font>';
			      }}
			      ,{field:'paperNO', title:'证件号',align:'center',width:'200'}
			      ,{field:'tel', title:'读者电话',align:'center',width:'200'}
			      ,{field:'email', title:'读者邮箱',align:'center',width:'200'}
			      ,{field:'createtime', title:'创建时间',align:'center',width:'200'}
			      ,{field:'remark', title:'备份',align:'center',width:'150'}
			      ,{field:'operator', title:'操作员',align:'center',width:'150'}
			      ,{fixed: 'right', title:'操作', toolbar: '#readerBar', width:150,align:'center'}
			    ]]
			})
			
			//模糊查询
			$("#doSearch").click(function(){
				var params=$("#searchFrm").serialize();
				tableIns.reload({
					url:"${ctx}/reader/loadAllReader.action?"+params
				})
			});
			
			//监听头部工具栏事件
			table.on("toolbar(readerTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				      openAddReader();
				    break;
				    case 'deleteBatch':
				      deleteBatch();
					break;
				  };
			})
			//监听行工具事件
		   table.on('tool(readerTable)', function(obj){
			   var data = obj.data; 
			   var layEvent = obj.event; 
			  if(layEvent === 'del'){
				  layer.confirm('确认删除【'+data.name+'】这个读者吗', function(index){
				       $.post("${ctx}/reader/deleteReader.action",{readerId:data.readerId},function(res){
				    	   layer.msg(res.msg);
							tableIns.reload();
				       })
				     }); 
			   } else if(layEvent === 'edit'){
			     openUpdateReader(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开添加页面
			function openAddReader(){
				mainIndex=layer.open({
					type:1,
					title:'添加读者',
					content:$("#saveOrUpdateDiv"),
					area:['780px','530px'],
					success:function(index){
						$.ajax({
							url: '${ctx}/readertype/loadAllReaderTypeName.action',
							dataType: 'json',
							type: 'get',
							success: function (data) {
								$("#typeid").empty();
								$('#typeid').append(new Option("请选择"));
								$.each(data, function (index, item) {
									$('#typeid').append(new Option(item.typename, item.readertypeId));
								});
								layui.form.render("select");
							}
						});
						$("#dataFrm")[0].reset();
						url="${ctx}/reader/addReader.action";
					}
				});
			}
			//打开修改页面
			function openUpdateReader(data){
				mainIndex=layer.open({
					type:1,
					title:'修改读者',
					content:$("#saveOrUpdateDiv"),
					area:['780px','530px'],
					success:function(index){
						var a = data.readerType.typename;
						$.ajax({
							url: '${ctx}/readertype/loadAllReaderTypeName.action',
							dataType: 'json',
							type: 'get',
							success: function (data) {
				                $("#typeid").empty();
								$.each(data, function (index, item) {
				                    var option = new Option(item.typename, item.readertypeId);
				                    if(a == item.typename) {
				                        option.setAttribute("selected",'true');
				                    }
					                $('#typeid').append(option);
								});
								layui.form.render("select");
						    }
						});
						layui.form.render("select");
						form.val("dataFrm",data);
						url="${ctx}/reader/updateReader.action";
					}
				});
			}
			//保存
			form.on("submit(doSubmit)",function(obj){
				//序列化表单数据
				var params=$("#dataFrm").serialize();
				$.post(url,params,function(obj){
					layer.msg(obj.msg);
					//关闭弹出层
					layer.close(mainIndex)
					//刷新数据 表格
					tableIns.reload();
				})
			});
			
			//批量删除
			function deleteBatch(){
				//得到选中的数据行
				var checkStatus = table.checkStatus('readerTable');
			    var data = checkStatus.data;
			    var params="";
			    $.each(data,function(i,item){
			    	if(i==0){
			    		params+="ids="+item.readerId;
			    	}else{
			    		params+="&ids="+item.readerId;
			    	}
			    });
			    layer.confirm('确认删除选中的这些读者吗', function(index){
			       //向服务端发送删除指令
			       $.post("${ctx}/reader/deleteBatchReader.action",params,function(res){
			    	   layer.msg(res.msg);
			    	    //刷新数据 表格
						tableIns.reload();
			       })
			     }); 
			}
		});
	</script>
</body>
</html>