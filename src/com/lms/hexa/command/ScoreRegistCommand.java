package com.lms.hexa.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lms.hexa.dto.ScoreVO;

public class ScoreRegistCommand {
	private String subExamId;
	private String attachGroupId;
	private List<MultipartFile> uploadFile;
	private String[] deleteFile;
	
	
	
	
	
	public String getSubExamId() {
		return subExamId;
	}
	public void setSubExamId(String subExamId) {
		this.subExamId = subExamId;
	}
	public String getAttachGroupId() {
		return attachGroupId;
	}
	public void setAttachGroupId(String attachGroupId) {
		this.attachGroupId = attachGroupId;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	public ScoreVO toScoreVO() {
		ScoreVO scoreVO = new ScoreVO();
		scoreVO.setSubExamId(Integer.parseInt(this.subExamId));
		
		return scoreVO;
	}
	
}
