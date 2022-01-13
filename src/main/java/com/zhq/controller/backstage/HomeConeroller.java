package com.zhq.controller.backstage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backstage/")
public class HomeConeroller {

	// 产品分类
	@GetMapping(value = { "Category_Manage", "Category_Manage/" })
	public String toCategory() {
		return "backstage/Category_Manage";
	}

	// 添加产品分类
	@GetMapping(value = { "product-category-add", "product-category-add/" })
	public String toproductCategory() {
		return "backstage/product-category-add";
	}

	// 系统设置
	@GetMapping(value = { "Systems", "Systems/" })
	public String toSystems() {
		return "backstage/Systems";
	}

	// 商品订单
	@GetMapping(value = { "Order_handling", "Order_handling/" })
	public String toOrderhandling() {
		return "backstage/Order_handling";
	}

	// 添加文章
	@GetMapping(value = { "article_add", "article_add/" })
	public String toArticleadd() {
		return "backstage/article_add";
	}

}
