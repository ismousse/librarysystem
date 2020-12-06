<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>管理员管理</title>
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
	<link rel="stylesheet" href="${ctx }/resources/layui_ext/dtree/dtree.css">
	<link rel="stylesheet" href="${ctx }/resources/layui_ext/dtree/font/dtreefont.css">
</head>
<body class="childrenBody">
	<!-- 数据表格开始 -->
	<table class="layui-hide" id="adminTable" lay-filter="adminTable"></table>
	<div style="display: none;" id="adminToolBar">
	   <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
	</div>
	<script type="text/html" id="adminBar">
	{{#if (d.adminId == ${admin.adminId}) { }}
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	{{# }else{ }}
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectAdminMenu">分配菜单</a>
	{{# } }}
	</script> 
	<!-- <div  id="adminBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	  <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectAdminMenu">分配菜单</a>
	</div> -->
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">管理员名:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="adminId">
						<input type="text" name="username" lay-verify="required"   placeholder="请输入管理员姓名" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">管理员密码:</label>
					<div class="layui-input-inline">
						<input type="text" name="password" lay-verify="required"  placeholder="请输入管理员管理员密码" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">管理员级别:</label>
					<div class="layui-input-inline">
						<input type="text" name="level"  placeholder="请输入管理员级别" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
			      <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">保存</button>
			      <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置</button>
			    </div>
		  	</div>
		</form>
	</div>
	<!-- 添加和修改的弹出层结束 -->
	
	<!-- 管理员分配菜单的弹出层开始 -->
	<div style="display: none;" id="selectAdminMenu">
		<ul id="menuTree" class="dtree" data-id="0"></ul>
	</div>
	<!-- 管理员分配菜单的弹出层结束 -->
	
	<script src="${ctx }/resources/layui/layui.js"></script>
	<script type="text/javascript">
	    var tableIns;
	    layui.extend({
			dtree:'${ctx}/resources/layui_ext/dist/dtree'
		}).use([ 'jquery', 'layer', 'form', 'table', 'dtree'], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var dtree=layui.dtree;
			tableIns=table.render({
				 elem: '#adminTable'
			    ,url:'${ctx}/admin/loadAllAdmin.action'
			    ,title: '管理员数据表'
			    ,toolbar:"#adminToolBar"
			    ,height:'full-200'
			    ,cellMinWidth:100
			    ,page: true
			    ,cols: [[
			      {field:'adminId', title:'管理员编号',align:'center',width:'250'}
			      ,{field:'username', title:'管理员姓名',align:'center',width:'250'}
			      ,{field:'password', title:'密码',align:'center',width:'305',templet:function(d){
			    	  return "******";
			      }}
			      ,{field:'level', title:'管理员级别',width:'200',align:'center'}
			      ,{fixed: 'right', title:'操作', toolbar: '#adminBar', width:300,align:'center'}
			    ]]
			})
			
			//监听头部工具栏事件
			table.on("toolbar(adminTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				      openAddAdmin();
				    break;
				  };
			})
			
		   //监听行工具事件
		   table.on('tool(adminTable)', function(obj){
			  var data = obj.data;
			  var layEvent = obj.event;
			  if(layEvent === 'del'){
				  layer.confirm('确认删除管理员【'+data.username+'】吗', function(index){
				       $.post("${ctx}/admin/deleteAdmin.action",{adminId:data.adminId},function(res){
				    	   layer.msg(res.msg);
							tableIns.reload();
				       })
				  }); 
			   } else if(layEvent === 'edit'){
			     openUpdateAdmin(data);
			   } else if(layEvent==='selectAdminMenu'){
				 openselectAdminMenu(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开添加页面
			function openAddAdmin(){
				mainIndex=layer.open({
					type:1,
					title:'添加管理员',
					content:$("#saveOrUpdateDiv"),
					area:['400px','310px'],
					success:function(index){
						$("#dataFrm")[0].reset();
						url="${ctx}/admin/addAdmin.action";
					}
				});
			}
			//打开修改页面
			function openUpdateAdmin(data){
				mainIndex=layer.open({
					type:1,
					title:'修改管理员信息',
					content:$("#saveOrUpdateDiv"),
					area:['400','310px'],
					success:function(index){
						form.val("dataFrm",data);
						url="${ctx}/admin/updateAdmin.action";
					}
				});
			}
			//保存
			form.on("submit(doSubmit)",function(obj){
				var params=$("#dataFrm").serialize();
				$.post(url,params,function(obj){
					layer.msg(obj.msg);
					layer.close(mainIndex)//关闭弹出层
					tableIns.reload();
				})
			});
			
			//打开分配菜单的弹出层
			function openselectAdminMenu(data){
				var menuTree;
				mainIndex=layer.open({
					type:1,
					title:'分配管理员【'+data.username+'】的菜单',
					content:$("#selectAdminMenu"),
					area:['400px','430px'],
					btnAlign:'c',
					btn:['<div class="layui-icon layui-icon-release">确认分配</div>','<div class="layui-icon layui-icon-close">取消分配</div>'],
					yes:function(index, layero){
						var nodes = dtree.getCheckbarNodesParam("menuTree");
						var adminId = data.adminId;
						var params = "adminId="+adminId;
						$.each(nodes,function(i,item){
							params += "&ids=" + item.nodeId;
						})
						alert(params);
						$.post("${ctx}/menu/saveAdminMenu.action",params,function(obj){
							layer.msg(obj.msg);
						})
					},
					success:function(index){
					   menuTree = dtree.render({
					      elem: "#menuTree",
						  dataStyle: "layuiStyle",
					      response:{message:"msg",statusCode:0},  //修改response中返回数据的定义
				          dataFormat: "list",  //配置data的风格为list
				          checkbar: true,
			              checkbarType: "all",//级联
			              checkbarData: "choose" ,
				          url: "${ctx}/menu/initMenuTreeJson.action?adminId="+data.adminId
					   });
					}
				});
			}
		});
	</script>
</body>
</html>