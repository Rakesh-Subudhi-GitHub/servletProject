package com.rk.entity;

import java.sql.Date;

public class User {

private Integer id;
	
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about="hey ! I am using TechBar..";
	private String profile_img;
	private Date regDate;

	//constructor
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, String name, String email, String password, String gender, String about,String profile_img ) {

		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.profile_img=profile_img;
	}


	public User(String name, String email, String password, String gender, String about) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

	//getters & setters
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date date) {
		this.regDate = date;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
}//class
