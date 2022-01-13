<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<base href="${ctx }/">
<meta charset="UTF-8">
<title>登录首页</title>
<!-- <meta http-equiv="Content-Type" content="text/html";charset="UTF-8" /> -->
	<title>用户登录</title>
	<link rel="stylesheet" type="text/css" href="assets/shop/css/base.css"/>
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
</script>
<script type="text/javascript" language="javascript"
	src="assets/shop/js/login.js"></script>
 	
</head>
<body>
	
	<!--顶部信息end-->
	
	<div class="header wrap1000">
		<a href=""><img src="assets/shop/images/logo1.png" alt="" /></a>
	</div>
	
	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户登录</h3>
			</div>
			<div class="form-bd">
				<form action="shop/login" method="post">
					<dl>
						<dt>用户名</dt>
						<dd><input type="text" name="username" class="text" placeholder="这里输入登录名" /></dd>
					</dl>
					<dl>
						<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
						<dd><input type="password" name="password" class="text" placeholder="这里输入密码" /></dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd><input type="text" name="captcha" class="text" size="10" style="width:58px;"> <img id="captcha" src="captcha" style="width: 92px; height: 36px"> <a  style="color:#999;" id="changeone">看不清，换一张</a></dd>
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd><input type="submit" value="登  录" class="submit"/> <a  class="forget">忘记密码?</a></dd>
					</dl>
				</form>
				<dl>
					<dt>&nbsp;</dt>
					<dd> 还不是本站会员？立即 <a href="shop/register" class="register" type="submit">注册</a></dd>
				</dl>
				<dl class="other">
					<dt>&nbsp;</dt>
					<dd>
						<p>您可以用合作伙伴账号登录：</p>
						<a href="" class="qq"></a>
						<a href="" class="sina"></a>
					</dd>
				</dl>
			</div>
			<div class="form-ft">
			
			</div>		
		</div>
		
		<div class="login-form-left fl">
			<img src="assets/shop/images/left.jpg" alt="" />
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