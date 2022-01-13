<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${ctx }/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" /> 
        <link href="assets/backstage/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/backstage/css/style.css"/>       
        <link rel="stylesheet" href="assets/backstage/assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/backstage/assets/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/backstage/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
        <link href="assets/backstage/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />   
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<style type="text/css">
		.picture{
				position: absolute;
				width: 150px;
				height: 150px;
				box-sizing: border-box;
				border: 1px solid #ccc;
				border-radius: 75px;
				transition:all 0.5s;
			}
		#sample-table tr>td>img{
			width: 100px;
			height: 100px;
		}
		
		</style>
	    <script src="assets/backstage/js/jquery-1.9.1.min.js"></script>   
        <script src="assets/backstage/assets/js/bootstrap.min.js"></script>
        <script src="assets/backstage/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="assets/backstage/assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/backstage/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="assets/backstage/js/H-ui.js"></script> 
        <script type="text/javascript" src="assets/backstage/js/H-ui.admin.js"></script> 
        <script src="assets/backstage/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="assets/backstage/assets/laydate/laydate.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/backstage/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script> 
        <script src="assets/backstage/js/lrtk.js" type="text/javascript" ></script>
       <!--  <script type="text/javascript" src="assets/backstage/js/list.js"></script> -->
        <!-- 引入jquery -->
<!-- <script type="text/javascript" language="javascript"
	src="assets/public/lib/jquery/jquery-3.6.0.min.js"></script> -->
 <!-- 引入layer 用于弹出框-->
<!-- <script type="text/javascript" language="javascript"
	src="assets/public/lib/layer/layer.js"></script>
<script type="text/javascript" language="javascript"
	src="assets/public/lib/laydate/laydate.js"></script>  -->
<script type="text/javascript">
	var ctx = "${ctx}";//客户端可看应用上下文

	var error = "${error}";//页面错误信息
</script>
<title>产品列表</title>
</head>
<body>
<div class=" page-content clearfix">
 <div id="products_style">
     <form action="backstage/Products_List" method="get">
    <div class="search_style">
     
     <ul class="search_content clearfix">
    
       <!-- <li><label class="l_f">产品名称</label><input name="comname" id="comname" type="text"  class="text_add" placeholder="输入品牌名称"  style=" width:250px"/></li>
       <li><label class="l_f">产品编号</label><input name="productID" id="productID" type="text"  class="text_add" placeholder="输入品牌编号"  style=" width:250px"/></li> -->
      <div class="Add_p_s">
           <label class="form-label col-2">产品名称：</label>
	     <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder="" id="comname" name="comname"></div>
            </div>
      <div class="Add_p_s">
            <label class="form-label col-2">产品编号：</label>
			<div class="formControls col-2"><input type="text" class="input-text" value="" placeholder="" id="productID" name="productID"></div>
            </div>
      
       <!-- <a type="submit" class="btn_search"><i class="icon-edit bigger-120"></i>查询</a> -->
       <li style="width:90px;"><button type="submit" class="btn_search">查询</button></li>
      </ul>
    </div>
     </form>
     <div class="border clearfix">
       <span class="l_f">
        <a href="backstage/picture-add" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
        <a href="javascript:ovid()" class="btn btn-danger" id="btnbtn-danger"><i class="icon-trash"></i>批量删除</a>
        <a href="javascript:ovid()" class="btn btn-xs btn-info" id="btn-xs-edit"><i class="icon-edit bigger-120"></i>编辑</a>
       </span>
       <span class="r_f">共：<b>2334</b>件商品</span>
     </div>
     <!--产品列表展示-->
     <div class="h_products_list clearfix" id="products_list">
       <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">产品类型列表</h4></div>
         <div class="widget-body">
          <div class="widget-main padding-8"><div id="treeDemo" class="ztree"></div></div>
        </div>
       </div>
      </div>  
     </div>
         <div class="table_menu_list" id="testIframe">
      
      
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">编号</th>
				<th width="250px">产品名称</th>
				<th width="100px">促销价</th>
				<th width="100px">原价</th>
                <th width="100px">产品编号</th>				
				<th width="180px">品牌</th>
                <th width="80px">图片</th>
				<th width="70px">状态</th>                
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${commoditys }" var="com">
		<tr>
		
		<td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px" data-port="${com.picture }">${com.id } </td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">${com.comname }</u></td>
        <td width="100px">${com.market }</td>
        <td width="100px">${com.display }</td> 
        <td width="100px">${com.productID }</td>         
        <td width="180px">${com.brand }</td>
        <td class="text-l"><img src="${com.picture }" class="image"/></td>
        <td class="td-status"><span class="label label-success radius">${com.iscnable }</span></td>
        <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a> 
       <!--  <a title="编辑"  href="javascript:void(0)"  class="btn btn-xs btn-info" id="btn-xs-edit"><i class="icon-edit bigger-120"></i></a>  -->
        
       </td>
       
       
		</tr>
	</c:forEach>

    </tbody>
    </table>
    
    
    </div>     
  </div>
 </div>
</div>
</body>
</html>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
 laydate({
    elem: '#start',
    event: 'focus' 
});
$(function() { 
	$("#products_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:260,//设置显示时间距
	});
});
</script>
<script type="text/javascript">
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 
/*******树状图*******/
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};

var zNodes =[
	{ id:1, pId:0, name:"商城分类列表", open:true},
	{ id:11, pId:1, name:"蔬菜水果"},
	{ id:111, pId:11, name:"蔬菜"},
	{ id:112, pId:11, name:"苹果"},
	{ id:113, pId:11, name:"大蒜"},
	{ id:114, pId:11, name:"白菜"},
	{ id:115, pId:11, name:"青菜"},
	{ id:12, pId:1, name:"手机数码"},
	{ id:121, pId:12, name:"手机 "},
	{ id:122, pId:12, name:"照相机 "},
	{ id:13, pId:1, name:"电脑配件"},
	{ id:131, pId:13, name:"手机 "},
	{ id:122, pId:13, name:"照相机 "},
	{ id:14, pId:1, name:"服装鞋帽"},
	{ id:141, pId:14, name:"手机 "},
	{ id:42, pId:14, name:"照相机 "},
];
		
var code;
		
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#testIframe");
	demoIframe.bind("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.selectNode(zTree.getNodeByParam("id",'11'));
});	


/* 判断产品是否启用 */


$(".btn_search").click(function(){
	//跳转到新页面
	/* $(".search_style form").submit(); */
	console.log("9999");
});

/*产品-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*产品-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*产品-编辑*/
$("#btn-xs-edit").click(function(){
		var ids = [];
		var checked = $("#sample-table tr>td>label>:checked").parent().parent().next();//类数组

		checked.each(function() {
			ids.push($(this).text());
			
		});

		//校验
		if (ids.length === 0) {
			layer.alert("请选中要修改的记录");
		} else if (ids.length > 1) {
			layer.alert("只能对一条记录进行修改");
		} else {
			var id = ids.pop();
			console.log(id);
			location.href = ctx + "/backstage/picture-edit?id=" + id;
		}
	});

/*产品-删除*/
function member_del(obj,id){
	layer.confirm("是否确定删除数据", function(index) {
		var checked =$(obj).parents("tr").children("td").eq(2);
		//console.log(checked);
		var ids = [];
		//方法一
		for (var i = 0; i < checked.length; i++) {
			//将被选中复选框的id放入ids里面
			ids.push(checked.eq(i).text());
			console.log(checked.eq(i).text());
		}
		//ajax不需要表单提交
		//使用jQuery发送ajax请求
		
	});
	/* layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	}); */
} 
//批量删除
$("#btnbtn-danger").click(function() {
	//:checked：表示被选中的复选框;找到复选框所在的td，再找下层td即id
	var checked = $("#sample-table tr>td>label>:checked").parent().parent().next();
	//console.log(checked.length);
	var ids = [];
	//方法一
	for (var i = 0; i < checked.length; i++) {
		//将被选中复选框的id放入ids里面
		ids.push(checked.eq(i).text());
		//console.log(checked.eq(i).text());
	}
	//校验，给用户删除提示
	if (ids.length === 0) {
		//前端为空判断
		layer.alert("您未选中商品，请选中要删除的记录");
	} else {
		layer.confirm("是否确定删除数据", function(index) {

			//ajax不需要表单提交
			//使用jQuery发送ajax请求
			$.ajax({
				
				//请求路径；使用应用上下文保证请求路径正确
				url:ctx + "/backstage/delete",
				//请求类型(使用post方法)
				method:"post",
				//数据
				data:{
					ids: ids
				},
				dataType:"json",
				traditional: true,
				//请求成功后的回调函数，servlet响应的json数据
				success: function(resp){
					/*console.log("请求成功");
					console.log(resp);*/
					if(resp.success){
						layer.msg("成功删除"+resp.rows+"条记录");
						
						checked.parent().remove();
						
					}else{
						layer.alert(resp.error || "删除失败");
					}
				}
			});
			//关闭对话框,点确定时可以退出
			layer.close(index);
		});
	}
	

});


//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>
