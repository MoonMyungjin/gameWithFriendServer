package com.lms.hexa.dto;

public class MessageGroupVO {
		
	private String messageGroupId;
	private String messageGroupName;
	private String receiverCategory;
	private String receiverName;
	private String receiverHp;
	private String receiverEmail;
	
	
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}
	public String getMessageGroupId() {
		return messageGroupId;
	}
	public void setMessageGroupId(String messageGroupId) {
		this.messageGroupId = messageGroupId;
	}
	public String getMessageGroupName() {
		return messageGroupName;
	}
	public void setMessageGroupName(String messageGroupName) {
		this.messageGroupName = messageGroupName;
	}
	public String getReceiverCategory() {
		return receiverCategory;
	}
	public void setReceiverCategory(String receiverCategory) {
		this.receiverCategory = receiverCategory;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverHp() {
		return receiverHp;
	}
	public void setReceiverHp(String receiverHp) {
		this.receiverHp = receiverHp;
	}
	
}
