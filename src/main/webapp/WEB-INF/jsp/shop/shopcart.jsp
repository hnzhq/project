<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
	<base href="${ctx }/">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="assets/shop/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="assets/shop/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="assets/shop/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="assets/shop/css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="assets/shop/js/jquery.js"></script>
		
		<!-- <script type="text/javascript" src="assets/shop/js/shopcart.js"></script>
		<script type="text/javascript" src="assets/shop/js/shopnums.js"></script> -->
		<!-- 引入jquery -->
<script type="text/javascript" language="javascript"
	src="assets/public/lib/jquery/jquery-3.6.0.min.js"></script>
<!-- 引入layer 用于弹出框-->
<script type="text/javascript" language="javascript"
	src="assets/public/lib/layer/layer.js"></script>
	<script type="text/javascript">
			var ctx = "${ctx}";//客户端可看应用上下文
			var error = "${error}";//页面错误信息
			var loginname="${loginname}";
		</script>
		<script type="text/javascript" language="javascript"
			src="assets/shop/js/carts.js"></script>
	</head>

	<body>

		<!--顶部导航条-->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">亲，请登录</a>
						<a href="#" target="_top">免费注册</a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
						<div class="menu-hd"><a target="_top" class="h the-username">${users.username }</a></div>
				</div>
				<div class="topMessage home">
					<div class="menu-hd"><a href="shop/index" target="_top" class="h">商城首页</a></div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng"><a href="shop/information" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="shop/shopcart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
			</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="assets/shop/images/logo.png" /></div>
				<div class="logoBig">
					<li><img src="assets/shop/images/logobig.png" /></li>
				</div>

				<div class="search-bar pr">
					<a name="index_none_header_sysc" href="#"></a>
					<form>
						<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>

			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
				
				
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="bundle-hd">
								<div class="bd-promos">
									<div class="bd-has-promo">已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;</div>
									<div class="act-promo">
										<a href="#" target="_blank">第二支半价，第三支免费<span class="gt">&gt;&gt;</span></a>
									</div>
									<span class="list-change theme-login">编辑</span>
								</div>
							</div>
							<div class="clear"></div>
							<div class="bundle-main">
							
							
							
							
							<c:forEach items="${shopcarts }" var="sc">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check soncheck" id="J_CheckBox_170037950254" name="items[]" value="170037950254" type="checkbox">
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="javascript:ovid()" target="_blank" data-title="${sc.shopname }" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${sc.picture }" class="itempic J_ItemImg" style="height: 80px; width: 80px" id="${sc.proId }"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank" title="${sc.shopname } " class="item-title J_MakePoint" data-point="tbcart.8.11">${sc.shopname }</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											<span class="sku-line">颜色：12#川南玛瑙</span>
											<span class="sku-line">包装：裸装</span>
											<span tabindex="0" class="btn-edit-sku theme-login">修改</span>
											<i class="theme-login am-icon-sort-desc"></i>
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${sc.display }</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now " tabindex="0" >${sc.market }</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button" value="-" valId="${sc.proId }" ty="-"/>
													<input class="text_box" name="" type="text" value="1" style="width:30px;" />
													<input class="add am-btn" name="" type="button" value="+" valId="${sc.proId }" ty="+"/>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number" >${sc.market }</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a title="移入收藏夹" class="btn-fav" href="#">
                 								 移入收藏夹</a>
											<a href="javascript:void();" data-point-url="#" class="delete" shopid="${sc.id }">
                 								 删除</a>
										</div>
									</li>
								</ul>
								
								</c:forEach>
								
								
								
								<script type="text/javascript">
									$(".item-content .item-pic img").click(function(){
									console.log("fffffff");
									var id = $(this).attr("id");
									console.log(id);
									 location.href = ctx + "/shop/introduction?id=" + id; 
										});
									
									var $jia = $(".add");
									var $jian = $(".min");
									$jia.click(function() { jia(this) });
									$jian.click(function(){jian(this) });
									
									function jia(thisBtn) {
										  var newNum = parseInt($(thisBtn).prev().val());
										  console.log(newNum);
										  $(thisBtn).prev().val(newNum);
										  var price = $(thisBtn).parents("li").prev().find(".J_Price").text();
										  
										 // console.log(price);
										  $(thisBtn).parents("li").next().find(".J_ItemSum").text((newNum+1) * price);
										  sums();
										 };
									function jian(thisBtn) {
										  if ($(thisBtn).next().val() >= 1) {
										   var newNum = $(thisBtn).next().val();
										  // console.log(newNum);
										   $(thisBtn).next().val(newNum);
										  }
										  var price = $(thisBtn).parents("li").prev().find(".J_Price").text();
										  $(thisBtn).parents("li").next().find(".J_ItemSum").text((newNum-1) * price);
										 sums();
									};
									
									
									//ajax删除
									$(".delete").click(function() {
										//:checked：表示被选中的复选框;找到复选框所在的td，再找下层td即id
										console.log("6666");
										var th= $(this);
										var id = th.attr("shopid");
										
										console.log(id);
										layer.confirm("是否确定删除数据", function(index) {
												$.ajax({
													//请求路径；使用应用上下文保证请求路径正确
													url:ctx + "/shop/cartdelete",
													//请求类型(使用post方法)
													method:"post",
													data:{
														id: id
													},
													dataType:"json",
													traditional: true,
													//请求成功后的回调函数，servlet响应的json数据
													success: function(resp){
														//console.log("请求成功");
														//console.log(resp);
														if(resp.success){
														//console.log("77777");
															th.parents(".item-content").remove();
															
														}else{
															layer.alert(resp.error || "删除失败");
														}
													}
												});
												//关闭对话框,点确定时可以退出
												layer.close(index);
											});
										
										

									});

								</script>
								
													
								
								
								
							</div>
						</div>
					</tr>
					
					
					
					
					
					
				<div class="clear"></div>
			
				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="operations">
						<a href="#" hidefocus="true" class="deleteAll">删除</a>
						<a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
						<div class="pay-form">
    						<form  action="shop/pay" method="post">
           						<input name="shopId" type="hidden">
           						<input name="num" type="hidden">
           						<input name="sum" type="hidden">
           					</form>
    					</div>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span>
							<em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">￥<em id="J_Total">0.00</em></strong>
						</div>
						
						
    					
						<div class="btn-area">
							<a  id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span>加入&nbsp;订单</span></a>
						</div>
						
					</div>

				</div>
				
				
				<!-- 全选和取消全选 -->
				<script type="text/javascript">
					$(function() {
					//表格全选与取消全选
						$("#J_SelectAllCbx2").click(function() {
							
						var checked = $(this).prop("checked");
						//让表格的选项与总选项一致
						 $(".cart-checkbox>:checkbox").prop("checked", checked);
						sums();
							});
					
					});
					
					$(".cart-checkbox .soncheck").click(function(){
						var soncheck=$(".cart-checkbox .soncheck");
						//console.log(soncheck.length);
					    sums();
					});
					
					function sums() {
				    	var nums = 0;
					    var total = 0;
					    $(".cart-checkbox .soncheck").each(function () {
				            if ($(this).is(":checked")) {
				            	
				                var many = parseFloat($(this).parents(".item-content").find(".J_ItemSum").text());
				                //console.log(many);
				                var num =  parseInt($(this).parents(".item-content").find(".text_box").val());
								//console.log(num);
				                total += many;
				                nums += num;
				            }
				        })
				         $("#J_SelectedItemsCount").text(nums);
				         $("#J_Total").text(total);
					    
				    };
					
					$("#J_Go").click(function(){
						
						var proIds= [];
						var nums = [];
						var sum =$("#J_Total").text();
						console.log(sum);
						var checked = $(".cart-checkbox>:checked");
						for(var rod of checked){
							var proId = $(rod).parents(".item-content").find(".J_ItemImg").attr("id");
							var num = $(rod).parents(".item-content").find(".text_box").val();
							console.log(proId+" "+num);
							proIds.push(proId);
							nums.push(num);
						}
						var shopIds =$(".pay-form form [name=shopId]").val(proIds);
						var numm = $(".pay-form form [ name=num]"). val(nums);
						$(".pay-form form [name=sum]"). val(sum);
						console.log(sum);
						console.log(shopIds);
						console.log (numm) ;
						$(".pay-form form").submit();
						
					});
					
					
						 
					
					
				</script>
				
				
				
				

				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="shop/paymany">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
					
						</p>
					</div>
				</div>
				</div>
			</div>

			<!--操作页面-->

			<div class="theme-popover-mask"></div>

			<div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="关闭" class="close">×</a>
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">

						<div class="theme-signin-left">

							<li class="theme-options">
								<div class="cart-title">颜色：</div>
								<ul>
									<li class="sku-line selected">12#川南玛瑙<i></i></li>
									<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
								</ul>
							</li>
							<li class="theme-options">
								<div class="cart-title">包装：</div>
								<ul>
									<li class="sku-line selected">包装：裸装<i></i></li>
									<li class="sku-line">两支手袋装（送彩带）<i></i></li>
								</ul>
							</li>
							<div class="theme-options">
								<div class="cart-title number">数量</div>
								<dd>
									<input class="min am-btn am-btn-default" name="" type="button" value="-" />
									<input class="text_box" name="" type="text" value="1" style="width:30px;" />
									<input class="add am-btn am-btn-default" name="" type="button" value="+" />
									<span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
								</dd>

							</div>
							<div class="clear"></div>
							<div class="btn-op">
								<div class="btn am-btn am-btn-warning">确认</div>
								<div class="btn close am-btn am-btn-warning">取消</div>
							</div>

						</div>
						<div class="theme-signin-right">
							<div class="img-info">
								<img src="assets/shop/images/kouhong.jpg_80x80.jpg" />
							</div>
							<div class="text-info">
								<span class="J_Price price-now">￥39.00</span>
								<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
							</div>
						</div>

					</form>
				</div>
			</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>