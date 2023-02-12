package com.lms.hexa.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lms.hexa.dto.PdsVO;

public class PdsModifyCommand{
	
	private int pdsId;
	private String pdsTitle;
	private String pdsContent;
	private String[] deleteFile;
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

	public int getPdsId() {
		return pdsId;
	}

	public void setPdsId(int pdsId) {
		this.pdsId = pdsId;
	}

	public String[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}

	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public PdsVO toPdsVO(){
		PdsVO pds = new PdsVO();
		pds.setPdsId(this.pdsId);	
		pds.setPdsContent(this.pdsContent.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>",""));
		pds.setPdsTitle(this.pdsTitle);
		
		
		return pds;
	}
}






