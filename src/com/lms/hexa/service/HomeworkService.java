package com.lms.hexa.service;

import java.util.ArrayList;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.HomeworkVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StudentVO;

public interface HomeworkService {
	
	// 강의정보 검색 list
	List<LessonVO> getLessonIntegratedSearchList(Criteria cri);
	
	// 강의정보저장
	void regist(HomeworkVO homeworkVO, ArrayList<String> studentIdlist,int attachGroupId,int attachId);
	
	//수업 리스트 조회
	List<HomeworkVO> getHomeWorkList(String lessonAssignmentId);
	
	//첨부파일 리스트 조회
	List<AttachVO> getAttachfileList(String attachGroupId);
	
	// 숙제 받은인원 list
	List<StudentVO> getGivenHomeworkStudentList(String lessonAssignmentId);

	// 숙제 안받은인원 list
	List<StudentVO> getNotGivenHomeworkStudentList(HomeworkVO homeworkVO);

	void removeHomeWork(String homeworkId);

	List<LessonVO> getUserLessonListByloginId(String id);
	
	List<HomeworkVO> userGetHomeWorkList(HomeworkVO homeworkVO);

	HomeworkVO getUserHomeworkDetailByUserInfo(HomeworkVO inHomeworkVO);

	void studentHomeworkRegist(HomeworkVO homeworkVO, int attachGroupId, int attachId);

	List<AttachVO> getUserHomeworkAttachFileList(HomeworkVO inHomeworkVO);

	List<HomeworkVO> getGivenHomeWorkList(String homeworkId);

	void finalConfirm(HomeworkVO inHomeworkVO);

	List<LessonVO> getLessonGoingIntegratedSearchList(Criteria cri);
	
}
