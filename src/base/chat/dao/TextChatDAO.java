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
	
	public void insertChatRoom(HashMap<String,Object> commandMap) throws Exception {
		session.insert("base.chat.mapper.insertChatRoom", commandMap);
	}
}
