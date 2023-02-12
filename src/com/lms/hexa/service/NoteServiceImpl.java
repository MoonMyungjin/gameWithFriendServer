package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dao.NoteDAO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.NoteVO;
import com.lms.hexa.dto.UserVO;

public class NoteServiceImpl implements NoteService{
	
	private NoteDAO noteDAO;
	public void setNoteDAO(NoteDAO noteDAO) {
		this.noteDAO = noteDAO;
	}

	@Override
	public Map<String, Object> getReceiveList(String loginUserId) throws SQLException {
		List<NoteVO> noteReceiveList = noteDAO.selectNoteReceiveList(loginUserId);
		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(noteDAO.selectNoteCriteriaTotalCountReceive());
		
		Map<String, Object> dataMapRe = new HashMap<String, Object>();
		dataMapRe.put("noteReceiveList", noteReceiveList);
//		dataMapRe.put("pageMaker", pageMaker);
		
		return dataMapRe;
	}

	@Override
	public Map<String, Object> getSendList(String loginUserId) throws SQLException {
		
		List<NoteVO> noteSendList = noteDAO.selectNoteSendList(loginUserId);
		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(noteDAO.selectNoteCriteriaTotalCountSend(cri));
		
		Map<String, Object> dataMapSe = new HashMap<String, Object>();
		dataMapSe.put("noteSendList", noteSendList);
//		dataMapSe.put("pageMaker", pageMaker);
		
		return dataMapSe;
	}

	@Override
	public NoteVO getNote(String noteId) throws SQLException {
		NoteVO note = noteDAO.selectNoteByNoteId(noteId);
		return note;
	}

	@Override
	public void remove(String noteId) throws SQLException {
		noteDAO.deleteNote(noteId);
		
	}

	@Override
	public void update(String noteId) throws SQLException {
		noteDAO.update(noteId);
	}

	@Override
	public Map<String, Object> getUserListByType(SearchHelper sh) throws SQLException {
		Map<String, Object> userList = noteDAO.selectUserList(sh);
		return userList;
	}

	@Override
	public int insertNote(HashMap<String, Object> params) throws SQLException {
		int result = noteDAO.insertNote(params);
		return result;
	}

	@Override
	public int insertReply(HashMap<String, Object> params) throws SQLException {
		int result = noteDAO.insertReply(params);
		return result;
	}

	@Override
	public List<NoteVO> getNoteListSe(ManagerVO manager) throws SQLException {
		List<NoteVO> noteListSe = noteDAO.selectNoteListSe(manager);
		return noteListSe;
	}

	@Override
	public List<NoteVO> getNoteListRe(ManagerVO manager) throws SQLException {
		List<NoteVO> noteListRe = noteDAO.selectNoteListRe(manager);
		return noteListRe;
	}
	
}
