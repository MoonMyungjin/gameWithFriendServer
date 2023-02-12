package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.SchoolVO;


public interface NoticeDAO {

	 // list
	List<NoticeVO> selectNoticeCriteria(Criteria cri) throws SQLException;
		
	// 자료 전체 개수
	int selectNoticeCriteriaTotalCount(Criteria cri) throws SQLException;
	
	// notice_id에 따른 자료
	NoticeVO selectNoticeByNno(int noticeId) throws SQLException;
	
	
	void insertNotice(NoticeVO notice) throws SQLException;
	
	void updateNotice(NoticeVO notice) throws SQLException;
	
	void deleteNotice(int noticeId) throws SQLException;
	
	int getSeqNextValue() throws SQLException;
	
	List<NoticeVO> noticeForMain() throws SQLException;
	
	NoticeVO noticeDetail(int noticeId) throws SQLException;

	SchoolVO selectSchoolURL(String userId);

	List<NoticeVO> selectNoticeList(String schoolUrl,Criteria cri);
	
	List<NoticeVO> selectNoticeListForMain(String schoolUrl);

	NoticeVO crawlDetail(NoticeVO inNotice);
}
