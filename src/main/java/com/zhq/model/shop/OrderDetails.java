package com.zhq.model.shop;

public class OrderDetails {
	private Integer id;
	private Integer proId;// 商品号
	private String orderId;
	private String shopname;
	private Float zongjia;
	private Float price;
	private Integer num;// 商品的数量
	private String picture;// 商品图片

	public Float getZongjia() {
		return zongjia;
	}

	public void setZongjia(Float zongjia) {
		this.zongjia = zongjia;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
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

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
