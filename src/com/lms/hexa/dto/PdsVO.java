package com.lms.hexa.dto;

import java.util.Date;
import java.util.List;

public class PdsVO {
	
	private int pdsId;
	private String pdsTitle;
	private String mngId;
	private String pdsContent;
	private String pdsViews;
	private Date pdsWriteDate;
	private Date pdsModifyDate;
	private Date pdsStartDate;
	private Date pdsEndDate;
	private String pdsPoint;
	private String pdsDist;
	private String mngName;
	
	private List<AttachVO> attachList;
	
	public List<AttachVO> getAttachList(){
		return attachList;
	}
	
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	
	public int getPdsId() {
		return pdsId;
	}
	public void setPdsId(int pdsId) {
		this.pdsId = pdsId;
	}
	public String getPdsTitle() {
		return pdsTitle;
	}
	public void setPdsTitle(String pdsTitle) {
		this.pdsTitle = pdsTitle;
	}
	
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getPdsContent() {
		return pdsContent;
	}
	public void setPdsContent(String pdsContent) {
		this.pdsContent = pdsContent;
	}
	public String getPdsViews() {
		return pdsViews;
	}
	public void setPdsViews(String pdsViews) {
		this.pdsViews = pdsViews;
	}
	public Date getPdsWriteDate() {
		return pdsWriteDate;
	}
	public void setPdsWriteDate(Date pdsWriteDate) {
		this.pdsWriteDate = pdsWriteDate;
	}
	public Date getPdsModifyDate() {
		return pdsModifyDate;
	}
	public void setPdsModifyDate(Date pdsModifyDate) {
		this.pdsModifyDate = pdsModifyDate;
	}
	public Date getPdsStartDate() {
		return pdsStartDate;
	}
	public void setPdsStartDate(Date pdsStartDate) {
		this.pdsStartDate = pdsStartDate;
	}
	public Date getPdsEndDate() {
		return pdsEndDate;
	}
	public void setPdsEndDate(Date pdsEndDate) {
		this.pdsEndDate = pdsEndDate;
	}
	public String getPdsPoint() {
		return pdsPoint;
	}
	public void setPdsPoint(String pdsPoint) {
		this.pdsPoint = pdsPoint;
	}
	public String getPdsDist() {
		return pdsDist;
	}
	public void setPdsDist(String pdsDist) {
		this.pdsDist = pdsDist;
	}

	public String getMngName() {
		return mngName;
	}

	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	
	
	
}
