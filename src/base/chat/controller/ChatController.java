package base.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import base.chat.service.TextChatService;

@RestController
@RequestMapping(value="/chat")
public class ChatController {
	private static final Map<String, Map<String, WebSocketSession>> chatRooms = new HashMap<>();
	
	@Resource(name="textChatService")
	private TextChatService textChatService;
	
	@RequestMapping(value="/getChatList")
	public ModelAndView getChatList(HttpServletRequest request, @RequestBody HashMap<String, Object> commandMap) throws Exception {
		ModelAndView modelAndView = new ModelAndView("jsonView");
		
		List<Map<String, Object>> resultList = textChatService.getChatList(commandMap);
		
		modelAndView.addObject("chatList", resultList);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/openChatRoom")
	public ModelAndView oepnChatRoom(HttpServletRequest requeest, @RequestBody HashMap<String, Object> commandMap) throws Exception {
		ModelAndView modelAndView = new ModelAndView("jsonView");
		
		
		return modelAndView;
	}
	
	
}
