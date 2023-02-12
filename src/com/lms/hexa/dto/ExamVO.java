package com.lms.hexa.dto;

public class ExamVO {
	
	private int examId;
	private String examGroup;
	private String examDate;
	private String examGrade;
	private String examSemester;
	private String examQuarter;
	private String examSeg;
	private String examName;
	private String scored;
	private String studentId;
	
	
	
	
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getScored() {
		return scored;
	}

	public void setScored(String scored) {
		this.scored = scored;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public String getExamGroup() {
		return examGroup;
	}

	public void setExamGroup(String examGroup) {
		this.examGroup = examGroup;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getExamGrade() {
		return examGrade;
	}

	public void setExamGrade(String examGrade) {
		this.examGrade = examGrade;
	}

	public String getExamSemester() {
		return examSemester;
	}

	public void setExamSemester(String examSemester) {
		this.examSemester = examSemester;
	}

	public String getExamQuarter() {
		return examQuarter;
	}

	public void setExamQuarter(String examQuarter) {
		this.examQuarter = examQuarter;
	}

	public String getExamSeg() {
		return examSeg;
	}

	public void setExamSeg(String examSeg) {
		this.examSeg = examSeg;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

}
