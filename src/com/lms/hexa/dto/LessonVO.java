package com.lms.hexa.dto;

public class LessonVO {
	
	private String lessonId;
	private String lessonName;
	private String lessonRoom;
	private String lessonStartDate;
	private String lessonEndDate;
	private int lessonPrice;
	private String lessonSubjectType;
	private String lessonSubjectTypeName;
	private int lessonMaxNo;
	private String lessonGrade;
	private String lessonDetail;
	private String mngId;
	private String mngName;
	private String lessonGradeCategoryCode;
	private String lessonStateCode;
	private String lessonSyllabus;
	private String timetableId;
	private String lessonTimeTarget;
	private String lessonGradeInteGrate;
	private int lessonHours;
	private String lessonAssignmentId;
	private String studentId;
	private String lRoomId;
	private String className;
	private String soonclose;
	
	@Override
	public String toString() {
		return "LessonVO [lessonId=" + lessonId + ", lessonName=" + lessonName + ", lessonRoom=" + lessonRoom
				+ ", lessonStartDate=" + lessonStartDate + ", lessonEndDate=" + lessonEndDate + ", lessonPrice="
				+ lessonPrice + ", lessonSubjectType=" + lessonSubjectType + ", lessonSubjectTypeName="
				+ lessonSubjectTypeName + ", lessonMaxNo=" + lessonMaxNo + ", lessonGrade=" + lessonGrade
				+ ", lessonDetail=" + lessonDetail + ", mngId=" + mngId + ", lessonGradeCategoryCode="
				+ lessonGradeCategoryCode + ", lessonStateCode=" + lessonStateCode + ", lessonSyllabus="
				+ lessonSyllabus + ", timetableId=" + timetableId + ", lessonTimeTarget=" + lessonTimeTarget
				+ ", lessonGradeInteGrate=" + lessonGradeInteGrate + ", lessonHours=" + lessonHours
				+ ", lessonAssignmentId=" + lessonAssignmentId + ", studentId=" + studentId + "]";
	}
	
	public String getSoonclose() {
		return soonclose;
	}

	public void setSoonclose(String soonclose) {
		this.soonclose = soonclose;
	}

	public String getLessonId() {
		return lessonId;
	}
	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public String getLessonRoom() {
		return lessonRoom;
	}
	public void setLessonRoom(String lessonRoom) {
		this.lessonRoom = lessonRoom;
	}
	public String getLessonStartDate() {
		return lessonStartDate;
	}
	public void setLessonStartDate(String lessonStartDate) {
		this.lessonStartDate = lessonStartDate;
	}
	public String getLessonEndDate() {
		return lessonEndDate;
	}
	public void setLessonEndDate(String lessonEndDate) {
		this.lessonEndDate = lessonEndDate;
	}
	public int getLessonPrice() {
		return lessonPrice;
	}
	public void setLessonPrice(int lessonPrice) {
		this.lessonPrice = lessonPrice;
	}
	public String getLessonSubjectType() {
		return lessonSubjectType;
	}
	public void setLessonSubjectType(String lessonSubjectType) {
		this.lessonSubjectType = lessonSubjectType;
	}
	public int getLessonMaxNo() {
		return lessonMaxNo;
	}
	public void setLessonMaxNo(int lessonMaxNo) {
		this.lessonMaxNo = lessonMaxNo;
	}
	public String getLessonGrade() {
		return lessonGrade;
	}
	public void setLessonGrade(String lessonGrade) {
		this.lessonGrade = lessonGrade;
	}
	public String getLessonDetail() {
		return lessonDetail;
	}
	public void setLessonDetail(String lessonDetail) {
		this.lessonDetail = lessonDetail;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getLessonGradeCategoryCode() {
		return lessonGradeCategoryCode;
	}
	public void setLessonGradeCategoryCode(String lessonGradeCategoryCode) {
		this.lessonGradeCategoryCode = lessonGradeCategoryCode;
	}
	public String getLessonStateCode() {
		return lessonStateCode;
	}
	public void setLessonStateCode(String lessonStateCode) {
		this.lessonStateCode = lessonStateCode;
	}
	public String getLessonSyllabus() {
		return lessonSyllabus;
	}
	public void setLessonSyllabus(String lessonSyllabus) {
		this.lessonSyllabus = lessonSyllabus;
	}
	public String getTimetableId() {
		return timetableId;
	}
	public void setTimetableId(String timetableId) {
		this.timetableId = timetableId;
	}
	public String getLessonTimeTarget() {
		return lessonTimeTarget;
	}
	public void setLessonTimeTarget(String lessonTimeTarget) {
		this.lessonTimeTarget = lessonTimeTarget;
	}
	public String getLessonGradeInteGrate() {
		return lessonGradeInteGrate;
	}
	public void setLessonGradeInteGrate(String lessonGradeInteGrate) {
		this.lessonGradeInteGrate = lessonGradeInteGrate;
	}
	public int getLessonHours() {
		return lessonHours;
	}
	public void setLessonHours(int lessonHours) {
		this.lessonHours = lessonHours;
	}
	public String getLessonSubjectTypeName() {
		return lessonSubjectTypeName;
	}
	public void setLessonSubjectTypeName(String lessonSubjectTypeName) {
		this.lessonSubjectTypeName = lessonSubjectTypeName;
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
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public String getlRoomId() {
		return lRoomId;
	}
	public void setlRoomId(String lRoomId) {
		this.lRoomId = lRoomId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
}
