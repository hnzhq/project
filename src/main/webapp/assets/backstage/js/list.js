$(function() {
	
	//鼠标划过id，显示图片
/*$("#sample-table tr>td:nth-child(2)").hover(function(){
	var pos = $(this).offset();
	console.log(pos);
	console.log("ffffff");
	var lft = pos.left + $(this).width();
	console.log(ctx);
	var url = $(this).prev().data("picture");
	
	console.log(url);
	
	$("<div>").addClass("picture").css({
		top:pos.top +"px",
		left:lft+"px",
		background:"#fff url("+url+") no-repeat center center/cover"
	}).appendTo(document.body);
	
},function(){
	$(".picture").remove();
	
});
*/


//鼠标滑过，显示头像
	$("#sample-table tr>td:nth-child(2)").hover(function() {
		var pos = $(this).offset();
		console.log(pos);
		var lft = pos.left + $(this).width();
		var url = $(this).prev().data("picture");//获取头像路径

		$("<div>").addClass("picture").css({
			top: pos.top + "px",
			left: lft + "px",
			background: "#fff url(" + (ctx+url) + ") no-repeat center center/cover"
		}).appendTo(document.body);

	}, function() {
		$(".picture").remove();
	});
	
});