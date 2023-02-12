package com.lms.hexa.dto;

import java.util.Date;

public class AttachVO {
	
	private int attachGroupId;				// 첨부파일 그룹번호
	private int attachId;			// 고유번호
	private String attachPath;		// 파일 경로
	private String attachName;		// 파일명
	private String attachType;		// 파일형식
	private String attachWriter;	// 등록자
	private Date attachDate;		// 등록일
	private String attachOrigin;
	
	
	public String getAttachOrigin() {
		return attachOrigin;
	}
	public void setAttachOrigin(String attachOrigin) {
		this.attachOrigin = attachOrigin;
	}
	public int getAttachGroupId() {
		return attachGroupId;
	}
	public void setAttachGroupId(int attachGroupId) {
		this.attachGroupId = attachGroupId;
	}
	public int getAttachId() {
		return attachId;
	}
	public void setAttachId(int attachId) {
		this.attachId = attachId;
	}
	public String getAttachPath() {
		return attachPath;
	}
	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}
	public String getAttachName() {
		return attachName;
	}
	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	public String getAttachType() {
		return attachType;
	}
	public void setAttachType(String attachType) {
		this.attachType = attachType;
	}
	public String getAttachWriter() {
		return attachWriter;
	}
	public void setAttachWriter(String attachWriter) {
		this.attachWriter = attachWriter;
	}
	public Date getAttachDate() {
		return attachDate;
	}
	public void setAttachDate(Date attachDate) {
		this.attachDate = attachDate;
	}
	
	
}
