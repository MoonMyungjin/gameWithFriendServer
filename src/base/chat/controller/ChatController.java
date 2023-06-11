package base.chat.controller;

import java.util.Map;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChatController {
//	@Resource(name="textChatService");
//	private TextChatService textChatService;
	
//	private SimpMessagingTemplate simpMessagingTemplate;
//	public TextChatController(SimpMessagingTemplate simpMessagingTemplate) {
//		this.simpMessagingTemplate = simpMessagingTemplate;
//	}
	
//	@MessageMapping("/message")
//	public void chat(Map<String, String> chatRequest) {
//		System.out.println(chatRequest);
//		simpMessagingTemplate.convertAndSend("/subscribe/rooms/1", chatRequest);
//	}
	
//	@RequestMapping(name="") {
//		
//	}
}
