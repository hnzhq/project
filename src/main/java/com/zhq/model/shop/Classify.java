package com.zhq.model.shop;

/**
 * 商品分类
 * 
 * @author shenming
 *
 */
public class Classify {
	private Integer id;// 商品类id
	private String name;// 商品类名
	private Integer levelID;// 商品层级
	private Integer parentID;// 上级id

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLevelID() {
		return levelID;
	}

	public void setLevelID(Integer levelID) {
		this.levelID = levelID;
	}

	public Integer getParentID() {
		return parentID;
	}

	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}

}
