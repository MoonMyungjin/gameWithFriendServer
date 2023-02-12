package com.lms.hexa.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lms.hexa.dto.ConsultingVO;

public class ConsultingRegistCommand {
	
	
	
	private String cnsltType;	
	private String mngId;
    private String cnsltApplyer;
	private String cnsltTarget;
	private String cnsltSchDate;
	private String cnsltSchTime;
	private String cnsltApplyContent;

	



	public String getCnsltType() {
		return cnsltType;
	}




	public void setCnsltType(String cnsltType) {
		this.cnsltType = cnsltType;
	}




	public String getMngId() {
		return mngId;
	}




	public void setMngId(String mngId) {
		this.mngId = mngId;
	}




	public String getCnsltApplyer() {
		return cnsltApplyer;
	}




	public void setCnsltApplyer(String cnsltApplyer) {
		this.cnsltApplyer = cnsltApplyer;
	}




	public String getCnsltTarget() {
		return cnsltTarget;
	}




	public void setCnsltTarget(String cnsltTarget) {
		this.cnsltTarget = cnsltTarget;
	}




	public String getCnsltSchDate() {
		return cnsltSchDate;
	}




	public void setCnsltSchDate(String cnsltSchDate) {
		this.cnsltSchDate = cnsltSchDate;
	}




	public String getCnsltSchTime() {
		return cnsltSchTime;
	}




	public void setCnsltSchTime(String cnsltSchTime) {
		this.cnsltSchTime = cnsltSchTime;
	}




	public String getCnsltApplyContent() {
		return cnsltApplyContent;
	}




	public void setCnsltApplyContent(String cnsltApplyContent) {
		this.cnsltApplyContent = cnsltApplyContent;
	}




	public ConsultingVO toConsultingVO() {
		ConsultingVO consulting = new ConsultingVO();
		consulting.setCnsltApplyContent(cnsltApplyContent);
		consulting.setCnsltType(cnsltType);
		consulting.setMngId(mngId);
		consulting.setCnsltApplyer(cnsltApplyer);
		consulting.setCnsltTarget(cnsltTarget);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = null;
		try {
			date = new Date(sdf.parse(cnsltSchDate).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		consulting.setCnsltSchDate(date);
		consulting.setCnsltSchTime(cnsltSchTime);
		
		return consulting;
	}




	@Override
	public String toString() {
		return "ConsultingRegistCommand [cnsltType=" + cnsltType + ", mngId=" + mngId + ", cnsltApplyer=" + cnsltApplyer
				+ ", cnsltTarget=" + cnsltTarget + ", cnsltSchDate=" + cnsltSchDate + ", cnsltSchTime=" + cnsltSchTime
				+ ", cnsltApplyContent=" + cnsltApplyContent 
				+ "]";
	}





}
