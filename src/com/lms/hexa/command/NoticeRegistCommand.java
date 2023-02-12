package com.lms.hexa.command;

import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.StudyPlanVO;

public class NoticeRegistCommand {
	
	
	private String noticeTitle;
	private String noticeContent;
	private String mngId;

	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
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



	public NoticeVO toNoticeVO(){
		NoticeVO notice = new NoticeVO();
		notice.setNoticeContent(this.noticeContent);
		notice.setNoticeTitle(this.noticeTitle);
		notice.setMngId(this.mngId);
		
		return notice;
	}

}
