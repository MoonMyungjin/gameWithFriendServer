package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.NoteVO;
import com.lms.hexa.dto.UserVO;

public class NoteDAOImpl implements NoteDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<NoteVO> selectNoteReceiveList(String loginUserId) throws SQLException {
//		int offset = cri.getStartRowNum();
//		int limit = cri.getPerPageNum();
//		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<NoteVO> noteReceiveList = session.selectList("Note-Mapper.selectNoteReceiveList", loginUserId);
		
		return noteReceiveList;
	}

	@Override
	public List<NoteVO> selectNoteSendList(String loginUserId) throws SQLException {
//		int offset = cri.getStartRowNum();
//		int limit = cri.getPerPageNum();
//		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<NoteVO> noteSendList = session.selectList("Note-Mapper.selectNoteSendList", loginUserId);
		
		return noteSendList;
	}

	@Override
	public int selectNoteCriteriaTotalCountReceive() throws SQLException {
		int count = session.selectOne("Note-Mapper.selectSearchNoteListCountReceive");
		return count;
	}
	
	@Override
	public int selectNoteCriteriaTotalCountSend() throws SQLException {
		int count = session.selectOne("Note-Mapper.selectSearchNoteListCountSend");
		return count;
	}

	@Override
	public NoteVO selectNoteByNoteId(String noteId) throws SQLException {
		NoteVO note = session.selectOne("Note-Mapper.selectNoteByNoteId", noteId);
		String sUserCategory = session.selectOne("Note-Mapper.getUserCategory",note.getNoteSendUserId());
		String rUserCategory = session.selectOne("Note-Mapper.getUserCategory",note.getNoteReceivedUserId());
		String sUserName = "";
		String rUserName = "";
		if (sUserCategory.equals("p")) {
			sUserName = session.selectOne("Note-Mapper.getParentName",note.getNoteSendUserId());
		}
		if (sUserCategory.equals("s")) {
			sUserName = session.selectOne("Note-Mapper.getStudentName",note.getNoteSendUserId());
		}
		if (sUserCategory.equals("m")) {
			sUserName = session.selectOne("Note-Mapper.getManagerName",note.getNoteSendUserId());
		}
		if (rUserCategory.equals("p")) {
			rUserName = session.selectOne("Note-Mapper.getParentName",note.getNoteReceivedUserId());
		}
		if (rUserCategory.equals("s")) {
			rUserName = session.selectOne("Note-Mapper.getStudentName",note.getNoteReceivedUserId());
		}
		if (rUserCategory.equals("m")) {
			rUserName = session.selectOne("Note-Mapper.getManagerName",note.getNoteReceivedUserId());
		}
		note.setNoteSendUserName(sUserName);
		note.setNoteReceivedUserName(rUserName);
		return note;
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		int noteId = session.selectOne("Note-Mapper.selectNoteSeqNext");
		return noteId;
	}

	@Override
	public void deleteNote(String noteId) throws SQLException {
		session.update("Note-Mapper.deleteNote", noteId);
		
	}

	@Override
	public void update(String noteId) throws SQLException {
		session.update("Note-Mapper.updateNote", noteId);
		
	}

	@Override
	public Map<String, Object> selectUserList(SearchHelper sh) throws SQLException {
		
		Map<String, Object> userMap = new HashMap<String, Object>();
		List<UserVO> parentList = null;
		List<UserVO> managerList = null;
		List<UserVO> studentList = null;
		
		if(sh.getSearch1().equals("학부모")) {	//부모이면
			parentList = session.selectList("Note-Mapper.selectUserListByParent", sh);
		} else if(sh.getSearch1().equals("교사")) {
			managerList = session.selectList("Note-Mapper.selectUserListByManager", sh);
		} else if(sh.getSearch1().equals("학생")) {
			studentList = session.selectList("Note-Mapper.selectUserListByStudent", sh);
		} else {
			parentList = session.selectList("Note-Mapper.selectUserListByParent", sh);
			managerList = session.selectList("Note-Mapper.selectUserListByManager", sh);
			studentList = session.selectList("Note-Mapper.selectUserListByStudent", sh);
		}
		
		userMap.put("parentList",parentList);
		userMap.put("managerList",managerList);
		userMap.put("studentList",studentList);
		
		return userMap;
	}

	@Override
	public int insertNote(HashMap<String, Object> params) throws SQLException {
		int result = session.insert("Note-Mapper.insertNote", params);
		return result;
		
	}

	@Override
	public int insertReply(HashMap<String, Object> params) throws SQLException {
		 int result = session.insert("Note-Mapper.insertReply", params);
		 return result;
	}

	@Override
	public List<NoteVO> selectNoteListSe(ManagerVO manager) throws SQLException {
		System.out.println(manager);
		List<NoteVO> noteListSe = session.selectList("Note-Mapper.searchNoteListSe", manager);
		return noteListSe;
	}

	@Override
	public List<NoteVO> selectNoteListRe(ManagerVO manager) throws SQLException {
		List<NoteVO> noteListRe = session.selectList("Note-Mapper.searchNoteListRe", manager);
		return noteListRe;
	}

	
	
	
}
