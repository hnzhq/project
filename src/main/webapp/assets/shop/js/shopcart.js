jQuery(function(){
	/* 购物车商品加减 */
	jQuery(".am-btn").goodnums({zid:'J_Total',xclass:'J_ItemSum',max:5,min:1,typ:'+'});
	
	/* 删除购物车商品 */
	jQuery(".delete").goodDelete({zid:'J_Total',xclass:'J_ItemSum'});
});