package com.zhq.model.shop;

public class ShopCart {
	/**
	 * 购物车属性
	 */
	private Integer id;
	private Integer proId; // 商品id
	private String shopname; // 商品名
	private String username; // 用户名
	private String picture; // 商品图片
	private Float market; // 商品现价
	private Float display;

	public Float getDisplay() {
		return display;
	}

	public void setDisplay(Float display) {
		this.display = display;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Float getMarket() {
		return market;
	}

	public void setMarket(Float market) {
		this.market = market;
	}

}
