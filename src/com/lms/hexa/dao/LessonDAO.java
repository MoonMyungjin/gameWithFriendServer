package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.LessonRoomVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StandardCodeVO;
import com.lms.hexa.dto.StudentVO;


public interface LessonDAO {

	// 직원 일정 조회
	List<String> selectManagerScheduleById(String Id) throws SQLException;
	
	// 강의실 list 조회
	List<LessonRoomVO> selectLessonRoomList() throws SQLException;
	// 강의대상 list 조회
	List<StandardCodeVO> selectStudentGradeCategoryCodeList() throws SQLException;
	
	List<StandardCodeVO> selectSubjectList() throws SQLException;
	
	List<StandardCodeVO> selectLessonStateList();

	// 강의정보 시퀀스 가져오기
	int selectLessonAssignmentSeqNext() throws SQLException;
	// 강의정보 insert
	void InsertNewLessonInfo(LessonVO lessonVO) throws SQLException;
	// 강의 시간정보 insert
	int InsertNewLessonTimeValues(LessonVO lessonVO) throws SQLException;
	
	// 강의목록 조회
	List<LessonVO> selectLessonSearchList(Map<String, Object> searchInfoMap)throws SQLException;
	// 강의 상태 list 조회
	List<StandardCodeVO> selectLessonStateCodeList() throws SQLException;
	
	// 수강회원목록
	List<StudentVO> selectIncludeStudentListByLessonID(String lessonId);
	// 비수강회원목록
	List<StudentVO> selectNotIncludeStudentListByLessonID(String lessonId);
	
	// 이전정보 삭제
	void deleteOldInfo(HashMap<String, Object> params);
	// 해당수업을 듣는 회원list 등록
	int insertTakeLessonValues(HashMap<String, Object> params);
	
	// 해당수업 듣는 회원검색list 
	List<StudentVO> selectSearchIncludeStudentList(Criteria cri);

	// 해당수업 듣는 비회원검색list 
	List<StudentVO> selectSearchNotIncludeStudentList(Criteria cri);

	// 수업등록
	int insertLesson(LessonVO lessonVO);
	
	// 수업기본정보 List
	List<LessonVO> selectModuleLessonList(SearchHelper sh,Criteria cri)throws SQLException;

	// 수업기본정보 ListCount
	List<LessonVO> selectModuleLessonListCount(SearchHelper sh)throws SQLException;

	// 수업 할당 리스트
	List<LessonVO> selectByMngLessonAssignmentIdList (String id)throws SQLException;
	
	// take lesson List
	List<LessonVO> selectTakeLesson () throws SQLException;
	
	// take lesson id
	List<LessonVO> selectLessonId(String lessonasId) throws SQLException;
	
	// take lesson name List
	List<LessonVO> selectTakeLessonname (String num) throws SQLException;
	
	// 기간별 직원 일정 조회
	List<LessonVO> selectManagerScheduleListByPeriod(HashMap<String, Object> params);
	
	// 기간별 직원 일정 조회
	List<String> selectManagerScheduleListByPeriodNotIncludeClassRoom(HashMap<String, Object> params);

	// 가능 강의실 목록 조회
	List<LessonRoomVO> selectAvailableLessonRoomList(HashMap<String, Object> params);
	
	// 강의배정 Id를 통해 강의 세부정보 가져오기
	LessonVO selectLessonInfoByLessonAssignmentId(String lessonAssignmentId);

	// 강의배정 Id를 통해 강의 시간표 가져오기
	List<String> selectLessonScheduleListByLessonAssignmentId(String lessonAssignmentId);

	int selectLessonCount();
	List<LessonVO> selectLessonIntegratedSearchList(Map<String, Object> searchInfoMap);

	int updateLessonAssignmentDetailInfo(LessonVO lessonVO);
	
	// 날짜('YYYYmmDD')를 넣어 해당 일의 수업정보 가져오기
	List<LessonVO> selectdayList(String day);
	
	// 강의 상세정보
	LessonVO selectModuleLessonDetail(String lessonId);

	List<LessonVO> selectModuleNotSearchLessonList(String keyword);

	List<LessonVO> selectdayUserList(String day, String studentId);

	List<LessonVO> selectStudentScheduleListByPeriod(HashMap<String, Object> params);

	List<LessonVO> selectLessonListByPeriod(HashMap<String, Object> params);

	String isUserLesson(LessonVO lessonVO);

	int cancellationGo(HashMap<String, Object> params);

	int lessonApplyGo(HashMap<String, Object> params);

	int insertSyllabusToDataBase(HashMap<String, Object> params);

	String selectSyllabusAddress(String lessonAssignmentId);

	void updateLessonStateByStartDate();
	void updateLessonStateByEndDate();
	void updateCheckLessonCloseByStartDate();
	
	//메인 수강 정보
	List<LessonVO> forMainGetLesson(String id) throws SQLException;
	//메인 수강 끝 정보 
	List<LessonVO> forMainGetLessonEnd(String id) throws SQLException;

	void updateLessonAssignmentTableLaTimeInfo(HashMap<String, Object> params);
}
