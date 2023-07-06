package base.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	

}
