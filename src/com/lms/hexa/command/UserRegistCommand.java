package com.lms.hexa.command;

import com.lms.hexa.dto.UserVO;

public class UserRegistCommand {
	
	private String id;
	private String pw;
	private String category;
	private String isFirstLogin;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIsFirstLogin() {
		return isFirstLogin;
	}
	public void setIsFirstLogin(String isFirstLogin) {
		this.isFirstLogin = isFirstLogin;
	}
	
	public UserVO toUserVO() {
		UserVO user = new UserVO();
		user.setId(id);
		user.setPw(pw);
		user.setCategory(category);
		user.setIsFirstLogin(isFirstLogin);
		
		return user;
	}
}
