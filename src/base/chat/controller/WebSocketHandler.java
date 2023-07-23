package base.chat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import base.chat.service.TextChatService;

@Component
public class WebSocketHandler extends TextWebSocketHandler {
	
	// 클라이언트의 WebSocket 세션 정보를 담을 변수
	// 웹소켓이 중간에 끊기게 되면 set 길이가 줄어들어 오류 발생 가능성이 있음
	private static final Map<String, WebSocketSession> chatRooms = new HashMap<>();
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	@Resource(name="textChatService")
	private TextChatService textChatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws IOException {
//		String chatRoomId = extractChatRoomId(session.getUri().getPath());
		chatRooms.put(session.getId(), session);
		
        
        System.out.println("session Open!");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		chatRooms.remove(session.getId());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String chatRoomId = extractChatRoomId(session.getUri().getPath());
		
		String msg = message.getPayload();
		HashMap<String, Object> chatMessage = objectMapper.readValue(msg, HashMap.class);
				
		// 채팅 메시지 처리 로직 작성
		int connectedChatter = getChatterCnt(session);
		
		int chatterCnt = textChatService.selectChatterCnt(chatRoomId);
		
		// temp 메세지 data를 db에 밀어넣는 로직
		if (connectedChatter < chatterCnt) {
			chatMessage.put("chatRoomId", chatRoomId);
			textChatService.insertTempMsgData(chatMessage);
		}

        // 해당 채팅방의 참여자들에게 메시지 전송
        for (WebSocketSession participant : chatRooms.values()) {
            if (participant.isOpen() && chatRoomId.equals(extractChatRoomId(participant.getUri().getPath()))) {
                participant.sendMessage(new TextMessage(message.getPayload()));
            }
        }
	}
	
	private String extractChatRoomId(String path) {
        return path.substring(path.lastIndexOf('/') + 1);
    }
	
	private int getChatterCnt(WebSocketSession session) {
		int cnt = 0;
		
		for (WebSocketSession participant : chatRooms.values()) {
			String chatRoomId = extractChatRoomId(session.getUri().getPath());
			
            if (participant.isOpen() && chatRoomId.equals(extractChatRoomId(participant.getUri().getPath()))) {
            	cnt++;
            }
        }
		return cnt;
	}
}
