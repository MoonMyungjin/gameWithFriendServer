package com.lms.hexa.dto;

import java.util.Date;
import java.util.List;

public class HomeworkVO {

    private int hwkId;
	private String hwkName;
	private String hwkDuedate;
	private String hwkReqdate;
	private String hwkContent;
	private int attachGroupId;
	private int lessonassignmentId;
	private String studentId;
	private String hwkIscomplete;
	private String managerId;
	private Date givenHwkSubdate;
	private String givenHwkIscomplete;
	private String givenHwkBadge;
	private String givenHwkContent;
	private String className;
	private String studentName;
	
	private List<AttachVO> attachList;
	
	public int getHwkId() {
		return hwkId;
	}
	public void setHwkId(int hwkId) {
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
	public int getAttachGroupId() {
		return attachGroupId;
	}
	public void setAttachGroupId(int attachGroupId) {
		this.attachGroupId = attachGroupId;
	}
	public int getLessonassignmentId() {
		return lessonassignmentId;
	}
	public void setLessonassignmentId(int lessonassignmentId) {
		this.lessonassignmentId = lessonassignmentId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getHwkIscomplete() {
		return hwkIscomplete;
	}
	public void setHwkIscomplete(String hwkIscomplete) {
		this.hwkIscomplete = hwkIscomplete;
	}
	
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getHwkReqdate() {
		return hwkReqdate;
	}
	public void setHwkReqdate(String hwkReqdate) {
		this.hwkReqdate = hwkReqdate;
	}
	public Date getGivenHwkSubdate() {
		return givenHwkSubdate;
	}
	public void setGivenHwkSubdate(Date givenHwkSubdate) {
		this.givenHwkSubdate = givenHwkSubdate;
	}
	public String getGivenHwkIscomplete() {
		return givenHwkIscomplete;
	}
	public void setGivenHwkIscomplete(String givenHwkIscomplete) {
		this.givenHwkIscomplete = givenHwkIscomplete;
	}
	public String getGivenHwkBadge() {
		return givenHwkBadge;
	}
	public void setGivenHwkBadge(String givenHwkBadge) {
		this.givenHwkBadge = givenHwkBadge;
	}
	public String getGivenHwkContent() {
		return givenHwkContent;
	}
	public void setGivenHwkContent(String givenHwkContent) {
		this.givenHwkContent = givenHwkContent;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	@Override
	public String toString() {
		return "HomeworkVO [hwkId=" + hwkId + ", hwkName=" + hwkName + ", hwkDuedate=" + hwkDuedate + ", hwkReqdate="
				+ hwkReqdate + ", hwkContent=" + hwkContent + ", attachGroupId=" + attachGroupId
				+ ", lessonassignmentId=" + lessonassignmentId + ", studentId=" + studentId + ", hwkIscomplete="
				+ hwkIscomplete + ", managerId=" + managerId + ", givenHwkSubdate=" + givenHwkSubdate
				+ ", givenHwkIscomplete=" + givenHwkIscomplete + ", givenHwkBadge=" + givenHwkBadge + ", attachList="
				+ attachList + "]";
	}
}
