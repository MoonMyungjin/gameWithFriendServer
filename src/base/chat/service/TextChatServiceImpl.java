package base.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import base.chat.dao.TextChatDAO;

@Service(value="textChatService")
public class TextChatServiceImpl implements TextChatService{
	
	@Resource(name="textChatDAO")
	private TextChatDAO textChatDAO;

	@Override
	public List<Map<String, Object>> getChatList(HashMap<String, Object> commandMap) throws Exception {
		
		List<Map<String, Object>> resultList = textChatDAO.selectChatList(commandMap);
		
		return resultList;
	}

	@Override
	public String openChatRoom(HashMap<String, Object> commandMap) throws Exception {
		
		String chatRoomId = textChatDAO.selectChatRoom(commandMap);
		String sender = (String) commandMap.get("sender");
		String receiver = (String) commandMap.get("receiver");
		
		if (StringUtils.isEmpty(chatRoomId)) {
			// 채팅방 만드는 로직 구현
			chatRoomId = (String) textChatDAO.insertChatRoom(commandMap);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if (StringUtils.isNotEmpty(sender)) {
				paramMap.put("chaSeq", chatRoomId);
				paramMap.put("chaIntgId", commandMap.get("sender"));
				paramMap.put("chaRegId", commandMap.get("sender"));
				paramMap.put("chaModId", commandMap.get("sender"));
				
				textChatDAO.insertChatRoomDetail(paramMap);
			}
			
			if (StringUtils.isNotEmpty(receiver)) {
				paramMap.put("chaSeq", chatRoomId);
				paramMap.put("chaIntgId", commandMap.get("receiver"));
				paramMap.put("chaRegId", commandMap.get("sender"));
				paramMap.put("chaModId", commandMap.get("sender"));
				
				textChatDAO.insertChatRoomDetail(paramMap);
			}
			
		}
		
		return chatRoomId;
	}
	
	public List<Map<String, Object>> selectChatter(HashMap<String, Object> commandMap) throws Exception {
		List<Map<String, Object>> resultList = null;
		
		resultList = textChatDAO.selectChatter(commandMap);
		
		return resultList;
	}

}
