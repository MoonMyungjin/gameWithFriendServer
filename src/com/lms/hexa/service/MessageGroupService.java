package com.lms.hexa.service;

import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.MessageGroupVO;

public interface MessageGroupService {
	
	public List<MessageGroupVO> getMessageGroupByGroupName(String messageGroupName) throws Exception;
	
	public int registMessageGroup(HashMap<String, Object> params) throws Exception;
	
	public void deleteOldMessageGroup(HashMap<String, Object> params) throws Exception;
	
	public List<MessageGroupVO> selectMessageGroupList() throws Exception;
	
	public MessageGroupVO getMessageGroupName(String messageGroupName) throws Exception;
}
