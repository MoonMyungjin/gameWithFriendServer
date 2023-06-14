package base.chat.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("chatDAO")
public class ChatDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public void insertChatRoom(HashMap<String,Object> commandMap) {
		session.insert("base.chat.mapper.insertChatRoom", commandMap);
	}
}
