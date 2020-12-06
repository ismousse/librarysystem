<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页(封面)</title>
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
	<div class="layui-progress layui-progress-big">
	  <div class="layui-progress-bar layui-bg-green" lay-percent="75%"></div>
	</div>
	<br/>
	<button type="button" class="layui-btn layui-btn-fluid layui-btn-normal" style="font-size:30px;">图  书  馆  系  统</button>
	<br/>
	<br/>
	<div style="padding: 20px; height:660px; background-color: #009688;">
	  <div class="layui-col layui-col-space15">
	  <div class="layui-col-md9">
	    <div class="layui-card">
	      <div class="layui-card-body">
	      <!-- 搜索框开始 -->
			<blockquote class="layui-elem-quote">查询条件</blockquote>
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
				      <select name="typeid" id="typeid" lay-filter="xmFilter">
						  <option value=""></option>
					  </select>
					  </div>
				    </div>
			    </div>
			    <div class="layui-form-item">
			    	<center>
					<div class="layui-inline">
					    <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
					    <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
					</div>
					</center>
				</div>
			</form>
			<!-- 搜索条件结束 -->
			<!-- 数据表格开始 -->
			<table class="layui-hide" id="bookTable" lay-filter="bookTable"></table>
			<!-- 数据表格结束 -->
	      </div>
	    </div>
	  </div>
	  <div class="layui-col-md3">
	   <div class="layui-row-md3">
	    <div class="layui-card">
	      <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		    <legend>最受欢迎图书排行</legend>
		  </fieldset>
	      <div class="layui-card-body">
	        <table class="layui-hide" id="bestBook" lay-filter="bestBook"></table>
	      </div>
	    </div>
	    </div>
	    <div class="layui-row-md3">
	    <div class="layui-card">
		  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		    <legend>最爱阅读读者排行</legend>
		  </fieldset>
	      <div class="layui-card-body">
	        <table class="layui-hide" id="bestReader" lay-filter="bestReader"></table>
	      </div>
	      </div>
	    </div>
	  </div>
	</div>
	<div id="footer">
	 <div id="copyright" style="font-size:12px;">
	   <h3>Copyright&copy;&nbsp;我太难了&nbsp;版权所有&nbsp;&nbsp;图书管理系统
	   <a href="${ctx}/login/toLogin.action">[后台登录]</a>
	   </h3>
	 </div>
	</div>
	</div>
	
	<script src="${ctx }/resources/layui/layui.js"></script>
	<script type="text/javascript">
	    var tableIns;
	    var tableBestBook;
	    var tableBestReader;
	    layui.use([ 'jquery', 'layer', 'form', 'table', 'element'], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var element = layui.element;
			tableIns=table.render({
				 elem: '#bookTable'
			    ,url:'${ctx}/book/queryAllBook.action'
			    ,title: '书籍数据表'
			    ,cellMinWidth:100
			    ,page: true
			    ,cols: [[
			      {field:'bookid', title:'书籍编号',align:'center',width:'120'}
			      ,{field:'isbn', title:'国际标准书号',align:'center',width:'160'}
			      ,{field:'bookname', title:'书籍名',align:'center',width:'170'}
			      ,{field:'bookType', title:'书籍类型',width:'140',align:'center', templet:function(d){
			    	  return d.bookType.typename;
			      }}
			      ,{field:'bookShelf', title:'书架号',width:'90',align:'center', templet:function(d){
			    	  return d.bookShelf.name;
			      }}
			      ,{field:'author', title:'作者',align:'center',width:'150'}
			      ,{field:'bookcount', title:'库存量',align:'center',width:'100'}
			      ,{field:'price', title:'价格(元)',align:'center',width:'120'}
			    ]],
			})
			tableBestBook=table.render({
				 elem: '#bestBook'
			    ,url:'${ctx}/borrow/queryBestBook.action'
			    ,title: '最受欢迎图书表'
			    ,cellMinWidth:100
			    ,cols: [[
			      {field:'barcode', title:'国际标准书号',align:'center'}
			    ]],
			})
			tableBestReader=table.render({
				 elem: '#bestReader'
			    ,url:'${ctx}/borrow/queryBestReader.action'
			    ,title: '最爱阅读读者表'
			    //,height:'full-220'
			    ,cellMinWidth:100
			    ,cols: [[
			      {field:'readerId', title:'读者编号',align:'center'}
			    ]],
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
		  //触发事件
		  var active = {
		    setPercent: function(){
		      //设置50%进度
		      element.progress('demo', '50%')
		    }
		    ,loading: function(othis){
		      var DISABLED = 'layui-btn-disabled';
		      if(othis.hasClass(DISABLED)) return;
		    
		      //模拟loading
		      var n = 0, timer = setInterval(function(){
		        n = n + Math.random()*10|0;  
		        if(n>100){
		          n = 100;
		          clearInterval(timer);
		          othis.removeClass(DISABLED);
		        }
		        element.progress('demo', n+'%');
		      }, 300+Math.random()*1000);
		      
		      othis.addClass(DISABLED);
		    }
		  };
		  
		  $('.site-demo-active').on('click', function(){
		    var othis = $(this), type = $(this).data('type');
		    active[type] ? active[type].call(this, othis) : '';
		  });
	});
	</script>
</body>
</html>