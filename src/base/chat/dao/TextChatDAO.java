package base.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("textChatDAO")
public class TextChatDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<Map<String, Object>> selectChatList(HashMap<String,Object> commandMap) throws Exception {
		List<Map<String,Object>> resultList = session.selectList("base.chat.mapper.selectChatList", commandMap);
		if (resultList.size() < 1) {
			resultList = new ArrayList<Map<String,Object>>();
		}
		return resultList; 
	}
	
	public String insertChatRoom(HashMap<String,Object> commandMap) throws Exception {
		session.insert("base.chat.mapper.insertChatRoom", commandMap);
		String chatRoomId = (String) commandMap.get("chaSeq");
		
		return chatRoomId;
	}
	
	public void insertChatRoomDetail(HashMap<String,Object> commandMap) throws Exception {
		session.insert("base.chat.mapper.insertChatRoomDetail", commandMap);
	}
	
	public String selectChatRoom(HashMap<String,Object> commandMap) throws Exception {
		String chatRoomId = session.selectOne("base.chat.mapper.selectChatRoom", commandMap);
		return chatRoomId;
	}
}
