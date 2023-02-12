package com.lms.hexa.command;

import com.lms.hexa.dto.ParentVO;

public class ParentRegistCommand {
	
	 private String id;
	 private String parentAlarmMethodCode;
	 private String parentName;
	 private String parentEmail;
	 private String pw;
	 private String parentAlarmYn;
	 private String parentHp;
	 private String parentAlarmGo;
	 private String parentAlarmOut;
	 private String parentAlarmGetOn;
	 private String parentAlarmGetOff;
	 private String parentDivisionCode;
	 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getParentAlarmMethodCode() {
		return parentAlarmMethodCode;
	}
	public void setParentAlarmMethodCode(String parentAlarmMethodCode) {
		this.parentAlarmMethodCode = parentAlarmMethodCode;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentEmail() {
		return parentEmail;
	}
	public void setParentEmail(String parentEmail) {
		this.parentEmail = parentEmail;
	}
	public String getParentAlarmYn() {
		return parentAlarmYn;
	}
	public void setParentAlarmYn(String parentAlarmYn) {
		this.parentAlarmYn = parentAlarmYn;
	}
	public String getParentHp() {
		return parentHp;
	}
	public void setParentHp(String parentHp) {
		this.parentHp = parentHp;
	}
	public String getParentAlarmGo() {
		return parentAlarmGo;
	}
	public void setParentAlarmGo(String parentAlarmGo) {
		this.parentAlarmGo = parentAlarmGo;
	}
	public String getParentAlarmOut() {
		return parentAlarmOut;
	}
	public void setParentAlarmOut(String parentAlarmOut) {
		this.parentAlarmOut = parentAlarmOut;
	}
	public String getParentAlarmGetOn() {
		return parentAlarmGetOn;
	}
	public void setParentAlarmGetOn(String parentAlarmGetOn) {
		this.parentAlarmGetOn = parentAlarmGetOn;
	}
	public String getParentAlarmGetOff() {
		return parentAlarmGetOff;
	}
	public void setParentAlarmGetOff(String parentAlarmGetOff) {
		this.parentAlarmGetOff = parentAlarmGetOff;
	}
	public String getParentDivisionCode() {
		return parentDivisionCode;
	}
	public void setParentDivisionCode(String parentDivisionCode) {
		this.parentDivisionCode = parentDivisionCode;
	}

	public ParentVO toParentVO() {
		ParentVO parent = new ParentVO();
		
		parent.setParentAlarmGetOff(parentAlarmGetOff);
		parent.setParentAlarmGetOn(parentAlarmGetOn);
		parent.setParentAlarmGo(parentAlarmGo);
		parent.setParentAlarmMethodCode(parentAlarmMethodCode);
		parent.setParentAlarmOut(parentAlarmOut);
		parent.setParentAlarmYn(parentAlarmYn);
		parent.setParentDivisionCode(parentDivisionCode);
		parent.setParentEmail(parentEmail);
		parent.setParentHp(parentHp);
		parent.setId(id);
		parent.setParentName(parentName);
		parent.setPw(pw);
		
		return parent;
		
	}
}
