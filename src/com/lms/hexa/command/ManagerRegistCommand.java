package com.lms.hexa.command;

import com.lms.hexa.dto.ManagerVO;

public class ManagerRegistCommand {
	
	private String id;
	private String mngName;
	private String mngGender;
	private String mngEmail;
	private String mngAddress2;
	private String mngAddress;
	private String mngZipCode;
	private String mngPicture;
	private String mngBirthDate;
	private String mngDelete;
	private String pw;
	private String mngDeleteDate;
	private String deptId;
	private String mngEducation;
	private String mngMajor;
	private String mngGraduatedYear;
	private String mngCarrerYear;
    private String mngCertificate;
    private String mngAccountNo;
    private String mngSubjectKor;
    private String mngSubject;
    private String mngHp;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public String getMngGender() {
		return mngGender;
	}
	public void setMngGender(String mngGender) {
		this.mngGender = mngGender;
	}
	public String getMngEmail() {
		return mngEmail;
	}
	public void setMngEmail(String mngEmail) {
		this.mngEmail = mngEmail;
	}
	public String getMngAddress2() {
		return mngAddress2;
	}
	public void setMngAddress2(String mngAddress2) {
		this.mngAddress2 = mngAddress2;
	}
	public String getMngAddress() {
		return mngAddress;
	}
	public void setMngAddress(String mngAddress) {
		this.mngAddress = mngAddress;
	}
	public String getMngZipCode() {
		return mngZipCode;
	}
	public void setMngZipCode(String mngZipCode) {
		this.mngZipCode = mngZipCode;
	}
	public String getMngPicture() {
		return mngPicture;
	}
	public void setMngPicture(String mngPicture) {
		this.mngPicture = mngPicture;
	}
	public String getMngBirthDate() {
		return mngBirthDate;
	}
	public void setMngBirthDate(String mngBirthDate) {
		this.mngBirthDate = mngBirthDate;
	}
	public String getMngDelete() {
		return mngDelete;
	}
	public void setMngDelete(String mngDelete) {
		this.mngDelete = mngDelete;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMngDeleteDate() {
		return mngDeleteDate;
	}
	public void setMngDeleteDate(String mngDeleteDate) {
		this.mngDeleteDate = mngDeleteDate;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getMngEducation() {
		return mngEducation;
	}
	public void setMngEducation(String mngEducation) {
		this.mngEducation = mngEducation;
	}
	public String getMngMajor() {
		return mngMajor;
	}
	public void setMngMajor(String mngMajor) {
		this.mngMajor = mngMajor;
	}
	public String getMngGraduatedYear() {
		return mngGraduatedYear;
	}
	public void setMngGraduatedYear(String mngGraduatedYear) {
		this.mngGraduatedYear = mngGraduatedYear;
	}
	public String getMngCarrerYear() {
		return mngCarrerYear;
	}
	public void setMngCarrerYear(String mngCarrerYear) {
		this.mngCarrerYear = mngCarrerYear;
	}
	public String getMngCertificate() {
		return mngCertificate;
	}
	public void setMngCertificate(String mngCertificate) {
		this.mngCertificate = mngCertificate;
	}
	public String getMngAccountNo() {
		return mngAccountNo;
	}
	public void setMngAccountNo(String mngAccountNo) {
		this.mngAccountNo = mngAccountNo;
	}
	public String getMngSubjectKor() {
		return mngSubjectKor;
	}
	public void setMngSubjectKor(String mngSubjectKor) {
		this.mngSubjectKor = mngSubjectKor;
	}
	public String getMngSubject() {
		return mngSubject;
	}
	public void setMngSubject(String mngSubject) {
		this.mngSubject = mngSubject;
	}
	public String getMngHp() {
		return mngHp;
	}
	public void setMngHp(String mngHp) {
		this.mngHp = mngHp;
	}
    
    public ManagerVO toManagerVO() {
    	
    	ManagerVO manager = new ManagerVO();
    	manager.setDeptId(deptId);
    	manager.setId(id);
    	manager.setMngAccountNo(mngAccountNo);
    	manager.setMngAddress(mngAddress);
    	manager.setMngAddress2(mngAddress2);
    	manager.setMngBirthDate(mngBirthDate);
    	manager.setMngCarrerYear(mngCarrerYear);
    	manager.setMngCertificate(mngCertificate);
    	manager.setMngDelete(mngDelete);
    	manager.setMngDeleteDate(mngDeleteDate);
    	manager.setMngEducation(mngEducation);
    	manager.setMngEmail(mngEmail);
    	manager.setMngGender(mngGender);
    	manager.setMngGraduatedYear(mngGraduatedYear);
    	manager.setMngHp(mngHp);
    	manager.setMngMajor(mngMajor);
    	manager.setMngName(mngName);
    	manager.setMngPicture(mngPicture);
    	manager.setMngSubject(mngSubject);
    	manager.setMngSubjectKor(mngSubjectKor);
    	manager.setMngZipCode(mngZipCode);
    	manager.setPw(pw);
    	
    	return manager;
    }
}
