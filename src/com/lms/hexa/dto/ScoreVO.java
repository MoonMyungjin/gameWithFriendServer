package com.lms.hexa.dto;

import java.util.List;

public class ScoreVO {
	 private int scoreId;
	 private String scored;
	 private int subExamId;
	 private String studentId;
	 private int attachGroupId; 
	 private String attachWriter;
	 
	 private List<AttachVO> attachList;
	 
	 private int scoreScored;
	 
	 
	 
	 
	 
	 public int getScoreScored() {
		return scoreScored;
	}
	public void setScoreScored(int scoreScored) {
		this.scoreScored = scoreScored;
	}
	public String getAttachWriter() {
		return attachWriter;
	}
	public void setAttachWriter(String attachWriter) {
		this.attachWriter = attachWriter;
	}
	public int getAttachGroupId() {
		return attachGroupId;
	}
	public void setAttachGroupId(int attachGroupId) {
		this.attachGroupId = attachGroupId;
	}
	 
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public String getScored() {
		return scored;
	}
	public void setScored(String scored) {
		this.scored = scored;
	}
	public int getSubExamId() {
		return subExamId;
	}
	public void setSubExamId(int subExamId) {
		this.subExamId = subExamId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	 
	 
}
