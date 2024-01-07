package base.chat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import base.chat.dao.TextChatDAO;
import util.CustomMap;

@Service(value="textChatService")
public class TextChatServiceImpl implements TextChatService{
	
	@Resource(name="textChatDAO")
	private TextChatDAO textChatDAO;

	@Override
	public List<Map<String, Object>> getChatList(HashMap<String, Object> commandMap) throws Exception {
		
		List<Map<String, Object>> resultList = textChatDAO.selectChatList(commandMap);
		
		return resultList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String openChatRoom(HashMap<String, Object> commandMap) throws Exception {
		String sender = (String) commandMap.get("sender");
		String receiver = (String) commandMap.get("receiver");
		
		List<String> tmpChatters = (List<String>) commandMap.get("receivers");
		tmpChatters.add(sender);
		
		String[] chatters = tmpChatters.toArray(new String[tmpChatters.size()]);
		commandMap.put("chatters", chatters);
		commandMap.put("size", chatters.length);
		
		
		String chatRoomId = textChatDAO.selectChatRoom(commandMap);
		
		if (StringUtils.isEmpty(chatRoomId)) {
			// 채팅방 만드는 로직 구현
			chatRoomId = (String) textChatDAO.insertChatRoom(commandMap);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("chaRegId", commandMap.get("sender"));
			paramMap.put("chaModId", commandMap.get("sender"));
			
			if (chatters != null && chatters.length > 0) {
				for (int i = 0; i < chatters.length; i++) {
					paramMap.put("chaSeq", chatRoomId);
					paramMap.put("chaIntgId", chatters[i]);
					
					textChatDAO.insertChatRoomDetail(paramMap);
				}
			}
		}
		
		return chatRoomId;
	}
	
	public List<Map<String, Object>> selectChatter(HashMap<String, Object> commandMap) throws Exception {
		List<Map<String, Object>> resultList = null;
		
		resultList = textChatDAO.selectChatter(commandMap);
		
		return resultList;
	}

	@Override
	public int selectChatterCnt(String chatRoomId) throws Exception {
		int chatterCnt = textChatDAO.selectChatterCnt(chatRoomId);;
		
		return chatterCnt;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void insertTempMsgData(HashMap<String, Object> commandMap) throws Exception {
		String chatRoomId = (String) commandMap.get("chatRoomId");
		String msg = (String)commandMap.get("text");
		HashMap<String, Object> userInfo = (HashMap<String, Object>) commandMap.get("user");
		
		String senderId = (String) userInfo.get("_id");
		List<Map<String, Object>> chatters = textChatDAO.selectChatter(commandMap);
		for (Map<String,Object> chatter : chatters) {
			if (chatter.get("uIntgId").equals(senderId)) {
				continue;
			} else {
				HashMap<String, Object> insertMap = new HashMap<String, Object>();
				
				insertMap.put("chatRoomId", chatRoomId);
				insertMap.put("id", (String) commandMap.get("_id"));
				insertMap.put("sender", (String) userInfo.get("_id"));
				insertMap.put("receiver", chatter.get("uIntgId"));
				insertMap.put("msg", msg);
				
				textChatDAO.insertTmpMsg(insertMap);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectUnreadMsg(HashMap<String, Object> commandMap) throws Exception {
		List<String> resultList = textChatDAO.selectUnreadMsg(commandMap);
		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		
		for (String resultString : resultList) {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> returnMap = objectMapper.readValue(resultString, HashMap.class);
			
			returnList.add(returnMap);
		}
		
		// 화면에 나갈 준비가 끝났으면, 파일에 저장될 tmpData 이므로 db에서 삭제
		textChatDAO.deleteTmpMsg(commandMap);
		
		return returnList;
	}
}
