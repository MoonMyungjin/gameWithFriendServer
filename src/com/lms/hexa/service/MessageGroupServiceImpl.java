package com.lms.hexa.service;

import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dao.MessageGroupDAO;
import com.lms.hexa.dto.MessageGroupVO;

public class MessageGroupServiceImpl implements MessageGroupService {
		
	private MessageGroupDAO messageGroupDAO;

	public void setMessageGroupDAO(MessageGroupDAO messageGroupDAO) {
		this.messageGroupDAO = messageGroupDAO;
	}

	@Override
	public List<MessageGroupVO> getMessageGroupByGroupName(String messageGroupName) throws Exception {
		List<MessageGroupVO> messageGroupList = messageGroupDAO.selectMessageGroupByGroupName(messageGroupName);
		
		return messageGroupList;
	}

	@Override
	public int registMessageGroup(HashMap<String, Object> params) throws Exception {
		messageGroupDAO.deleteOldMessageGroup(params);
		int result = messageGroupDAO.insertMessageGroup(params);
		return result;
	}

	@Override
	public void deleteOldMessageGroup(HashMap<String, Object> params) throws Exception {
		messageGroupDAO.deleteOldMessageGroup(params);
	}

	@Override
	public List<MessageGroupVO> selectMessageGroupList() throws Exception {
		List<MessageGroupVO> messageGroupList = messageGroupDAO.selectMessageGroupList();
		
		return messageGroupList;
	}

	@Override
	public MessageGroupVO  getMessageGroupName(String messageGroupName) throws Exception {
		MessageGroupVO  checkName = messageGroupDAO.selectMessageGroupListCheck(messageGroupName);
		return checkName;
	}
	
}
