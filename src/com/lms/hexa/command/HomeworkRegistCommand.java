package com.lms.hexa.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lms.hexa.dto.HomeworkVO;

public class HomeworkRegistCommand {
	
	private String hwkId;
	private String hwkName;
	private String hwkDuedate;
	private String hwkContent;
	private String lessonassignmentId;
	private String studentId;
	private String studentInfoStr;
	private String managerId;
	private List<MultipartFile> uploadFile;
	private String[] deleteFile;
	private String attachGroupId;
	
	public String getHwkId() {
		return hwkId;
	}
	public void setHwkId(String hwkId) {
		this.hwkId = hwkId;
	}
	public String getHwkName() {
		return hwkName;
	}
	public void setHwkName(String hwkName) {
		this.hwkName = hwkName;
	}
	public String getHwkDuedate() {
		return hwkDuedate;
	}
	public void setHwkDuedate(String hwkDuedate) {
		this.hwkDuedate = hwkDuedate;
	}
	public String getHwkContent() {
		return hwkContent;
	}
	public void setHwkContent(String hwkContent) {
		this.hwkContent = hwkContent;
	}
	public String getLessonassignmentId() {
		return lessonassignmentId;
	}
	public void setLessonassignmentId(String lessonassignmentId) {
		this.lessonassignmentId = lessonassignmentId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentInfoStr() {
		return studentInfoStr;
	}
	public void setStudentInfoStr(String studentInfoStr) {
		this.studentInfoStr = studentInfoStr;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	public String getAttachGroupId() {
		return attachGroupId;
	}
	public void setAttachGroupId(String attachGroupId) {
		this.attachGroupId = attachGroupId;
	}
	
	
	@Override
	public String toString() {
		return "HomeworkRegistCommand [hwkName=" + hwkName + ", hwkDuedate=" + hwkDuedate + ", hwkContent=" + hwkContent
				+ ", lessonassignmentId=" + lessonassignmentId + ", studentId=" + studentId + ", studentInfoStr="
				+ studentInfoStr + ", uploadFile=" + uploadFile + "]";
	}
	public HomeworkVO toHomeworkVO(){
		HomeworkVO homeworkVO = new HomeworkVO();
		if(!(hwkId==null || hwkId.equals(""))) {
			homeworkVO.setHwkId(Integer.parseInt(hwkId));
		}
		homeworkVO.setHwkName(hwkName);
		homeworkVO.setHwkDuedate(hwkDuedate.replace("-", ""));
		homeworkVO.setHwkContent(hwkContent);
		homeworkVO.setLessonassignmentId(Integer.parseInt(lessonassignmentId));
		homeworkVO.setManagerId(managerId);
		
		return homeworkVO;
	}
	
}
