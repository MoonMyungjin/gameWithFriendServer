package com.lms.hexa.command;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lms.hexa.dto.HomeworkVO;

public class HomeworkUserRegistCommand {
	
	private String hwkId;
	private String givenHwkContent;
	private String hwkIsComplete;
	private String studentId;
	private String givenHwkBadge;
	
	private List<MultipartFile> uploadFile;
	private String[] deleteFile;
	
	public String getHwkId() {
		return hwkId;
	}
	public void setHwkId(String hwkId) {
		this.hwkId = hwkId;
	}
	public String getGivenHwkContent() {
		return givenHwkContent;
	}
	public void setGivenHwkContent(String givenHwkContent) {
		this.givenHwkContent = givenHwkContent;
	}
	public String getHwkIsComplete() {
		return hwkIsComplete;
	}
	public void setHwkIsComplete(String hwkIsComplete) {
		this.hwkIsComplete = hwkIsComplete;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getGivenHwkBadge() {
		return givenHwkBadge;
	}
	public void setGivenHwkBadge(String givenHwkBadge) {
		this.givenHwkBadge = givenHwkBadge;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public String toString() {
		return "HomeworkUserRegistCommand [hwkId=" + hwkId + ", givenHwkContent=" + givenHwkContent + ", hwkIsComplete="
				+ hwkIsComplete + ", studentId=" + studentId + ", givenHwkBadge=" + givenHwkBadge + ", uploadFile="
				+ uploadFile + ", deleteFile=" + Arrays.toString(deleteFile) + "]";
	}
	public HomeworkVO toHomeworkVO(){
		HomeworkVO homeworkVO = new HomeworkVO();
		if(!(hwkId==null || hwkId.equals(""))) {
			homeworkVO.setHwkId(Integer.parseInt(hwkId));
		}
		homeworkVO.setHwkContent(givenHwkContent);
		homeworkVO.setHwkIscomplete(hwkIsComplete);
		homeworkVO.setStudentId(studentId);
		homeworkVO.setGivenHwkBadge(givenHwkBadge);
		
		return homeworkVO;
	}
	
}
