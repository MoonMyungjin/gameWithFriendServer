package base.chat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class WebSocketHandler extends TextWebSocketHandler {
	
	// 클라이언트의 WebSocket 세션 정보를 담을 변수
	// 웹소켓이 중간에 끊기게 되면 set 길이가 줄어들어 오류 발생 가능성이 있음
	private static final Map<String, WebSocketSession> chatRooms = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws IOException {
		String chatRoomId = extractChatRoomId(session.getUri().getPath());
		chatRooms.put(session.getId(), session);
        session.sendMessage(new TextMessage(chatRoomId));
        
        System.out.println("session Open!");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		chatRooms.remove(session.getId());
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		String chatRoomId = extractChatRoomId(session.getUri().getPath());
        // String senderId = extractSenderId(session.getId());

        // 채팅 메시지 처리 로직 작성

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

//    private String extractSenderId(String sessionId) {
//        return sessionId;
//    }
}
