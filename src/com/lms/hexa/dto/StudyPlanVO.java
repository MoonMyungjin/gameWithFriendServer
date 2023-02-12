package com.lms.hexa.dto;

public class StudyPlanVO {

	
	
	private int splanId;
	private String splanWeek;
	private int splanTargettime;
	private int splanActualtime;
	private String studentId;
	private String splanFeedback;
	
	private String mngSubject;
	private String ssplanDetail;
	private int ssplanAchievement;
	
	private String dsplanDay;
	private String dsplanDetail;
	private int dsplanAchievement;
	
	private String studentName;
	private String mngId;
	private String mngName;

	
	private String parentId;
	
	
	
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	
	@Override
	public String toString() {
		return "StudyPlanVO [splanId=" + splanId + ", splanWeek=" + splanWeek + ", splanTargettime=" + splanTargettime
				+ ", splanActualtime=" + splanActualtime + ", studentId=" + studentId + ", splanFeedback="
				+ splanFeedback + ", mngSubject=" + mngSubject + ", ssplanDetail=" + ssplanDetail
				+ ", ssplanAchievement=" + ssplanAchievement + ", dsplanDay=" + dsplanDay + ", dsplanDetail="
				+ dsplanDetail + ", dsplanAchievement=" + dsplanAchievement + "]";
	}
	public int getSplanId() {
		return splanId;
	}
	public void setSplanId(int splanId) {
		this.splanId = splanId;
	}
	public String getSplanWeek() {
		return splanWeek;
	}
	public void setSplanWeek(String splanWeek) {
		this.splanWeek = splanWeek;
	}
	public int getSplanTargettime() {
		return splanTargettime;
	}
	public void setSplanTargettime(int splanTargettime) {
		this.splanTargettime = splanTargettime;
	}
	public int getSplanActualtime() {
		return splanActualtime;
	}
	public void setSplanActualtime(int splanActualtime) {
		this.splanActualtime = splanActualtime;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getMngSubject() {
		return mngSubject;
	}
	public void setMngSubject(String mngSubject) {
		this.mngSubject = mngSubject;
	}
	public String getSsplanDetail() {
		return ssplanDetail;
	}
	public void setSsplanDetail(String ssplanDetail) {
		this.ssplanDetail = ssplanDetail;
	}
	public int getSsplanAchievement() {
		return ssplanAchievement;
	}
	public void setSsplanAchievement(int ssplanAchievement) {
		this.ssplanAchievement = ssplanAchievement;
	}
	public String getDsplanDay() {
		return dsplanDay;
	}
	public void setDsplanDay(String dsplanDay) {
		this.dsplanDay = dsplanDay;
	}
	public String getDsplanDetail() {
		return dsplanDetail;
	}
	public void setDsplanDetail(String dsplanDetail) {
		this.dsplanDetail = dsplanDetail;
	}
	public int getDsplanAchievement() {
		return dsplanAchievement;
	}
	public void setDsplanAchievement(int dsplanAchievement) {
		this.dsplanAchievement = dsplanAchievement;
	}
	public String getSplanFeedback() {
		return splanFeedback;
	}
	public void setSplanFeedback(String splanFeedback) {
		this.splanFeedback = splanFeedback;
	}
	



}
