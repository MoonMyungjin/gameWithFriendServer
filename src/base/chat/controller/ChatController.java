package base.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.sonatype.aether.util.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.WebSocketSession;

import base.chat.service.TextChatService;
import util.HduoResponse;
import util.Error;

@RestController
@RequestMapping(value="/chat")
public class ChatController {
	private static final Map<String, Map<String, WebSocketSession>> chatRooms = new HashMap<>();
	
	@Resource(name="textChatService")
	private TextChatService textChatService;
	
	@RequestMapping(value="/getChatList.do", method=RequestMethod.GET)
	public HduoResponse<List<Map<String,Object>>> getChatList(HttpServletRequest request, @RequestParam HashMap<String, Object> commandMap) throws Exception {
		// 결과를 return하는 Hduo 공통 Response
		HduoResponse<List<Map<String, Object>>> buildWith = null;
		
		List<Map<String, Object>> resultList = textChatService.getChatList(commandMap);
		
		try {
			buildWith = HduoResponse.create().succeed().buildWith(resultList);
		} catch (Exception e) {
			String msg = "에러가 발생했습니다.";
			Error error = new Error(HttpStatus.INTERNAL_SERVER_ERROR, msg);
			buildWith = HduoResponse.create().fail(error).buildWith(resultList);
		}
		
		return buildWith;
	}
	
	@RequestMapping(value="/openChatRoom.do", method=RequestMethod.POST)
	public HduoResponse<String> oepnChatRoom(HttpServletRequest requeest, @RequestBody HashMap<String, Object> commandMap) throws Exception {
		// 결과를 return하는 Hduo 공통 Response
		HduoResponse<String> buildWith = null;
		
		String chatRoomId = textChatService.openChatRoom(commandMap);
		
		// 리턴된 채팅방 값이 없을 경우 에러 발생
		if (StringUtils.isEmpty(chatRoomId)) {
			throw new Exception();
		}
		
		try {
			buildWith = HduoResponse.create().succeed().buildWith(chatRoomId);
		} catch (Exception e) {
			String msg = "에러가 발생했습니다.";
			Error error = new Error(HttpStatus.INTERNAL_SERVER_ERROR, msg);
			buildWith = HduoResponse.create().fail(error).buildWith(chatRoomId);
		}
		
		return buildWith;
	}
	
	@RequestMapping(value="/selectChatter.do", method=RequestMethod.GET)
	public HduoResponse<List<Map<String,Object>>> selectChater(HttpServletRequest requeest, @RequestBody HashMap<String, Object> commandMap) throws Exception {
		// 결과를 return하는 Hduo 공통 Response
		HduoResponse<List<Map<String, Object>>> buildWith = null;
		
		List<Map<String, Object>> resultList = textChatService.selectChatter(commandMap);
		
		try {
			buildWith = HduoResponse.create().succeed().buildWith(resultList);
		} catch (Exception e) {
			String msg = "에러가 발생했습니다.";
			Error error = new Error(HttpStatus.INTERNAL_SERVER_ERROR, msg);
			buildWith = HduoResponse.create().fail(error).buildWith(resultList);
		}
		
		return buildWith;
	}
	
	@RequestMapping(value="/selectUnreadMsg.do", method=RequestMethod.GET)
	public HduoResponse<List<Map<String,Object>>> selectUnreadMsg(HttpServletRequest requeest, @RequestBody HashMap<String, Object> commandMap) throws Exception {
		// 결과를 return하는 Hduo 공통 Response
		HduoResponse<List<Map<String, Object>>> buildWith = null;
		
		List<Map<String, Object>> resultList = textChatService.selectUnreadMsg(commandMap);
		
		try {
			buildWith = HduoResponse.create().succeed().buildWith(resultList);
		} catch (Exception e) {
			String msg = "에러가 발생했습니다.";
			Error error = new Error(HttpStatus.INTERNAL_SERVER_ERROR, msg);
			buildWith = HduoResponse.create().fail(error).buildWith(resultList);
		}
		
		return buildWith;
	}
}
