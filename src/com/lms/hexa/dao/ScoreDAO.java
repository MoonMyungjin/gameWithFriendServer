package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.ChartVO;
import com.lms.hexa.dto.ExamVO;
import com.lms.hexa.dto.FeedBackVO;
import com.lms.hexa.dto.MarkVO;
import com.lms.hexa.dto.QuestionVO;
import com.lms.hexa.dto.ScoreVO;

public interface ScoreDAO {

	// 시험등록
	public void insertExam(ExamVO exam) throws SQLException;
	
	// 시험 정보 조회
	public ExamVO selectExam(int examId) throws SQLException;
	
	// 시험리스트 조회
	public List<ExamVO> selectExamList() throws SQLException;
	
	// 문항 리스트 조회
	public List<QuestionVO> selectQuestionList(int examId) throws SQLException;
	
	public List<MarkVO> selectMarkList(MarkVO mark) throws SQLException;
	
	public ScoreVO selectScore(MarkVO mark) throws SQLException;
	
	// 영역 리스트 가져오기
	public List<QuestionVO> selectQuesAreaList(int examId) throws SQLException;
	
	public int insertQuestionList(HashMap<String, Object> params) throws SQLException;
	
	public int insertMarkList(HashMap<String, Object> params) throws SQLException;
	
	public int deleteQuestionList(int examId) throws SQLException;
	
	public int deleteMarkList(MarkVO deleteMark) throws SQLException;
	
	//검색
	List<ExamVO> searchExamList(String value) throws SQLException;
	
	// 학생별 시험
	List<ExamVO> selectExamByStudent(String studentId) throws SQLException;
	
	// 종합점수
	List<ExamVO> selectOverallScore(HashMap<String, Object> params) throws SQLException;
	
	// 피드백 가져오기
	List<FeedBackVO> selectFeedBack(HashMap<String, Object> params) throws SQLException;
	
	// 피드백 저장
	int insertFeedback(HashMap<String, Object> params) throws SQLException;
	
	// 시험 검색
	List<ExamVO> examSearch(HashMap<String, Object> params) throws SQLException;
	
	// chart1 
	List<ExamVO> selectChart1(HashMap<String, Object> params) throws SQLException;

	List<ExamVO> selectChart2(HashMap<String, Object> params) throws SQLException;
	
	// 차트3 
	int selectTotalNum(HashMap<String, Object> params) throws SQLException;
	int selectGetNum(HashMap<String, Object> params) throws SQLException;
	
	int selectGoodTotalNum(HashMap<String, Object> params) throws SQLException;
	int selectGoodNum(HashMap<String, Object> params) throws SQLException;
	
	int selectFairTotalNum(HashMap<String, Object> params) throws SQLException;
	int selectFairNum(HashMap<String, Object> params) throws SQLException;
	
	int selectPoorTotalNum(HashMap<String, Object> params) throws SQLException;
	int selectPoorNum(HashMap<String, Object> params) throws SQLException;
	
	// 차트 4
	List<ExamVO> selectChart4(HashMap<String, Object> params) throws SQLException;

	public List<AttachVO> selectAttachList(int examId) throws SQLException;

	public void updateAttach(ScoreVO score) throws SQLException;
	
	public int insertScore(HashMap<String, Object> params) throws SQLException;
	
	public int deleteScore(ScoreVO score) throws SQLException;
	
	public int updateExam(ExamVO modifyExam) throws SQLException;
	
}
