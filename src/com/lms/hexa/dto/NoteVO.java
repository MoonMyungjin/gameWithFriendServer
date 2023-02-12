package com.lms.hexa.dto;

import java.util.Date;

public class NoteVO {
	
	private String noteId;
	private String noteContent;
	private Date noteReadDate;
	private Date noteSendDate;
	private String noteReadYN;
	private String noteSendUserId;
	private String noteReceivedUserId;
	private String noteTitle;
	private String noteDeleteKey;
	private String noteSendUserName;
	private String noteReceivedUserName;
	private String name;

	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNoteSendUserName() {
		return noteSendUserName;
	}
	public void setNoteSendUserName(String noteSendUserName) {
		this.noteSendUserName = noteSendUserName;
	}
	public String getNoteReceivedUserName() {
		return noteReceivedUserName;
	}
	public void setNoteReceivedUserName(String noteReceivedUserName) {
		this.noteReceivedUserName = noteReceivedUserName;
	}
	public String getNoteId() {
		return noteId;
	}
	public void setNoteId(String noteId) {
		this.noteId = noteId;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public Date getNoteReadDate() {
		return noteReadDate;
	}
	public void setNoteReadDate(Date noteReadDate) {
		this.noteReadDate = noteReadDate;
	}
	public Date getNoteSendDate() {
		return noteSendDate;
	}
	public void setNoteSendDate(Date noteSendDate) {
		this.noteSendDate = noteSendDate;
	}
	public String getNoteReadYN() {
		return noteReadYN;
	}
	public void setNoteReadYN(String noteReadYN) {
		this.noteReadYN = noteReadYN;
	}
	public String getNoteSendUserId() {
		return noteSendUserId;
	}
	public void setNoteSendUserId(String noteSendUserId) {
		this.noteSendUserId = noteSendUserId;
	}
	public String getNoteReceivedUserId() {
		return noteReceivedUserId;
	}
	public void setNoteReceivedUserId(String noteReceivedUserId) {
		this.noteReceivedUserId = noteReceivedUserId;
	}
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public String getNoteDeleteKey() {
		return noteDeleteKey;
	}
	public void setNoteDeleteKey(String noteDeleteKey) {
		this.noteDeleteKey = noteDeleteKey;
	}
	
	
	
	
	
}
