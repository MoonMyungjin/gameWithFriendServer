package com.lms.hexa.command;

import com.lms.hexa.dto.StudentVO;

public class StudentRegistCommand {
	
	private String id;
	private String pw;
	private String name;
	private String genderCode;
	private String email;
	private String zipCode;
	private String address;
	private String address2;
	private String studentPicture;
	private String birthDate;
	private String discountReason;
	private String discountRate;
	private String payDueDate;
	private String academyRegDate;
	private String stateCode;
	private String sibling;
	private String gradeCategoryCode;
	private String grade;
	private String hp;
	private String parentId;
	private String schoolNo;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenderCode() {
		return genderCode;
	}
	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getStudentPicture() {
		return studentPicture;
	}
	public void setStudentPicture(String studentPicture) {
		this.studentPicture = studentPicture;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getDiscountReason() {
		return discountReason;
	}
	public void setDiscountReason(String discountReason) {
		this.discountReason = discountReason;
	}
	public String getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}
	public String getPayDueDate() {
		return payDueDate;
	}
	public void setPayDueDate(String payDueDate) {
		this.payDueDate = payDueDate;
	}
	public String getAcademyRegDate() {
		return academyRegDate;
	}
	public void setAcademyRegDate(String academyRegDate) {
		this.academyRegDate = academyRegDate;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	public String getSibling() {
		return sibling;
	}
	public void setSibling(String sibling) {
		this.sibling = sibling;
	}
	public String getGradeCategoryCode() {
		return gradeCategoryCode;
	}
	public void setGradeCategoryCode(String gradeCategoryCode) {
		this.gradeCategoryCode = gradeCategoryCode;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	public String getSchoolNo() {
		return schoolNo;
	}
	public void setSchoolNo(String schoolNo) {
		this.schoolNo = schoolNo;
	}
	
	public StudentVO toStudentVO() {
		
		StudentVO student = new StudentVO();
		student.setId(id);
		student.setPw(pw);
		student.setName(name);
		student.setGenderCode(genderCode);
		student.setEmail(email);
		student.setZipCode(zipCode);
		student.setAddress(address);
		student.setAddress2(address2);
		student.setBirthDate(birthDate);
		student.setStudentPicture(studentPicture);
		student.setDiscountReason(discountReason);
		student.setDiscountRate(Double.parseDouble(discountRate));
		student.setPayDueDate(payDueDate);
		student.setAcademyRegDate(academyRegDate);
		student.setStateCode(stateCode);
		student.setSibling(sibling);
		student.setGradeCategoryCode(gradeCategoryCode);
		student.setGrade(grade);
		student.setHp(hp);
		student.setParentId(parentId);
		student.setSchoolNo(schoolNo);
		
		return student;
	}
}
