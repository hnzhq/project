<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx }/">
<meta charset="UTF-8">
<title>注册</title>
	<link rel="stylesheet" type="text/css" href="assets/shop/css/base.css" />
	<link rel="stylesheet" type="text/css" href="assets/shop/css/global.css" />
	<link rel="stylesheet" type="text/css" href="assets/shop/css/login-register.css" />
	<!-- 引入jquery -->
<script type="text/javascript" language="javascript"
	src="assets/public/lib/jquery/jquery-3.6.0.min.js"></script>
<!-- 引入layer 用于弹出框-->
<script type="text/javascript" language="javascript"
	src="assets/public/lib/layer/layer.js"></script>
<script type="text/javascript">
	var ctx = "${ctx}";
	var error = "${error}";//页面错误信息
	var successful= "${successful}"
</script>
<script type="text/javascript" language="javascript"
	src="assets/shop/js/register.js"></script>


</head>


<body>
	<div class="header wrap1000">
		<a href=""><img src="assets/shop/images/logo.png" alt="" /></a>
	</div>
	
	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户注册</h3>
			</div>
			<div class="form-bd">
				<form name="form1" action="" method="POST">
					<dl>
						<dt>用户名</dt>
						<dd><input type="text" name="username" class="text" placeholder="请输入用户名" /></dd>
					</dl>
					<dl>
						<dt>密码</dt>
						<dd><input type="password" name="password1" class="text" placeholder="请输入你的密码" /></dd>
					</dl>
					<dl>
						<dt>确认密码</dt>
						<dd><input type="password" name="password2" class="text" placeholder="请再次输入你的密码"/></dd>
					</dl>
					<dl>
						<dt>邮箱</dt>
						<dd><input type="text" name="email" class="text" placeholder="请输入你的邮箱" /></dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd><input type="text" name="captcha" class="text" size="10" style="width:58px;"> <img id="captcha" src="captcha" style="width: 92px; height: 36px"> <a  style="color:#999;" id="changeone">看不清，换一张</a></dd>
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd><input type="submit" value="立即注册" class="submit"/> <input type= "checkbox" checked="checked"/>阅读并同意<a href="" class="forget">服务协议</a></dd>
					</dl>
				</form>
				
			</div>
			<div class="form-ft">
			
			</div>		
		</div>
		
		<div class="login-form-left fl">
			<dl class="func clearfix">
				<dt>注册之后您可以</dt>
				<dd class="ico05"><i></i>购买商品支付订单</dd>
				<dd class="ico01"><i></i>申请开店销售商品</dd>
				<dd class="ico03"><i></i>空间好友推送分享</dd>
				<dd class="ico02"><i></i>收藏商品关注店铺</dd>
				<dd class="ico06"><i></i>商品资讯服务评价</dd>
				<dd class="ico04"><i></i>安全交易诚信无忧</dd>
			</dl>
			
			<div class="if">
				<h2>如果您是本站用户</h2>
				<p>我已经注册过账号，立即 <a href="shop/login" class="register">登录</a> 或是 <a href="" class="findpwd">找回密码？</a></p>
			</div>
		</div>
	</div>
	
	<div class="footer clear wrap1000">
		<p> <a href="">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a href="">关于ShopCZ</a> | <a href="">联系我们</a></p>
		<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
	</div>
	
	
</body>
<script type="text/javascript">
	var changeone = document.querySelector("#changeone");
	var img = document.querySelector("#captcha");
	changeone.addEventListener("click", function() {
		/* console.log("44444"); */
		 img.src = ctx + "/captcha?id" + new Date().getTime();  
	});
</script>
</html>