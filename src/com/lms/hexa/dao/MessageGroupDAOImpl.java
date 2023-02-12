package com.lms.hexa.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.MessageGroupVO;

public class MessageGroupDAOImpl implements MessageGroupDAO {
		
			private SqlSession session;
			
			public void setSession(SqlSession session) {
				this.session = session;
			}

			@Override
			public List<MessageGroupVO> selectMessageGroupByGroupName(String messageGroupName) throws Exception {
				List<MessageGroupVO> messageGroupList = session.selectList("MessageGroup-Mapper.selectMessageGroupByGroupName", messageGroupName);
				return messageGroupList;
			}

			@Override
			public int insertMessageGroup(HashMap<String, Object> params) throws Exception {
				int result = session.insert("MessageGroup-Mapper.insertMessageGroup",params);
				return result;
			}

			@Override
			public void deleteOldMessageGroup(HashMap<String, Object> params) throws Exception {
				session.delete("MessageGroup-Mapper.deleteOldMessageGroup",params);
			}

			@Override
			public List<MessageGroupVO> selectMessageGroupList() throws Exception {
				List<MessageGroupVO> messageGroupList = session.selectList("MessageGroup-Mapper.selectMessageGroupList");
				return messageGroupList;
			}

			@Override
			public MessageGroupVO selectMessageGroupListCheck(String messageGroupName) throws Exception {
				MessageGroupVO messageGroupNameCheck = session.selectOne("MessageGroup-Mapper.selectMessageGroupListCheck",messageGroupName);
				return messageGroupNameCheck;
			}
}
