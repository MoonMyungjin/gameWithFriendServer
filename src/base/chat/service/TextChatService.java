package base.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("TextChatService")
public interface TextChatService {
	
	// 사용자의 채팅방 리스트를 불러오는 메서드
	public List<Map<String, Object>> getChatList(HashMap<String, Object> commandMap) throws Exception;
	
	// 채팅방을 open 하는 메서드
	public String openChatRoom(HashMap<String, Object> commandMap) throws Exception;
}
