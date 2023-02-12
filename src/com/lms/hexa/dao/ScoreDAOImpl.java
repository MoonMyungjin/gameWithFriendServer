package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.ChartVO;
import com.lms.hexa.dto.ExamVO;
import com.lms.hexa.dto.FeedBackVO;
import com.lms.hexa.dto.MarkVO;
import com.lms.hexa.dto.QuestionVO;
import com.lms.hexa.dto.ScoreVO;

public class ScoreDAOImpl implements ScoreDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override // 시험 등록
	public void insertExam(ExamVO exam) throws SQLException {
		session.update("Score-Mapper.insertExam", exam);
	}
	
	@Override // 시험 조회
	public ExamVO selectExam(int examId) throws SQLException {
		ExamVO exam = session.selectOne("Score-Mapper.selectExam", examId);
		return exam;
	}

	@Override // 시험리스트 조회
	public List<ExamVO> selectExamList() throws SQLException {
		List<ExamVO> examList = session.selectList("Score-Mapper.selectExamList");
		return examList;
	}

	@Override
	public List<QuestionVO> selectQuestionList(int examId) throws SQLException {
		List<QuestionVO> questionList = session.selectList("Score-Mapper.selectQuestionList", examId);
		return questionList;
	}

	@Override
	public List<QuestionVO> selectQuesAreaList(int examId) throws SQLException {
		List<QuestionVO> quesAreaList = session.selectList("Score-Mapper.selectQuesAreaList",examId);
		return quesAreaList;
	}

	@Override
	public int insertQuestionList(HashMap<String, Object> params) throws SQLException {
		int result = 0;
		
		result = session.insert("Score-Mapper.insertQuestionList", params);
		
		return result;
	}
	
	@Override
	public int insertMarkList(HashMap<String, Object> params) throws SQLException {
		int result = 0;
		
		result = session.insert("Score-Mapper.insertMarkList", params);
		
		return result;
	}

	@Override
	public int deleteQuestionList(int examId) throws SQLException {
		int result = 0;
		
		result = session.delete("Score-Mapper.deleteQuestionList", examId);
		
		return result;
	}
	
	@Override
	public int deleteMarkList(MarkVO deleteMark) throws SQLException {
		int result = 0;
		
		result = session.delete("Score-Mapper.deleteMarkList", deleteMark);
		
		return result;
	}

	@Override
	public List<ExamVO> searchExamList(String value) throws SQLException {
		List<ExamVO> examList = session.selectList("Score-Mapper.searchExam", value);
		return examList;
	}

	@Override
	public List<MarkVO> selectMarkList(MarkVO mark) throws SQLException {
		List<MarkVO> markList = session.selectList("Score-Mapper.selectMarkList", mark);
		return markList;
	}
	
	@Override
	public ScoreVO selectScore(MarkVO mark) throws SQLException {
		ScoreVO result = session.selectOne("Score-Mapper.selectScore", mark);
		return result;
	}

	@Override
	public List<ExamVO> selectExamByStudent(String studentId) throws SQLException {
		System.out.println("dao : " + studentId);
		List<ExamVO> examByStudent = session.selectList("Score-Mapper.examCheckByStudent", studentId);
		return examByStudent;
	}

	@Override
	public List<ExamVO> selectOverallScore(HashMap<String, Object> params) throws SQLException {
		List<ExamVO> overallScore = session.selectList("Score-Mapper.selectOverall", params);
		return overallScore;
	}

	@Override
	public List<FeedBackVO> selectFeedBack(HashMap<String, Object> params) throws SQLException {
		List<FeedBackVO> feedbackList = session.selectList("Score-Mapper.selectFeedBack", params);
		return feedbackList;
	}

	@Override
	public int insertFeedback(HashMap<String, Object> params) throws SQLException {
		
		System.out.println("dao : " + params);
		
		int result = session.update("Score-Mapper.insertFeedback", params);
		return result;
		
	}

	@Override
	public List<ExamVO> examSearch(HashMap<String, Object> params) throws SQLException {
		List<ExamVO> exam = session.selectList("Score-Mapper.examSearch", params);
		return exam;
	}

	@Override
	public List<ExamVO> selectChart1(HashMap<String, Object> params) throws SQLException {
		List<ExamVO> chart1 = session.selectList("Score-Mapper.selectChart1", params);
		return chart1;
	}

	@Override
	public List<ExamVO> selectChart2(HashMap<String, Object> params) throws SQLException {
		List<ExamVO> chart2 = session.selectList("Score-Mapper.selectChart2", params);
		return chart2;
	}

	// 차트 3
	
	@Override
	public int selectTotalNum(HashMap<String, Object> params) throws SQLException {
		int totalNum = session.selectOne("Score-Mapper.selectTotalNum", params);
		return totalNum;
	}

	@Override
	public int selectGetNum(HashMap<String, Object> params) throws SQLException {
		int getNum = session.selectOne("Score-Mapper.selectGetNum", params);
		return getNum;
	}

	@Override
	public int selectGoodTotalNum(HashMap<String, Object> params) throws SQLException {
		int goodTotalNum = session.selectOne("Score-Mapper.selectGoodTotalNum", params);
		return goodTotalNum;
	}

	@Override
	public int selectGoodNum(HashMap<String, Object> params) throws SQLException {
		int goodNum = session.selectOne("Score-Mapper.selectGoodNum", params);
		return goodNum;
	}

	@Override
	public int selectFairTotalNum(HashMap<String, Object> params) throws SQLException {
		int fairTotalNum = session.selectOne("Score-Mapper.selectFairTotalNum", params);
		return fairTotalNum;
	}

	@Override
	public int selectFairNum(HashMap<String, Object> params) throws SQLException {
		int fairNum = session.selectOne("Score-Mapper.selectFairNum", params);
		return fairNum;
	}

	@Override
	public int selectPoorTotalNum(HashMap<String, Object> params) throws SQLException {
		int poorTotalNum = session.selectOne("Score-Mapper.selectPoorTotalNum", params);
		return poorTotalNum;
	}

	@Override
	public int selectPoorNum(HashMap<String, Object> params) throws SQLException {
		int poorNum = session.selectOne("Score-Mapper.selectPoorNum", params);
		return poorNum;
	}

	@Override
	public List<ExamVO> selectChart4(HashMap<String, Object> params) throws SQLException {
		List<ExamVO> chart4 = session.selectList("Score-Mapper.selectchart4", params);
		return chart4;
	}

	@Override
	public List<AttachVO> selectAttachList(int examId) throws SQLException {
		List<AttachVO> attachList = session.selectList("Score-Mapper.selectAttachList", examId);
		return attachList;
	}

	@Override
	public void updateAttach(ScoreVO score) throws SQLException {
		session.update("Score-Mapper.updateAttach", score);
		
	}

	@Override
	public int insertScore(HashMap<String, Object> params) throws SQLException {
		int result = 0;
		
		result = session.insert("Score-Mapper.insertScore", params);
		
		return result;
	}

	@Override
	public int deleteScore(ScoreVO score) throws SQLException {
		int result = 0;
		
		result = session.delete("Score-Mapper.deleteScore", score);
		
		return result;
	}

	@Override
	public int updateExam(ExamVO modifyExam) throws SQLException {
		int result = 0;
		
		result = session.update("Score-Mapper.updateExam", modifyExam);
		
		return result;
	}

	

	
	
}
