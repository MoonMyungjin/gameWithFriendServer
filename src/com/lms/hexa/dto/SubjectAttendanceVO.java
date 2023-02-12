package com.lms.hexa.dto;

public class SubjectAttendanceVO {
	
	  private String sattId;
	  private String lessonAssignmentId;
	  private String studentId;
	  private String sattTime;
	  private String sattYN;
	  private String lessonName;
	  private String studentName;
	  private String schoolName;
	  private String phone;
	  
	  
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSattId() {
		return sattId;
	}
	public void setSattId(String sattId) {
		this.sattId = sattId;
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
	public String getSattTime() {
		return sattTime;
	}
	public void setSattTime(String sattTime) {
		this.sattTime = sattTime;
	}
	public String getSattYN() {
		return sattYN;
	}
	public void setSattYN(String sattYN) {
		this.sattYN = sattYN;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	
	  
	  
}
