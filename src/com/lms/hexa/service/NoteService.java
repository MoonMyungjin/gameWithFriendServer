package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.NoteVO;

public interface NoteService {
	
	// 받은 리스트 조회
	Map<String, Object> getReceiveList(String loginUserId) throws SQLException;
	
	// 보낸 리스트 조회
	Map<String, Object> getSendList(String loginUserId) throws SQLException;
	
	// 글 조회
	NoteVO getNote(String noteId) throws SQLException;
	
	// 삭제 update
	void remove(String noteId) throws SQLException;
	
	// 글 읽은 날짜, 읽음 표시
	void update(String noteId) throws SQLException;
	
	// user 검색 => list
	Map<String, Object> getUserListByType(SearchHelper sh) throws SQLException;
	
	// 쪽지 보내기 insert
	int insertNote(HashMap<String, Object> params) throws SQLException;
	
	// 답장 보내기
	int insertReply(HashMap<String, Object> params) throws SQLException;

	List<NoteVO> getNoteListSe(ManagerVO manager) throws SQLException;

	List<NoteVO> getNoteListRe(ManagerVO manager) throws SQLException;
	
}
