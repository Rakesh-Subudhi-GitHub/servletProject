package com.rk.entity;

import java.sql.Date;

public class Post {

	private Integer pid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private String pic;
	private Date pdate;
	private Integer catid;
	private Integer uid;
	
	//constructor
	public Post() {
		// TODO Auto-generated constructor stub
	}

	public Post(Integer pid, String ptitle, String pcontent, String pcode, String pic,Date pdate, Integer catid,Integer uid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pic = pic;
		this.pdate=pdate;
		this.catid = catid;
		this.uid=uid;
	}

	public Post(String ptitle, String pcontent, String pcode, String pic, Integer catid,Integer uid) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pic = pic;
		this.catid = catid;
		this.uid=uid;
	}

	//getters & setters
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public Integer getCatid() {
		return catid;
	}

	public void setCatid(Integer catid) {
		this.catid = catid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
}//class
