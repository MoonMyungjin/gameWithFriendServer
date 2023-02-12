package com.lms.hexa.dto;


public class UnPaymentVO {

	
	

	
	private int paymentPrice;      
	private String paymentDuedate; 
	private String studentName;
	private String studentGradeCategoryCode;
	private String studentGrade;
	private String className;
	private String parentName;
	private String parentHp;
	private String studentId;
	
	
	
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentHp() {
		return parentHp;
	}
	public void setParentHp(String parentHp) {
		this.parentHp = parentHp;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public String getPaymentDuedate() {
		return paymentDuedate;
	}
	public void setPaymentDuedate(String paymentDuedate) {
		this.paymentDuedate = paymentDuedate;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentGradeCategoryCode() {
		return studentGradeCategoryCode;
	}
	public void setStudentGradeCategoryCode(String studentGradeCategoryCode) {
		this.studentGradeCategoryCode = studentGradeCategoryCode;
	}
	public String getStudentGrade() {
		return studentGrade;
	}
	public void setStudentGrade(String studentGrade) {
		this.studentGrade = studentGrade;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}

	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	@Override
	public String toString() {
		return "UnPaymentVO [paymentPrice=" + paymentPrice + ", paymentDuedate=" + paymentDuedate + ", studentName="
				+ studentName + ", studentGradeCategoryCode=" + studentGradeCategoryCode + ", studentGrade="
				+ studentGrade + ", className=" + className + ", parentName=" + parentName + ", parentHp=" + parentHp
				+ ", studentId=" + studentId + "]";
	}
	


	



}
