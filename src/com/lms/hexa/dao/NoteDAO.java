package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.NoteVO;
import com.lms.hexa.dto.UserVO;

public interface NoteDAO {

	// 쪽지 받은 리스트
	List<NoteVO> selectNoteReceiveList(String loginUserId) throws SQLException;
	
	// 쪽지 보낸 리스트
	List<NoteVO> selectNoteSendList(String loginUserId) throws SQLException;
	
	// 자료 전체 개수 (받은쪽지함)
	int selectNoteCriteriaTotalCountReceive() throws SQLException;
	
	// 자료 전체 개수 (보낸 쪽지함)
	int selectNoteCriteriaTotalCountSend() throws SQLException;
	
	// noteId에 따른 자료
	NoteVO selectNoteByNoteId(String noteId) throws SQLException;
	
	// 삭제 update
	void deleteNote(String noteId) throws SQLException;
	
	int getSeqNextValue() throws SQLException;
	
	// 읽은 날짜, 여부 업데이트
	void update(String noteId) throws SQLException;
	
	// userList
	Map<String, Object> selectUserList(SearchHelper sh) throws SQLException;
	
	// insert (쪽지 보내기)
	int insertNote(HashMap<String, Object> params) throws SQLException;
	
	int insertReply(HashMap<String, Object> params) throws SQLException;

	List<NoteVO> selectNoteListSe(ManagerVO manager) throws SQLException;
	List<NoteVO> selectNoteListRe(ManagerVO manager) throws SQLException;
	
	

}
