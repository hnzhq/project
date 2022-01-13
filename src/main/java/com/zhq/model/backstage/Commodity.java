package com.zhq.model.backstage;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Commodity {
	private Integer id;
	private String productID;// 产品编号
	private String comname;// 产品名称
	private String place;// 产地
	private String material;// 材质
	private String brand;// 品牌
	private Float weight;// 重量
	private String unit;// 单位
	private Float display;// 展示价格，现价
	private Float market;// 市场价格，原价
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date intime;// 加入时间
	private String examine;// 是否检验
	private String iscnable;// 是否启用
	private String picture;// 图片地址

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getIscnable() {
		return iscnable;
	}

	public void setIscnable(String iscnable) {
		this.iscnable = iscnable;
	}

	public String getLocalIntime() {
		if (intime == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(intime);
	}

	public String getExamine() {
		return examine;
	}

	public void setExamine(String examine) {
		this.examine = examine;
	}

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Float getDisplay() {
		return display;
	}

	public void setDisplay(Float display) {
		this.display = display;
	}

	public Float getMarket() {
		return market;
	}

	public void setMarket(Float market) {
		this.market = market;
	}

}
