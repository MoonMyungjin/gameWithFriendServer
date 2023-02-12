package com.lms.hexa.dao;

import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.HomeworkVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StudentVO;

public interface HomeworkDAO {

	// 검색한 수업 list조회
	List<LessonVO> selectLessonIntegratedSearchList(Criteria cri);
	
	// 숙제 insert
	void insertHomeWork(HomeworkVO homeworkVO);

	int selectHomeWorkSeqNextValue();

	void insertGivenHomeWorkStudentList(Map<String, Object> insertHomeWorkMap);

	List<HomeworkVO> selectHomeWorkList(String lessonAssignmentId);

	List<AttachVO> selectAttachfileList(String attachGroupId);

	List<StudentVO> selectGivenHomeworkStudentList(String lessonAssignmentId);
	
	List<StudentVO> notGivenHomeworkStudentList(HomeworkVO homeworkVO);

	int selectHomeworkCount(int hwkId);

	void deleteHomeWork(String homeworkId);

	void deleteGivenHomeWorkStudentListForstr(String homeworkId);

	void deleteAttachFileList(String homeworkId);

	List<LessonVO> selectUserLessonListByloginId(String id);

	List<HomeworkVO> selectHomeWorkList(HomeworkVO homeworkVO);

	HomeworkVO selectUserHomeworkDetailByUserInfo(HomeworkVO inHomeworkVO);

	void updateGivenHomeWork(HomeworkVO homeworkVO);

	List<AttachVO> selectUserHomeworkAttachFileList(HomeworkVO inHomeworkVO);

	List<HomeworkVO> selectGivenHomeWorkList(String homeworkId);

	void finalConfirm(HomeworkVO inHomeworkVO);

	List<LessonVO> selectLessonGoingIntegratedSearchList(Criteria cri);

}
