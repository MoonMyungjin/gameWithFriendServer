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
	
	// chatRoomId로 채팅방 참여자들의 정보를 조회하는 메서드
	public List<Map<String, Object>> selectChatter(HashMap<String, Object> commandMap) throws Exception;
	
	// chatRoomId로 채팅방 참여자들의 정보를 조회하는 메서드
	public int selectChatterCnt(String chatRoomId) throws Exception;
	
	// 채팅 temp 데이터를 db로 밀어넣는 작업
	public void insertTempMsgData(HashMap<String, Object> commandMap) throws Exception;
	
	// 읽지 않은 msg 가 있는지 조회하는 메서드
	public List<Map<String, Object>> selectUnreadMsg(HashMap<String, Object> commandMap) throws Exception;
}
