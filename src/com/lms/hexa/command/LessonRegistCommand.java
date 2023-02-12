package com.lms.hexa.command;

import com.lms.hexa.dto.LessonVO;

public class LessonRegistCommand {
	
	private String lessonAssignmentId;
	private String mngId;
	private String lroomId;
	private String laStartDate;
	private String laEndDate;
	private String laStateCode;
	private String laTimeInfo;
	private String lessonId;
	private String lessonDetail;
	
	
	public String getLessonDetail() {
		return lessonDetail;
	}

	public void setLessonDetail(String lessonDetail) {
		this.lessonDetail = lessonDetail;
	}

	public String getLessonAssignmentId() {
		return lessonAssignmentId;
	}

	public void setLessonAssignmentId(String lessonAssignmentId) {
		this.lessonAssignmentId = lessonAssignmentId;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getLroomId() {
		return lroomId;
	}

	public void setLroomId(String lroomId) {
		this.lroomId = lroomId;
	}

	public String getLaStartDate() {
		return laStartDate;
	}

	public void setLaStartDate(String laStartDate) {
		this.laStartDate = laStartDate;
	}

	public String getLaEndDate() {
		return laEndDate;
	}

	public void setLaEndDate(String laEndDate) {
		this.laEndDate = laEndDate;
	}

	public String getLaStateCode() {
		return laStateCode;
	}

	public void setLaStateCode(String laStateCode) {
		this.laStateCode = laStateCode;
	}

	public String getLaTimeInfo() {
		return laTimeInfo;
	}

	public void setLaTimeInfo(String laTimeInfo) {
		this.laTimeInfo = laTimeInfo;
	}

	public String getLessonId() {
		return lessonId;
	}

	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}

	public LessonVO toLessonVO(){
		LessonVO lesson = new LessonVO();
		
		lesson.setLessonAssignmentId(lessonAssignmentId);
		lesson.setMngId(mngId);
		lesson.setLessonRoom(lroomId);
		lesson.setLessonStartDate(laStartDate);
		lesson.setLessonEndDate(laEndDate);
		lesson.setLessonStateCode(laStateCode);
		lesson.setLessonTimeTarget(laTimeInfo);
		lesson.setLessonId(lessonId);
		lesson.setLessonDetail(lessonDetail);
		
		return lesson;
	}

	@Override
	public String toString() {
		return "LessonRegistCommand [lessonAssignmentId=" + lessonAssignmentId + ", mngId=" + mngId + ", lroomId="
				+ lroomId + ", laStartDate=" + laStartDate + ", laEndDate=" + laEndDate + ", laStateCode=" + laStateCode
				+ ", laTimeInfo=" + laTimeInfo + ", lessonId=" + lessonId + "]";
	}
	
	
}
