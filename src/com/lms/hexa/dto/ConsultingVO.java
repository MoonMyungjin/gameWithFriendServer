package com.lms.hexa.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class ConsultingVO {

	
	
   private int cnsltId;
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
   private Date cnsltSchDate;
   private String cnsltSchTime;
   private String cnsltConfirmYn;
   private String cnsltCompletionYn;
   private String cnsltApplyContent;
   private String cnsltContent;
   private String cnsltApplyer;
   private String cnsltTarget;
   private String cnsltType;
   private String studentId;
   private String mngId;
        
    	 
   private String scodeKey;
   private String scodeValue;
   private String scodeCategory;
   
   private int cnslttId;
   private int scheduleId;
 
   private String mngName;

   private String parentId;
   private String parentName;
   private String parentHp;
   private String studentName;
   private String studentHp;
   
   private String disableTime;
   private String category;

   private String schoolName;
   private String grade;
   private String className;
   
   
   private String tarketId;
   private String applyerId;
   
   private String cnsltAs;

  

@Override
public String toString() {
	return "ConsultingVO [cnsltId=" + cnsltId + ", cnsltSchDate=" + cnsltSchDate + ", cnsltSchTime=" + cnsltSchTime
			+ ", cnsltConfirmYn=" + cnsltConfirmYn + ", cnsltCompletionYn=" + cnsltCompletionYn + ", cnsltApplyContent="
			+ cnsltApplyContent + ", cnsltContent=" + cnsltContent + ", cnsltApplyer=" + cnsltApplyer + ", cnsltTarget="
			+ cnsltTarget + ", cnsltType=" + cnsltType + ", studentId=" + studentId + ", mngId=" + mngId + ", scodeKey="
			+ scodeKey + ", scodeValue=" + scodeValue + ", scodeCategory=" + scodeCategory + ", cnslttId=" + cnslttId
			+ ", scheduleId=" + scheduleId + ", mngName=" + mngName + ", parentId=" + parentId + ", parentName="
			+ parentName + ", parentHp=" + parentHp + ", studentName=" + studentName + ", studentHp=" + studentHp
			+ ", disableTime=" + disableTime + ", category=" + category + ", schoolName=" + schoolName + ", grade="
			+ grade + ", className=" + className + ", tarketId=" + tarketId + ", applyerId=" + applyerId + ", cnsltAs="
			+ cnsltAs + "]";
}
public String getCnsltAs() {
	return cnsltAs;
}
public void setCnsltAs(String cnsltAs) {
	this.cnsltAs = cnsltAs;
}
public String getTarketId() {
	return tarketId;
}
public void setTarketId(String tarketId) {
	this.tarketId = tarketId;
}
public String getApplyerId() {
	return applyerId;
}
public void setApplyerId(String applyerId) {
	this.applyerId = applyerId;
}
public String getParentName() {
	return parentName;
}
public void setParentName(String parentName) {
	this.parentName = parentName;
}
public String getParentHp() {
	return parentHp;
}
public void setParentHp(String parentHp) {
	this.parentHp = parentHp;
}
public String getStudentHp() {
	return studentHp;
}
public void setStudentHp(String studentHp) {
	this.studentHp = studentHp;
}
public String getSchoolName() {
	return schoolName;
}
public void setSchoolName(String schoolName) {
	this.schoolName = schoolName;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public String getClassName() {
	return className;
}
public void setClassName(String className) {
	this.className = className;
}
public String getCnsltSchTime() {
	return cnsltSchTime;
}
public void setCnsltSchTime(String cnsltSchTime) {
	this.cnsltSchTime = cnsltSchTime;
}
public String getStudentName() {
	return studentName;
}
public void setStudentName(String studentName) {
	this.studentName = studentName;
}
public String getParentId() {
	return parentId;
}
public void setParentId(String parentId) {
	this.parentId = parentId;
}
public int getCnslttId() {
	return cnslttId;
}
public void setCnslttId(int cnslttId) {
	this.cnslttId = cnslttId;
}
public int getScheduleId() {
	return scheduleId;
}
public void setScheduleId(int scheduleId) {
	this.scheduleId = scheduleId;
}
public String getMngName() {
	return mngName;
}
public void setMngName(String mngName) {
	this.mngName = mngName;
}
public int getCnsltId() {
	return cnsltId;
}
public void setCnsltId(int cnsltId) {
	this.cnsltId = cnsltId;
}
public Date getCnsltSchDate() {
	return cnsltSchDate;
}
public void setCnsltSchDate(Date cnsltSchDate) {
	this.cnsltSchDate = cnsltSchDate;
}
public String getCnsltConfirmYn() {
	return cnsltConfirmYn;
}
public void setCnsltConfirmYn(String cnsltConfirmYn) {
	this.cnsltConfirmYn = cnsltConfirmYn;
}
public String getCnsltCompletionYn() {
	return cnsltCompletionYn;
}
public void setCnsltCompletionYn(String cnsltCompletionYn) {
	this.cnsltCompletionYn = cnsltCompletionYn;
}
public String getCnsltApplyContent() {
	return cnsltApplyContent;
}
public void setCnsltApplyContent(String cnsltApplyContent) {
	this.cnsltApplyContent = cnsltApplyContent;
}
public String getCnsltContent() {
	return cnsltContent;
}
public void setCnsltContent(String cnsltContent) {
	this.cnsltContent = cnsltContent;
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
public String getCnsltType() {
	return cnsltType;
}
public void setCnsltType(String cnsltType) {
	this.cnsltType = cnsltType;
}
public String getStudentId() {
	return studentId;
}
public void setStudentId(String studentId) {
	this.studentId = studentId;
}
public String getMngId() {
	return mngId;
}
public void setMngId(String mngId) {
	this.mngId = mngId;
}
public String getScodeKey() {
	return scodeKey;
}
public void setScodeKey(String scodeKey) {
	this.scodeKey = scodeKey;
}
public String getScodeValue() {
	return scodeValue;
}
public void setScodeValue(String scodeValue) {
	this.scodeValue = scodeValue;
}
public String getScodeCategory() {
	return scodeCategory;
}
public void setScodeCategory(String scodeCategory) {
	this.scodeCategory = scodeCategory;
}
public String getDisableTime() {
	return disableTime;
}
public void setDisableTime(String disableTime) {
	this.disableTime = disableTime;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
 	
	
	
	
	
	

}
