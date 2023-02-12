package com.lms.hexa.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lms.hexa.dto.PdsVO;

public class PdsRegistCommand {
	
	
	private String pdsTitle;
	private String pdsContent;
	private String mngId;
	private List<MultipartFile> uploadFile;
	
	
	
	public String getPdsTitle() {
		return pdsTitle;
	}

	public void setPdsTitle(String pdsTitle) {
		this.pdsTitle = pdsTitle;
	}

	public String getPdsContent() {
		return pdsContent;
	}

	public void setPdsContent(String pdsContent) {
		this.pdsContent = pdsContent;
	}

	

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}



	public PdsVO toPdsVO(){
		PdsVO pds = new PdsVO();
		pds.setPdsContent(this.pdsContent.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>",""));
		pds.setPdsTitle(this.pdsTitle);
		pds.setMngId(this.mngId);
		
		return pds;
	}
}
