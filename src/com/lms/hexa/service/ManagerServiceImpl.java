package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.AcademyScheDAO;
import com.lms.hexa.dao.GoWorkDAO;
import com.lms.hexa.dao.LessonDAO;
import com.lms.hexa.dao.ManagerDAO;
import com.lms.hexa.dao.NoteDAO;
import com.lms.hexa.dao.NoticeDAO;
import com.lms.hexa.dto.AcademyScheVO;
import com.lms.hexa.dto.GoWorkVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.NoteVO;
import com.lms.hexa.dto.NoticeVO;

public class ManagerServiceImpl implements ManagerService {
	
	protected ManagerDAO managerDAO;

	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	
	protected GoWorkDAO goWorkDAO;
	
	public void setGoWorkDAO(GoWorkDAO goWorkDAO) {
		this.goWorkDAO = goWorkDAO;
	}
	
	
	protected AcademyScheDAO academyScheDAO;
	
	public void setAcademyScheDAO(AcademyScheDAO academyScheDAO) {
		this.academyScheDAO = academyScheDAO;
	}
	
	protected NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	protected NoteDAO noteDAO;
	
	public void setNoteDAO(NoteDAO noteDAO) {
		this.noteDAO = noteDAO;
	}
	
	protected LessonDAO lessonDAO;
	
	public void setLessonDAO(LessonDAO lessonDAO) {
		this.lessonDAO = lessonDAO;
	}
	

	
	@Override
	public ManagerVO getManager(String id) throws Exception {
		ManagerVO manager = managerDAO.selectManagerById(id);
		return manager;
	}
	
	@Override
	public List<ManagerVO> getWorkingTeacherListSearchByName(ManagerVO managerVO) throws Exception {
		List<ManagerVO> teacherList = managerDAO.selectWorkingTeacherListSearchByName(managerVO);
		return teacherList;
	}
	
	@Override
	public List<ManagerVO> getWorkingTeacherList() throws Exception {
		List<ManagerVO> teacherList = managerDAO.selectWorkingTeacherList();
		return teacherList;
	}

	@Override
	public ManagerVO getManagerDetailById(String id) throws Exception {
		ManagerVO teacherInfo = managerDAO.selectManagerDetailById(id);
		return teacherInfo;
	}

	@Override
	public void updatePwd(String emailAddress) throws Exception {
		managerDAO.updatePwd(emailAddress);
		
		
	}

	@Override
	public Map<String, Object> getManagerList(Criteria cri) throws Exception {
		cri.setPerPageNum(300);
		List<ManagerVO> managerList = managerDAO.selectManagerList(cri);
		List<ManagerVO> mngGenderList = managerDAO.selectMngGenderList();
		List<ManagerVO> mngDeleteList = managerDAO.selectMngDeleteList();
		List<ManagerVO> deptIdList = managerDAO.selectDeptIdList();
		List<ManagerVO> mngSubjectList = managerDAO.selectMngSubjectList();
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(managerDAO.selectManagerListTotalCount(cri));
		
		Map<String, Object> dataMap = new Hashtable<String, Object>();
		
		dataMap.put("managerList", managerList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("mngDeleteList", mngDeleteList);
		dataMap.put("mngGenderList", mngGenderList);
		dataMap.put("deptIdList", deptIdList);
		dataMap.put("mngSubjectList", mngSubjectList);
		
		return dataMap;
	}

	@Override
	public void insertManager(ManagerVO manager) throws SQLException {
		managerDAO.insertManager(manager);
	}

	@Override
	public void modifyPwd(ManagerVO manager) throws SQLException {
		managerDAO.modifyPwd(manager);
	}

	@Override
	public Map<String, Object> getMain(String id) throws Exception {
		Map<String, Object> dataMap = new Hashtable<String, Object>();
		ManagerVO manager = managerDAO.selectManagerById2(id);
		GoWorkVO work = new GoWorkVO();
		work.setMngId(id);
		GoWorkVO gowork = goWorkDAO.selectGoWorkListBySelectGetMain(work);
		List<NoteVO> noteReceiveList = noteDAO.selectNoteReceiveList(id);
		System.out.println(noteReceiveList);
		List<NoteVO> noteSendList = noteDAO.selectNoteSendList(id);
		System.out.println(noteSendList);
		List<AcademyScheVO> academySubScheList = academyScheDAO.selectAcademyScheList();
		List<NoticeVO> noticeForMainList = noticeDAO.noticeForMain();
		List<LessonVO> forMainGetLesson = lessonDAO.forMainGetLesson(id);
		List<LessonVO> forMainGetLessonEnd = lessonDAO.forMainGetLessonEnd(id);
		dataMap.put("forMainGetLessonEnd", forMainGetLessonEnd);
		dataMap.put("forMainGetLesson", forMainGetLesson);
		dataMap.put("noteReceiveList", noteReceiveList);
		dataMap.put("noteSendList", noteSendList);
		dataMap.put("noticeForMainList", noticeForMainList);
		dataMap.put("academySubScheList", academySubScheList);
		dataMap.put("gowork", gowork);
		dataMap.put("manager", manager);
		return dataMap;
	}



	@Override
	public ManagerVO getManagerDetail(String id) throws Exception {
		ManagerVO selectMangerForDetail = managerDAO.selectMangerForDetail(id);
		return selectMangerForDetail;
	}

	
}
