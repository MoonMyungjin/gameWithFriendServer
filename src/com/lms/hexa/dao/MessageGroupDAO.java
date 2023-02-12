package com.lms.hexa.dao;

import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.MessageGroupVO;

public interface MessageGroupDAO {
	
	public List<MessageGroupVO> selectMessageGroupByGroupName(String messageGroupName) throws Exception;
	
	public int insertMessageGroup(HashMap<String, Object> params) throws Exception;
	
	public void deleteOldMessageGroup(HashMap<String, Object> params) throws Exception;
	
	public List<MessageGroupVO> selectMessageGroupList() throws Exception;
	
	public MessageGroupVO selectMessageGroupListCheck(String messageGroupName) throws Exception;
}
