$(function(){
	
	if(error){
		layer.alert(error);
	}
	if(successful){
		layer.confirm('是否进入登录界面?',{
			btn:['确认','取消']
		},function(){
			location.href = ctx+"/shop/login";
		},function(){
			location.href = ctx+"/shop/register";
		})
	}
});