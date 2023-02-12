package com.lms.hexa.dto;

public class QuestionVO {

	private int quesId;
	private int examId;
	private int quesNo;
	private int quesScore;
	private String quesArea;
	private String quesDifficult;
	private String subjArea;

	public int getQuesId() {
		return quesId;
	}

	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getQuesNo() {
		return quesNo;
	}

	public void setQuesNo(int quesNo) {
		this.quesNo = quesNo;
	}

	public int getQuesScore() {
		return quesScore;
	}

	public void setQuesScore(int quesScore) {
		this.quesScore = quesScore;
	}

	public String getQuesArea() {
		return quesArea;
	}

	public void setQuesArea(String quesArea) {
		this.quesArea = quesArea;
	}

	public String getQuesDifficult() {
		return quesDifficult;
	}

	public void setQuesDifficult(String quesDifficult) {
		this.quesDifficult = quesDifficult;
	}

	public String getSubjArea() {
		return subjArea;
	}

	public void setSubjArea(String subjArea) {
		this.subjArea = subjArea;
	}
	
}
