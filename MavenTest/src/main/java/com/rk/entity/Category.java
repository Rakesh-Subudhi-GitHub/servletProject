package com.rk.entity;

public class Category {


	private Integer cid;
	private String cname;
	private String description;
	
	//constructor
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(Integer cid, String cname, String description) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.description = description;
	}

	public Category(String cname, String description) {
		super();
		this.cname = cname;
		this.description = description;
	}


	//getters & setters
	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}//class
