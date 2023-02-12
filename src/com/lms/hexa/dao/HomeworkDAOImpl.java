package com.lms.hexa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.HomeworkVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StudentVO;

public class HomeworkDAOImpl implements HomeworkDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<LessonVO> selectLessonIntegratedSearchList(Criteria cri) {
		List<LessonVO> lessonList = session.selectList("Homework-Mapper.selectLessonIntegratedSearchList", cri);
		return lessonList;
	}

	@Override
	public void insertHomeWork(HomeworkVO homeworkVO) {
		session.update("Homework-Mapper.insertHomeWork", homeworkVO);
	}

	@Override
	public int selectHomeWorkSeqNextValue() {
		int HwkId = session.selectOne("Homework-Mapper.selectHomeWorkSeqNextValue");
		return HwkId;
	}

	@Override
	public void insertGivenHomeWorkStudentList(Map<String, Object> insertHomeWorkMap) {
		session.delete("Homework-Mapper.deleteGivenHomeWorkStudentList",insertHomeWorkMap);
		session.update("Homework-Mapper.insertGivenHomeWorkStudentList",insertHomeWorkMap);
		
	}
	
	@Override
	public List<HomeworkVO> selectHomeWorkList(String lessonAssignmentId) {
		List<HomeworkVO> homeworkList = session.selectList("Homework-Mapper.selectHomeWorkList",lessonAssignmentId);
		return homeworkList;
	}

	@Override
	public List<AttachVO> selectAttachfileList(String attachGroupId) {
		List<AttachVO> attachFileList = session.selectList("Homework-Mapper.selectAttachfileList", attachGroupId);
		return attachFileList;
	}

	@Override
	public List<StudentVO> selectGivenHomeworkStudentList(String lessonAssignmentId) {
		List<StudentVO> givenHomeworkStudentList = session.selectList("Homework-Mapper.selectGivenHomeworkStudentList", lessonAssignmentId);
		return givenHomeworkStudentList;
	}

	@Override
	public List<StudentVO> notGivenHomeworkStudentList(HomeworkVO homeworkVO) {
		List<StudentVO> notGivenHomeworkStudentList = session.selectList("Homework-Mapper.selectNotGivenHomeworkStudentListByLessonID", homeworkVO);
		return notGivenHomeworkStudentList;
	}

	@Override
	public int selectHomeworkCount(int hwkId) {
		int result = session.selectOne("Homework-Mapper.selecthomeworkCount",hwkId);
		return result;
	}

	@Override
	public void deleteHomeWork(String homeworkId) {
		session.delete("Homework-Mapper.deleteHomeWork",homeworkId);
	}

	@Override
	public void deleteGivenHomeWorkStudentListForstr(String homeworkId) {
		session.delete("Homework-Mapper.deleteGivenHomeWorkStudentListForstr",homeworkId);
		
	}

	@Override
	public void deleteAttachFileList(String homeworkId) {
		session.delete("Homework-Mapper.deleteAttachFileList",homeworkId);
		
	}

	@Override
	public List<LessonVO> selectUserLessonListByloginId(String id) {
		List<LessonVO> selectUserLessonList = session.selectList("Homework-Mapper.selectUserLessonListByloginId", id);
		return selectUserLessonList;
	}

	@Override
	public List<HomeworkVO> selectHomeWorkList(HomeworkVO homeworkVO) {
		List<HomeworkVO> homeWorkList = session.selectList("Homework-Mapper.selectUserHomeworkListByUserInfo", homeworkVO);
		return homeWorkList;
	}

	@Override
	public HomeworkVO selectUserHomeworkDetailByUserInfo(HomeworkVO inHomeworkVO) {
		HomeworkVO homeWorkInfo = session.selectOne("Homework-Mapper.selectUserHomeworkDetailByUserInfo", inHomeworkVO);
		return homeWorkInfo;
	}

	@Override
	public void updateGivenHomeWork(HomeworkVO homeworkVO) {
		session.update("Homework-Mapper.updateGivenHomeWork", homeworkVO);
	}

	@Override
	public List<AttachVO> selectUserHomeworkAttachFileList(HomeworkVO inHomeworkVO) {
		List<AttachVO> attachFileList = session.selectList("Homework-Mapper.selectUserHomeworkAttachFileList", inHomeworkVO);
		return attachFileList;
	}

	@Override
	public List<HomeworkVO> selectGivenHomeWorkList(String homeworkId) {
		List<HomeworkVO> givenHomeWorkList = session.selectList("Homework-Mapper.selectGivenHomeWorkList",homeworkId);
		return givenHomeWorkList;
	}

	@Override
	public void finalConfirm(HomeworkVO inHomeworkVO) {
		session.update("Homework-Mapper.finalConfirm",inHomeworkVO);
	}

	@Override
	public List<LessonVO> selectLessonGoingIntegratedSearchList(Criteria cri) {
		List<LessonVO> lessonList = session.selectList("Homework-Mapper.selectLessonGoingIntegratedSearchList", cri);
		return lessonList;
	}
}
