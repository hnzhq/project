<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${ctx }/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="assets/backstage/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/backstage/css/style.css"/>       
        <link href="assets/backstage/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/backstage/assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/backstage/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
        <link rel="stylesheet" href="assets/backstage/assets/css/font-awesome.min.css" />
        
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
			<script src="assets/js/jquery.min.js"></script>
		<!-- <![endif]-->
		<!--[if IE]>
       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <![endif]-->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/backstage/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
        <script src="assets/backstage/assets/js/ace-elements.min.js"></script>
		<script src="assets/backstage/assets/js/ace.min.js"></script>
        <script src="assets/backstage/assets/js/bootstrap.min.js"></script>
		<script src="assets/backstage/assets/js/typeahead-bs2.min.js"></script>
        <script type="text/javascript" src="assets/backstage/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script> 
        <script src="assets/backstage/js/lrtk.js" type="text/javascript" ></script>
<title>????????????</title>
</head>

<body>
<div class=" clearfix">
 <div id="category">
    <div id="scrollsidebar" class="left_Treeview">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="widget-box side_content" >
    <div class="side_title"><a title="??????" class="close_btn"><span></span></a></div>
     <div class="side_list">
      <div class="widget-header header-color-green2">
          <h4 class="lighter smaller">??????????????????</h4>
      </div>
      <div class="widget-body">
          <div class="widget-main padding-8">
              <div  id="treeDemo" class="ztree"></div>
          </div>
  </div>
  </div>
  </div>  
  </div>
<!---->
 <iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO  SRC="backstage/product-category-add" class="page_right_style"></iframe>
 </div>
</div>
</body>
</html>
<script type="text/javascript"> 
$(function() { 
	$("#category").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false
	});
});
</script>
<script type="text/javascript">
//????????????????????????  
 $(".widget-box").height($(window).height()); 
 $(".page_right_style").width($(window).width()-220);
  //?????????????????????????????? ??????  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".page_right_style").width($(window).width()-220);
	})
 
/**************/
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
	{ id:1, pId:0, name:"??????????????????", open:true},
	{ id:11, pId:1, name:"????????????"},
	{ id:111, pId:11, name:"??????"},
	{ id:112, pId:11, name:"??????"},
	{ id:113, pId:11, name:"??????"},
	{ id:114, pId:11, name:"??????"},
	{ id:115, pId:11, name:"??????"},
	{ id:12, pId:1, name:"????????????"},
	{ id:121, pId:12, name:"?????? "},
	{ id:122, pId:12, name:"????????? "},
	{ id:13, pId:1, name:"????????????"},
	{ id:131, pId:13, name:"?????? "},
	{ id:122, pId:13, name:"????????? "},
	{ id:14, pId:1, name:"????????????"},
	{ id:141, pId:14, name:"?????? "},
	{ id:42, pId:14, name:"????????? "},
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
</script>