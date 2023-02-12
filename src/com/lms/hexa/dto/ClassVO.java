package com.lms.hexa.dto;

public class ClassVO {
	
	private String classId;
	private String className;
	private String classPrice;
	private String mngId;
	private String classRoom;
	private String studentId;
	private String ctlId;
	private String lessonId;
	private String mngName;
	private int lessonNum;
	private int lroomMaxNo;
	
	
	
	public int getLessionNuM() {
		return lessonNum;
	}
	public void setLessionNuM(int lessonNum) {
		this.lessonNum = lessonNum;
	}
	public int getLroomMaxNo() {
		return lroomMaxNo;
	}
	public void setLroomMaxNo(int lroomMaxNo) {
		this.lroomMaxNo = lroomMaxNo;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(String classPrice) {
		this.classPrice = classPrice;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getCtlId() {
		return ctlId;
	}
	public void setCtlId(String ctlId) {
		this.ctlId = ctlId;
	}
	public String getLessonId() {
		return lessonId;
	}
	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	
}
