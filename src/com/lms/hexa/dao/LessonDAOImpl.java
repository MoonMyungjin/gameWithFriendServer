package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.HomeworkVO;
import com.lms.hexa.dto.LessonRoomVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StandardCodeVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.TimeTableVO;

public class LessonDAOImpl implements LessonDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<String> selectManagerScheduleById(String id) throws SQLException {
		List<String> scheduleList = session.selectList("Lesson-Mapper.selectManagerScheduleById", id);
		return scheduleList;
	}

	@Override
	public List<LessonRoomVO> selectLessonRoomList() throws SQLException {
		List<LessonRoomVO> lessonRoomList = session.selectList("Lesson-Mapper.selectLessonRoomList");
		return lessonRoomList;
	}

	@Override
	public List<StandardCodeVO> selectStudentGradeCategoryCodeList() throws SQLException {
		List<StandardCodeVO> StudentGradeCategoryCodeList = session.selectList("Lesson-Mapper.selectStudentGradeCategoryCodeList");
		return StudentGradeCategoryCodeList;
	}

	@Override
	public List<StandardCodeVO> selectSubjectList() throws SQLException {
		List<StandardCodeVO> subjectList = session.selectList("Lesson-Mapper.selectSubjectList");
		return subjectList;
	}
	
	@Override
	public List<StandardCodeVO> selectLessonStateList() {
		List<StandardCodeVO> LessonStateList = session.selectList("Lesson-Mapper.selectLessonStateList");
		return LessonStateList;
	}
	
	@Override
	public int selectLessonAssignmentSeqNext() throws SQLException {
		int lessonId = session.selectOne("Lesson-Mapper.selectLessonAssignmentSeqNext");
		return lessonId;
	}

	@Override
	public void InsertNewLessonInfo(LessonVO lessonVO) throws SQLException {
		session.insert("Lesson-Mapper.InsertNewLessonInfo", lessonVO);
	}
	
	@Override
	public int InsertNewLessonTimeValues(LessonVO lessonVO) throws SQLException {
		
		int result = 0;
		
		String lessonTimeInfoStr = lessonVO.getLessonTimeTarget();
		String[] lessonTimeInfoArr = lessonTimeInfoStr.split(",");
		List<TimeTableVO> lessonTimeInfoList = new ArrayList<TimeTableVO>();
		Map<String,Object> lessonTimeMap = new HashMap<String, Object>();
		
		for (String lessonTime : lessonTimeInfoArr) {
			TimeTableVO ttVO = new TimeTableVO();
			ttVO.setTimetableId(lessonTime);
			ttVO.setTimetablePeriod(Integer.parseInt(lessonVO.getLessonAssignmentId()));
			lessonTimeInfoList.add(ttVO);
		}
		
		lessonTimeMap.put("lessonTimeInfoList", lessonTimeInfoList);
		
		session.insert("Lesson-Mapper.InsertNewLessonTimeValues", lessonTimeMap);
		
		return result;
	}

	@Override
	public List<LessonVO> selectLessonSearchList(Map<String, Object> searchInfoMap) throws SQLException {
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectLessonSearchList",searchInfoMap);
		return lessonList;
	}
	
	@Override
	public List<StandardCodeVO> selectLessonStateCodeList() throws SQLException {
		List<StandardCodeVO> lessonStateCodeList = session.selectList("Lesson-Mapper.selectLessonStateCodeList");
		return lessonStateCodeList;
	}

	@Override
	public List<StudentVO> selectIncludeStudentListByLessonID(String lessonId) {
		List<StudentVO> list = session.selectList("Lesson-Mapper.selectIncludeStudentListByLessonID", lessonId);
		return list;
	}

	@Override
	public List<StudentVO> selectNotIncludeStudentListByLessonID(String lessonId) {
		List<StudentVO> list = session.selectList("Lesson-Mapper.selectNotIncludeStudentListByLessonID", lessonId);
		return list;
	}

	@Override
	public void deleteOldInfo(HashMap<String, Object> params) {
		session.delete("Lesson-Mapper.deleteoldInfo", params);
	}
	
	@Override
	public int insertTakeLessonValues(HashMap<String, Object> params) {
		int result = session.insert("Lesson-Mapper.insertTakeLessonValues", params);
		return result;
	}

	@Override
	public List<StudentVO> selectSearchIncludeStudentList(Criteria cri) {
		List<StudentVO> list = session.selectList("Lesson-Mapper.selectSearchIncludeStudentList", cri);
		return list;
	}

	@Override
	public List<StudentVO> selectSearchNotIncludeStudentList(Criteria cri) {
		List<StudentVO> list = session.selectList("Lesson-Mapper.selectSearchNotIncludeStudentList", cri);
		return list;
	}

	@Override
	public int insertLesson(LessonVO lessonVO) {
		int result = session.insert("Lesson-Mapper.insertLesson", lessonVO);
		return result;
	}

	@Override
	public List<LessonVO> selectModuleLessonList(SearchHelper sh,Criteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectModuleLessonList",sh, rowBounds);
		
		return lessonList;
	}
	@Override
	public List<LessonVO> selectModuleLessonListCount(SearchHelper sh) throws SQLException {
		
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectModuleLessonList",sh);
		
		return lessonList;
	}


	@Override
	public List<LessonVO> selectByMngLessonAssignmentIdList(String id) throws SQLException {
		List<LessonVO> list = session.selectList("Lesson-Mapper.selectByMngLessonAssignmentIdList",id);
		
		return list;
	}

	@Override
	public List<LessonVO> selectManagerScheduleListByPeriod(HashMap<String, Object> params) {
		List<LessonVO> scheduleList = session.selectList("Lesson-Mapper.selectStudentScheduleListByPeriod", params);
		return scheduleList;
	}
	

	@Override
	public List<String> selectManagerScheduleListByPeriodNotIncludeClassRoom(HashMap<String, Object> params) {
		List<String> scheduleList = session.selectList("Lesson-Mapper.selectManagerScheduleListByPeriodNotIncludeClassRoom", params);
		return scheduleList;
	}


	@Override
	public List<LessonVO> selectTakeLesson() throws SQLException {
		List<LessonVO> selectList = session.selectList("Lesson-Mapper.selectTakeLesson");
		return selectList;
	}

	@Override
	public List<LessonVO> selectTakeLessonname(String num) throws SQLException {
		List<LessonVO> selectList = session.selectList("Lesson-Mapper.selectLessonName",num);
		return selectList;
	}

	@Override
	public List<LessonVO> selectLessonId(String lessonasId) throws SQLException {
		List<LessonVO> selectList = session.selectList("Lesson-Mapper.selectLessonId",lessonasId);
		return selectList;
	}

	
	@Override
	public List<LessonRoomVO> selectAvailableLessonRoomList(HashMap<String, Object> params) {
		List<LessonRoomVO> lessonRoomList = session.selectList("Lesson-Mapper.selectAvailableLessonRoomList", params);
		return lessonRoomList;
	}

	@Override
	public LessonVO selectLessonInfoByLessonAssignmentId(String lessonAssignmentId) {
		LessonVO lesson = session.selectOne("Lesson-Mapper.selectLessonInfoByLessonAssignmentId", lessonAssignmentId);
		return lesson;
	}

	@Override
	public List<String> selectLessonScheduleListByLessonAssignmentId(String lessonAssignmentId) {
		List<String> lessonScheduleList = session.selectList("Lesson-Mapper.selectLessonScheduleListByLessonAssignmentId", lessonAssignmentId);
		return lessonScheduleList;
	}

	@Override
	public int selectLessonCount() {
		int count = session.selectOne("Lesson-Mapper.selectLessonCount");
		return count;
	}

	@Override
	public List<LessonVO> selectLessonIntegratedSearchList(Map<String, Object> searchInfoMap) {
//		int offset=cri.getStartRowNum();
//		int limit=cri.getPerPageNum();		
//		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectLessonIntegratedSearchList",searchInfoMap);
		return lessonList;
	}

	@Override
	public int updateLessonAssignmentDetailInfo(LessonVO lessonVO) {
		int result = session.update("Lesson-Mapper.updateLessonAssignmentDetailInfo", lessonVO);
		return result;
	}

	@Override
	public List<LessonVO> selectdayList(String day) {
		List<LessonVO> list = session.selectList("Lesson-Mapper.selectdayList", day);
		return list;
	}

	@Override
	public LessonVO selectModuleLessonDetail(String lessonId) {
		LessonVO lesson = session.selectOne("Lesson-Mapper.selectModuleLessonDetail", lessonId);
		return lesson;
	}

	@Override
	public List<LessonVO> selectModuleNotSearchLessonList(String keyword) {
		
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectModuleNotSearchLessonList",keyword);
		return lessonList;
	}

	@Override
	public List<LessonVO> selectdayUserList(String day, String studentId) {
		HomeworkVO homeworkVO = new HomeworkVO();
		homeworkVO.setHwkDuedate(day);
		homeworkVO.setStudentId(studentId);
		List<LessonVO> list = session.selectList("Lesson-Mapper.selectdayListByUserId", homeworkVO);
		return list;
	}

	@Override
	public List<LessonVO> selectStudentScheduleListByPeriod(HashMap<String, Object> params) {
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectdayListByUserIdAndPeriod",params);
		return lessonList;
	}

	@Override
	public List<LessonVO> selectLessonListByPeriod(HashMap<String, Object> params) {
		List<LessonVO> lessonList = session.selectList("Lesson-Mapper.selectLessonListByPeriod",params);
		return lessonList;
	}

	@Override
	public String isUserLesson(LessonVO lessonVO) {
		String result = session.selectOne("Lesson-Mapper.isUserLesson",lessonVO);
		
		return result;
	}

	@Override
	public int cancellationGo(HashMap<String, Object> params) {
		int result = 0;
		if(session.selectOne("Lesson-Mapper.checkPaymentHistory",params) == null) {
			//결제 기록이 없을 경우
			session.delete("Lesson-Mapper.deleteTakeLessonInfo", params);
			return 10;
		} else {
			result = session.update("Lesson-Mapper.cancellationGo",params);
			return result;
		}
	}

	@Override
	public int lessonApplyGo(HashMap<String, Object> params) {
		int result = session.insert("Lesson-Mapper.lessonApplyGo", params);
		return result;
	}

	@Override
	public int insertSyllabusToDataBase(HashMap<String, Object> params) {
		int result = session.insert("Lesson-Mapper.getSyllabusToDataBase",params);
		return result;
	}

	@Override
	public String selectSyllabusAddress(String lessonAssignmentId) {
		String result = session.selectOne("Lesson-Mapper.getSyllabusAddress",lessonAssignmentId);
		return result;
	}

	@Override
	public void updateLessonStateByStartDate() {
		session.selectOne("Lesson-Mapper.updateLessonStateByStartDate");		
	}

	@Override
	public void updateLessonStateByEndDate() {
		session.selectOne("Lesson-Mapper.updateLessonStateByEndDate");		
	}

	@Override
	public void updateCheckLessonCloseByStartDate() {
		session.selectOne("Lesson-Mapper.updateCheckLessonCloseByStartDate");		
	}

	@Override
	public List<LessonVO> forMainGetLesson(String id) throws SQLException {
		List<LessonVO> selectLessonList = session.selectList("Lesson-Mapper.forMainGetLesson", id);
		return selectLessonList;
	}

	@Override
	public List<LessonVO> forMainGetLessonEnd(String id) throws SQLException {
		List<LessonVO> selectLessonEndList = session.selectList("Lesson-Mapper.forMainGetLessonEnd", id);
		return selectLessonEndList;
	}

	@Override
	public void updateLessonAssignmentTableLaTimeInfo(HashMap<String, Object> params) {
		session.update("Lesson-Mapper.updateLessonAssignmentTableLaTimeInfo",params);
		session.delete("Lesson-Mapper.deleteOldLessonTime",params);
		session.insert("Lesson-Mapper.insertNewTakeLessonValues", params);
	}

	

}
