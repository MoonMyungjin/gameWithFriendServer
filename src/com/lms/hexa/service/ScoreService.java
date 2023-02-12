package com.lms.hexa.service;

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

public interface ScoreService {
	
	// 시험 등록
	public void examRegist(ExamVO exam) throws Exception;
	
	// 시험 조회
	public ExamVO getExam(int examId) throws Exception;
	
	public List<ExamVO> getExamList() throws Exception;
	
	public List<QuestionVO> getQuestionList(int examId) throws Exception;
	
	public List<QuestionVO> getQuesAreaList(int examId) throws Exception;
	
	public int questionUpdate(HashMap<String, Object> params) throws Exception;
	
	public int markUpdate(HashMap<String, Object> params) throws Exception;
	
	public int scoreUpdate(HashMap<String, Object> params) throws Exception;
	
	// 검색
	List<ExamVO> getSearchExamList(String value) throws Exception;
	
	public List<MarkVO> getMarkList(MarkVO mark) throws Exception;
	
	public ScoreVO getScore(MarkVO mark) throws Exception;
	
	// 학생별 시험 리스트
	public Map<String, Object> getExamByStudent(String studentId) throws Exception;
	
	// 종합점수
	Map<String, Object> getOverallScore(HashMap<String, Object> params) throws Exception;
	
	// 피드백
	Map<String, Object> getFeedBack(HashMap<String, Object> params) throws Exception;
	
	// 피드백 저장
	int insertFeedback(HashMap<String, Object> params) throws Exception;
	
	// 시험 검색
	List<ExamVO> searchExam(HashMap<String, Object> params) throws Exception;
	
	//chart1
	List<ExamVO> selectChart1(HashMap<String, Object> params) throws Exception;

	List<ExamVO> selectChart2(HashMap<String, Object> params) throws Exception;

	// 차트3
	ChartVO selectChart3(HashMap<String, Object> params) throws Exception;
	
	// 차트4
	List<ExamVO> selectChart4(HashMap<String, Object> params) throws Exception;
	
	// 파일 저장
	void regist(ScoreVO score,int attachGroupId) throws SQLException;
	
	// 파일 리스트
	List<AttachVO> getAttachList(int examId) throws SQLException;
	
	public int modifyExam(ExamVO modifyExam) throws SQLException;
}
