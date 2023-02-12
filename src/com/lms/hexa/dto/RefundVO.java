package com.lms.hexa.dto;


public class RefundVO {


	  
	private String studentName; 
	private String taApllydate;
	private String laStartDate;
	private String laEndDate;
	private String lessonHours;
	private String taCancledate;
	private String lessonPrice;
	private String lessonAssignmentId;
	private String studentId;
	
	
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getTaApllydate() {
		return taApllydate;
	}
	public void setTaApllydate(String taApllydate) {
		this.taApllydate = taApllydate;
	}
	public String getLaStartDate() {
		return laStartDate;
	}
	public void setLaStartDate(String laStartDate) {
		this.laStartDate = laStartDate;
	}
	public String getLessonHours() {
		return lessonHours;
	}
	public void setLessonHours(String lessonHours) {
		this.lessonHours = lessonHours;
	}
	public String getTaCancledate() {
		return taCancledate;
	}
	public void setTaCancledate(String taCancledate) {
		this.taCancledate = taCancledate;
	}
	public String getLessonPrice() {
		return lessonPrice;
	}
	public void setLessonPrice(String lessonPrice) {
		this.lessonPrice = lessonPrice;
	}
	public String getLaEndDate() {
		return laEndDate;
	}
	public void setLaEndDate(String laEndDate) {
		this.laEndDate = laEndDate;
	}
	public String getLessonAssignmentId() {
		return lessonAssignmentId;
	}
	public void setLessonAssignmentId(String lessonAssignmentId) {
		this.lessonAssignmentId = lessonAssignmentId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	@Override
	public String toString() {
		return "RefundVO [studentName=" + studentName + ", taApllydate=" + taApllydate + ", laStartDate=" + laStartDate
				+ ", laEndDate=" + laEndDate + ", lessonHours=" + lessonHours + ", taCancledate=" + taCancledate
				+ ", lessonPrice=" + lessonPrice + ", lessonAssignmentId=" + lessonAssignmentId + ", studentId="
				+ studentId + "]";
	}
		


}
