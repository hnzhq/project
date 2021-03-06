<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx }/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="assets/backstage/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/backstage/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="assets/backstage/assets/css/ace.min.css" />
		<link rel="stylesheet" type="text/css" href="assets/backstage/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" type="text/css" href="assets/backstage/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/backstage/css/style.css"/>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
			<!-- 引入jquery -->
<script type="text/javascript" language="javascript"
	src="assets/public/lib/jquery/jquery-3.6.0.min.js"></script>
<!-- 引入layer 用于弹出框-->
<script type="text/javascript" language="javascript"
	src="assets/public/lib/layer/layer.js"></script>
		<!-- <script type="text/javascript" language="javascript" src="assets/backstage/assets/js/ace-extra.min.js"></script>
		[if lt IE 9]>
		<script src="assets/backstage/assets/js/html5shiv.js"></script>
		<script src="assets/backstage/assets/js/respond.min.js"></script>
		<![endif]
		<script type="text/javascript" language="javascript" src="assets/backstage/js/jquery-1.9.1.min.js"></script>        
        <script type="text/javascript" language="javascript" src="assets/backstage/assets/layer/layer.js" type="text/javascript"></script> -->
        <script type="text/javascript" language="javascript">
	var ctx = "${ctx}";
	var error = "${error}";//页面错误信息
</script>
<script type="text/javascript" language="javascript"
	src="assets/backstage/js/login.js"></script>
 	
</head>
        
</head>

<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎后台管理界面平台</span>    
    <ul>
    <li><a href="#">返回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    <div class="loginbody">
<div class="login-container">
	<div class="center">
	     <img src="assets/backstage/images/logo1.png" />
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box widget-box no-border visible">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												管理员登录
											</h4>

											<div class="login_icon"><img src="assets/backstage/images/login.png" /></div>

							<form action="backstage/login" method="post">
								<fieldset>
									<ul>
										<li class="frame_style form_error"><label
											class="user_icon"></label><input name="adminname" type="text"
											id="adminname" /><i></i></li>
										<li class="frame_style form_error"><label
											class="password_icon"></label><input name="password"
											type="password" id="password" /><i></i></li>
										<li class="frame_style form_error"><label
											class="Codes_icon"></label><input name="captcha" type="text"
											id="Codes_text" /><i></i>
										<div class="Codes_region">
												<img id="captcha" src="captcha"
													style="width: 92px; height: 36px">
											</div></li>

									</ul>
									<div class="space"></div>

									<div class="clearfix">
										<label class="inline"> <input type="checkbox"
											class="ace"> <span class="lbl">保存密码</span>
										</label>

										<button type="submit"
											class="width-35 pull-right btn btn-sm btn-primary"
											id="login_btn" >
											<i class="icon-key"></i> 登录
										</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>

							<div class="social-or-login center">
												<span class="bigger-110">通知</span>
											</div>

											<div class="social-login center">
											本网站系统不再对IE8以下浏览器支持，请见谅。
											</div>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											

											
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
							</div><!-- /position-relative -->
						</div>
                        </div>
                        <div class="loginbm">版权所有  2016  <a href="">南京思美软件系统有限公司</a> </div><strong></strong>
</body>
<script type="text/javascript">
	
	var img = document.querySelector("#captcha");
	img.addEventListener("click", function() {
		/* console.log("44444"); */
		 img.src = ctx + "/captcha?id" + new Date().getTime();  
	});
</script>
</html>
<!-- <script>
$('#login_btn').on('click', function(){
	     var num=0;
		 var str="";
     $("input[type$='text'],input[type$='password']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		 /*  if(num>0){  return false;}	 	
          else{
			  layer.alert('登录成功！',{
               title: '提示框',				
			   icon:1,		
			  });
	          location.href="index.html";
			   layer.close(index);	
		  }		  */ 		     						
		
	});
  $(document).ready(function(){
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
		});
	  })

</script> -->