package com.lms.hexa.dto;

import java.util.Date;

public class NoticeVO {
	
	private int noticeId;
	private String noticeTitle;
	private Date noticeRegdate;
	private String noticeContent;
	private String mngId;
	private String mngName;
	private String url;
	private String contentUrl;
	
	
	
	public String getContentUrl() {
		return contentUrl;
	}
	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public Date getNoticeRegdate() {
		return noticeRegdate;
	}
	public void setNoticeRegdate(Date noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	

}
