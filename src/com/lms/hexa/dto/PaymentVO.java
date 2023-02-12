package com.lms.hexa.dto;

import java.util.Date;

public class PaymentVO {

	
	
	private String paymentId;         
	private int paymentPrice;      
	private Date paymentDate;      
	private String parentId;          
	private int lessonassignmentId;
	private String paymentDuedate;    
	private String paymentMonths;
	
	private String studentName;
	private String studentId;
	private String lessonName;
	private int lessonPrice;
	private int lessonId;
	private String mngHp;

	
	
	

	public String getMngHp() {
		return mngHp;
	}
	public void setMngHp(String mngHp) {
		this.mngHp = mngHp;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public int getLessonPrice() {
		return lessonPrice;
	}
	public void setLessonPrice(int lessonPrice) {
		this.lessonPrice = lessonPrice;
	}
	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public int getLessonassignmentId() {
		return lessonassignmentId;
	}
	public void setLessonassignmentId(int lessonassignmentId) {
		this.lessonassignmentId = lessonassignmentId;
	}
	public String getPaymentDuedate() {
		return paymentDuedate;
	}
	public void setPaymentDuedate(String paymentDuedate) {
		this.paymentDuedate = paymentDuedate;
	}
	public String getPaymentMonths() {
		return paymentMonths;
	}
	public void setPaymentMonths(String paymentMonths) {
		this.paymentMonths = paymentMonths;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentId=" + paymentId + ", paymentPrice=" + paymentPrice + ", paymentDate=" + paymentDate
				+ ", parentId=" + parentId + ", lessonassignmentId=" + lessonassignmentId + ", paymentDuedate="
				+ paymentDuedate + ", paymentMonths=" + paymentMonths + ", studentName=" + studentName + ", studentId="
				+ studentId + ", lessonName=" + lessonName + ", lessonPrice=" + lessonPrice + ", lessonId=" + lessonId
				+ ", mngHp=" + mngHp + "]";
	}     
	









	



}
