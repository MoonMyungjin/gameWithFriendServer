package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.lms.hexa.dao.AttachDAO;
import com.lms.hexa.dao.ScoreDAO;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.ChartVO;
import com.lms.hexa.dto.ExamVO;
import com.lms.hexa.dto.FeedBackVO;
import com.lms.hexa.dto.MarkVO;
import com.lms.hexa.dto.QuestionVO;
import com.lms.hexa.dto.ScoreVO;

public class ScoreServiceImpl implements ScoreService {
	
	protected ScoreDAO scoreDAO;
	
	public void setScoreDAO(ScoreDAO scoreDAO) {
		this.scoreDAO = scoreDAO;
	}

	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override // 시험 등록
	public void examRegist(ExamVO exam) throws Exception {
		scoreDAO.insertExam(exam);
	}
	
	@Override // 시험 조회
	public ExamVO getExam(int examId) throws Exception {
		ExamVO exam = scoreDAO.selectExam(examId);
		return exam;
	}

	@Override // 시험 리스트 조회
	public List<ExamVO> getExamList() throws Exception {
		List<ExamVO> examList = scoreDAO.selectExamList();
		return examList;
	}

	@Override
	public List<QuestionVO> getQuestionList(int examId) throws Exception {
		List<QuestionVO> questionList = scoreDAO.selectQuestionList(examId);
		return questionList;
	}

	@Override
	public List<QuestionVO> getQuesAreaList(int examId) throws Exception {
		List<QuestionVO> quesAreaList = scoreDAO.selectQuesAreaList(examId);
		return quesAreaList;
	}

	@Override
	public int questionUpdate(HashMap<String, Object> params) throws Exception {
		
		int result = 0;
		
		System.out.println("문제" + params);
		
		int examId = (Integer) params.get("examId");
		
		
		scoreDAO.deleteQuestionList(examId);
		result = scoreDAO.insertQuestionList(params);
		
		return result;
	}
	
	@Override
	public int markUpdate(HashMap<String, Object> params) throws Exception {
		
		int result = 0;
		
		int examId = (Integer) params.get("examId");
		String studentId = (String) params.get("studentId");
		
		MarkVO deleteMark = new MarkVO();
		
		deleteMark.setExamId(examId);
		deleteMark.setStudentId(studentId);
		
		scoreDAO.deleteMarkList(deleteMark);
		
		result = scoreDAO.insertMarkList(params);
		
		return result;
	}
	
	@Override
	public int scoreUpdate(HashMap<String, Object> params) throws Exception {
		int result = 0;
		
		int examId = (Integer) params.get("examId");
		String studentId = (String) params.get("studentId");
		
		ScoreVO deleteScore = new ScoreVO();
		deleteScore.setSubExamId(examId);
		deleteScore.setStudentId(studentId);
		
		scoreDAO.deleteScore(deleteScore);
		scoreDAO.insertScore(params);
		
		return result;
	}

	@Override
	public List<ExamVO> getSearchExamList(String value) throws Exception {
		
		List<ExamVO> examList = scoreDAO.searchExamList(value);
		return examList;
	}

	@Override
	public List<MarkVO> getMarkList(MarkVO mark) throws Exception {
		List<MarkVO> markList = scoreDAO.selectMarkList(mark);
		return markList;
	}
	
	@Override
	public ScoreVO getScore(MarkVO mark) throws Exception {
		ScoreVO result = scoreDAO.selectScore(mark);
		return result;
	}

	@Override
	public Map<String, Object> getExamByStudent(String studentId) throws Exception {
//		System.out.println("서비스 : " + studentId);
		Map<String, Object> examByStudent = new HashMap<String, Object>();
		List<ExamVO> examByStudentList = scoreDAO.selectExamByStudent(studentId);
		examByStudent.put("examByStudentList", examByStudentList);
		return examByStudent;
	}

	@Override
	public Map<String, Object> getOverallScore(HashMap<String, Object> params) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ExamVO> overallScore = scoreDAO.selectOverallScore(params);
//		List<FeedBackVO> feedbackList = scoreDAO.selectFeedBack(params);
		
		dataMap.put("overallScore", overallScore);
//		dataMap.put("feedbackList", feedbackList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getFeedBack(HashMap<String, Object> params) throws Exception {
		
		Map<String, Object> feed = new HashMap<String, Object>();
		List<FeedBackVO> feedbackList = scoreDAO.selectFeedBack(params);
		
		feed.put("feedbackList", feedbackList);
		
		return feed;
	}

	@Override
	public int insertFeedback(HashMap<String, Object> params) throws Exception {
		
		System.out.println("service : " + params);
		
		int result = scoreDAO.insertFeedback(params);
		return result;
	}

	@Override
	public List<ExamVO> searchExam(HashMap<String, Object> params) throws Exception {
		List<ExamVO> exam = scoreDAO.examSearch(params);
		return exam;
	}

	@Override
	public List<ExamVO> selectChart1(HashMap<String, Object> params) throws Exception {
		List<ExamVO> chart1 = scoreDAO.selectChart1(params);
		return chart1;
	}
	
	@Override
	public List<ExamVO> selectChart2(HashMap<String, Object> params) throws Exception {
		List<ExamVO> chart2 = scoreDAO.selectChart2(params);
		return chart2;
	}

	@Override
	public ChartVO selectChart3(HashMap<String, Object> params) throws Exception {
		
		ChartVO chart3 = new ChartVO();
		
		int totalNum = scoreDAO.selectTotalNum(params);
		int getNum = scoreDAO.selectGetNum(params); 
		int goodTotalNum = scoreDAO.selectGoodTotalNum(params);
		int goodNum = scoreDAO.selectGoodNum(params); 
		int fairTotalNum = scoreDAO.selectFairTotalNum(params);
		int fairNum = scoreDAO.selectFairNum(params);
		int poorTotalNum = scoreDAO.selectPoorTotalNum(params);
		int poorNum = scoreDAO.selectPoorNum(params); 
		
		chart3.setTotalNum(totalNum);
		chart3.setGetNum(getNum);
		chart3.setGoodTotalNum(goodTotalNum);
		chart3.setGoodNum(goodNum);
		chart3.setFairTotalNum(fairTotalNum);
		chart3.setFairNum(fairNum);
		chart3.setPoorTotalNum(poorTotalNum);
		chart3.setPoorNum(poorNum);
		
		return chart3;
	}

	@Override
	public List<ExamVO> selectChart4(HashMap<String, Object> params) throws Exception {
		List<ExamVO> chart4 = scoreDAO.selectChart4(params);
		return chart4;
	}

	@Override
	public void regist(ScoreVO score,int attachGroupId) throws SQLException {
		int attachId = 0;
		if(attachGroupId == 0) {
			attachGroupId = attachDAO.selectAttachSeqNextValue();
		} else {
			attachId = attachDAO.selectMAXattachID(attachGroupId);
		}
		
		score.setAttachGroupId(attachGroupId);
		scoreDAO.updateAttach(score);
		
		if(score.getAttachList() != null) {
			int index = 1;
			if(attachId !=0) {
				index += attachId;
			}
			for(AttachVO attach : score.getAttachList()) {
				attach.setAttachId(index);
				attach.setAttachGroupId(attachGroupId);
				attach.setAttachWriter(score.getAttachWriter());
				score.setAttachGroupId(attachGroupId);
				
				attachDAO.insertAttach(attach);
				
				index++;
			}
		}
		
	}

	@Override
	public List<AttachVO> getAttachList(int examId) throws SQLException {
		List<AttachVO> attachList = scoreDAO.selectAttachList(examId);
		return attachList;
	}

	@Override
	public int modifyExam(ExamVO modifyExam) throws SQLException {
		int result = 0;
		
		result = scoreDAO.updateExam(modifyExam);
		
		return result;
	}

	

	

}
