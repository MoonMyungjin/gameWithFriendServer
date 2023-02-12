package com.lms.hexa.dto;

public class MarkVO {

	private int markId;
	private int quesNo;
	private String isCorrect;
	private int examId;
	private int quesId;
	private String studentId;
	private String quesArea;
	private int quesScore;

	public int getMarkId() {
		return markId;
	}

	public void setMarkId(int markId) {
		this.markId = markId;
	}

	public int getQuesNo() {
		return quesNo;
	}

	public void setQuesNo(int quesNo) {
		this.quesNo = quesNo;
	}

	public String getIsCorrect() {
		return isCorrect;
	}

	public void setIsCorrect(String isCorrect) {
		this.isCorrect = isCorrect;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getQuesId() {
		return quesId;
	}

	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getQuesArea() {
		return quesArea;
	}

	public void setQuesArea(String quesArea) {
		this.quesArea = quesArea;
	}

	public int getQuesScore() {
		return quesScore;
	}

	public void setQuesScore(int quesScore) {
		this.quesScore = quesScore;
	}

}
