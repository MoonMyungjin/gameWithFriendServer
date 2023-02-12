package com.lms.hexa.dto;

public class TimeTableVO {
	
	private String timetableId;
	private String timetableDayOfWeek;
	private String timetableStartTime;
	private String timetableEndTime;
	private String timetableCategory;
	private int timetablePeriod;
	
	public String getTimetableId() {
		return timetableId;
	}
	public void setTimetableId(String timetableId) {
		this.timetableId = timetableId;
	}
	public String getTimetableDayOfWeek() {
		return timetableDayOfWeek;
	}
	public void setTimetableDayOfWeek(String timetableDayOfWeek) {
		this.timetableDayOfWeek = timetableDayOfWeek;
	}
	public String getTimetableStartTime() {
		return timetableStartTime;
	}
	public void setTimetableStartTime(String timetableStartTime) {
		this.timetableStartTime = timetableStartTime;
	}
	public String getTimetableEndTime() {
		return timetableEndTime;
	}
	public void setTimetableEndTime(String timetableEndTime) {
		this.timetableEndTime = timetableEndTime;
	}
	public String getTimetableCategory() {
		return timetableCategory;
	}
	public void setTimetableCategory(String timetableCategory) {
		this.timetableCategory = timetableCategory;
	}
	public int getTimetablePeriod() {
		return timetablePeriod;
	}
	public void setTimetablePeriod(int timetablePeriod) {
		this.timetablePeriod = timetablePeriod;
	}
	
}
