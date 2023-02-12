package com.lms.hexa.command;

import com.lms.hexa.dto.GoWorkVO;

public class ChangeGoWorkStatusCommand {
	private String goWorkDate;
	private String mngId;
	private String goWorkReason;
	
	
	public String getGoWorkReason() {
		return goWorkReason;
	}
	public void setGoWorkReason(String goWorkReason) {
		this.goWorkReason = goWorkReason;
	}
	public String getGoWorkDate() {
		return goWorkDate;
	}
	public void setGoWorkDate(String goWorkDate) {
		this.goWorkDate = goWorkDate;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	
	public GoWorkVO toGoWorkVO() {
		GoWorkVO work = new GoWorkVO();
		work.setMngId(mngId);
		work.setGoWorkDate(goWorkDate);
		work.setGoWorkReason(goWorkReason);
		return work;
	}
	
}
