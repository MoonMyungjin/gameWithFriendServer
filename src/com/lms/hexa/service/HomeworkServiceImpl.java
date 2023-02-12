package com.lms.hexa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dao.AttachDAO;
import com.lms.hexa.dao.HomeworkDAO;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.HomeworkVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StudentVO;

public class HomeworkServiceImpl implements HomeworkService{
	
	private HomeworkDAO homeworkDAO;
	
	public void setHomeworkDAO(HomeworkDAO homeworkDAO) {
		this.homeworkDAO = homeworkDAO;
	}
	
	private AttachDAO attachDAO;
	
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public List<LessonVO> getLessonIntegratedSearchList(Criteria cri) {
		List<LessonVO> lessonList = homeworkDAO.selectLessonIntegratedSearchList(cri);
		return lessonList;
	}

	@Override
	public void regist(HomeworkVO homeworkVO,ArrayList<String> studentIdlist,int attachGroupId,int attachId) {
		if(attachGroupId == 0) {
			attachGroupId = attachDAO.selectAttachSeqNextValue();
		} else {
			attachId = attachDAO.selectMAXattachID(attachGroupId);
		}
		
		Map<String,Object> insertHomeWorkMap = new HashMap<String,Object>();
		
		if(homeworkVO.getAttachList() != null) {
			
			int index = 1;
			if(attachId != 0) {
				index += attachId;
			}
			for (AttachVO attach : homeworkVO.getAttachList()) {
				attach.setAttachGroupId(attachGroupId);
				attach.setAttachWriter(homeworkVO.getManagerId());
				attach.setAttachId(index);
				attachDAO.insertAttach(attach);
				index++;
			}
		}
		
		homeworkVO.setAttachGroupId(attachGroupId);

		int result = homeworkDAO.selectHomeworkCount(homeworkVO.getHwkId());
		int hwkId = 0;
		
		if (result == 0) {
			hwkId = homeworkDAO.selectHomeWorkSeqNextValue();
			homeworkVO.setHwkId(hwkId);
		} else {
			hwkId = homeworkVO.getHwkId();
		}
		
		homeworkDAO.insertHomeWork(homeworkVO);
		insertHomeWorkMap.put("hwkId",hwkId);
		insertHomeWorkMap.put("studentIdlist",studentIdlist);
		
		homeworkDAO.insertGivenHomeWorkStudentList(insertHomeWorkMap);
	}

	@Override
	public List<HomeworkVO> getHomeWorkList(String lessonAssignmentId) {
		List<HomeworkVO> homeworkList = homeworkDAO.selectHomeWorkList(lessonAssignmentId);
		return homeworkList;
	}

	@Override
	public List<AttachVO> getAttachfileList(String attachGroupId) {
		List<AttachVO> attachFileList = homeworkDAO.selectAttachfileList(attachGroupId);
		return attachFileList;
	}

	@Override
	public List<StudentVO> getGivenHomeworkStudentList(String lessonAssignmentId) {
		List<StudentVO> givenHomeworkStudentList = homeworkDAO.selectGivenHomeworkStudentList(lessonAssignmentId);
		return givenHomeworkStudentList;
	}

	@Override
	public List<StudentVO> getNotGivenHomeworkStudentList(HomeworkVO homeworkVO) {
		List<StudentVO> notGivenHomeworkStudentList = homeworkDAO.notGivenHomeworkStudentList(homeworkVO);
		return notGivenHomeworkStudentList;
	}

	@Override
	public void removeHomeWork(String homeworkId) {
		homeworkDAO.deleteHomeWork(homeworkId);
		homeworkDAO.deleteGivenHomeWorkStudentListForstr(homeworkId);
		homeworkDAO.deleteAttachFileList(homeworkId);
	}

	@Override
	public List<LessonVO> getUserLessonListByloginId(String id) {
		List<LessonVO> userLessonList = homeworkDAO.selectUserLessonListByloginId(id);
		return userLessonList;
	}

	@Override
	public List<HomeworkVO> userGetHomeWorkList(HomeworkVO homeworkVO) {
		List<HomeworkVO> userHomeWorkList = homeworkDAO.selectHomeWorkList(homeworkVO);
		return userHomeWorkList;
	}

	@Override
	public HomeworkVO getUserHomeworkDetailByUserInfo(HomeworkVO inHomeworkVO) {
		HomeworkVO userHomeWorkInfo = homeworkDAO.selectUserHomeworkDetailByUserInfo(inHomeworkVO);
		return userHomeWorkInfo;
	}

	@Override
	public void studentHomeworkRegist(HomeworkVO homeworkVO,int attachGroupId,int attachId) {
		if(attachGroupId == 0) {
			attachGroupId = attachDAO.selectAttachSeqNextValue();
		}
		
		if(homeworkVO.getAttachList() != null) {
			
			int index = 1;
			if(attachId != 0) {
				index += 10; 
			}
			for (AttachVO attach : homeworkVO.getAttachList()) {
				attach.setAttachGroupId(attachGroupId);
				attach.setAttachWriter(homeworkVO.getStudentId());
				attach.setAttachId(index);
				attachDAO.insertAttach(attach);
				index++;
			}
		}
		
		homeworkVO.setAttachGroupId(attachGroupId);
		homeworkDAO.updateGivenHomeWork(homeworkVO);
		
	}

	@Override
	public List<AttachVO> getUserHomeworkAttachFileList(HomeworkVO inHomeworkVO) {
		List<AttachVO> attachFileList = homeworkDAO.selectUserHomeworkAttachFileList(inHomeworkVO);
		return attachFileList;
	}

	@Override
	public List<HomeworkVO> getGivenHomeWorkList(String homeworkId) {
		List<HomeworkVO> givenHomeWorkList = homeworkDAO.selectGivenHomeWorkList(homeworkId);
		return givenHomeWorkList;
	}

	@Override
	public void finalConfirm(HomeworkVO inHomeworkVO) {
		homeworkDAO.finalConfirm(inHomeworkVO);
	}

	@Override
	public List<LessonVO> getLessonGoingIntegratedSearchList(Criteria cri) {
		List<LessonVO> lessonList = homeworkDAO.selectLessonGoingIntegratedSearchList(cri);
		return lessonList;
	}
	
}
