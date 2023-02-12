package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.NoticeDAO;
import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.SchoolVO;


public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	
	@Override
	public NoticeVO getNotice(int noticeId) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByNno(noticeId);
		return notice;
	}
	
	
	
	@Override
	public Map<String, Object> getList(Criteria cri) throws SQLException {

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<NoticeVO> noticeList = noticeDAO.selectNoticeCriteria(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeDAO.selectNoticeCriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public List<NoticeVO> getSchoolNoticeList(String schoolUrl,Criteria cri) {
		List<NoticeVO> schoolNoticeList = noticeDAO.selectNoticeList(schoolUrl,cri);
		return schoolNoticeList;
	}
	  
	  
	  @Override
	  public void regist(NoticeVO notice) throws SQLException {
		  
		  int noticeId = noticeDAO.getSeqNextValue();
			
			notice.setNoticeId(noticeId);
		  
		   noticeDAO.insertNotice(notice); 
	  }
	  
	  @Override
	  public void modify(NoticeVO notice) throws SQLException {
	  
		  noticeDAO.updateNotice(notice);
	  }
	  
	  @Override 
	  public void remove(int noticeId) throws SQLException {
	  
	  noticeDAO.deleteNotice(noticeId); 
	  
	  }


	@Override
	public NoticeVO detail(int noticeId) throws SQLException {
		NoticeVO notice = noticeDAO.noticeDetail(noticeId);
		return notice;
	}


	@Override
	public SchoolVO getSchoolURL(String userId) {
		SchoolVO schoolInfo = noticeDAO.selectSchoolURL(userId);
		return schoolInfo;
	}




	@Override
	public NoticeVO crawlDetail(NoticeVO inNotice) {
		NoticeVO notice = noticeDAO.crawlDetail(inNotice);
		return notice;
	}

	

}
