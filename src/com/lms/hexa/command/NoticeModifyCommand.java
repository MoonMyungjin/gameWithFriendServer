package com.lms.hexa.command;

import com.lms.hexa.dto.NoticeVO;

public class NoticeModifyCommand  extends NoticeRegistCommand{
	
	private int noticeId;

	

	
	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}



	@Override
	public NoticeVO toNoticeVO(){
		NoticeVO notice = super.toNoticeVO();
		notice.setNoticeId(this.noticeId);	
		
		return notice;
	}
}






