package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;



import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.SchoolVO;



public interface NoticeService {
	
	//리스트 조회
	Map<String, Object> getList(Criteria cri) throws SQLException;
	
	// 글 조회
	NoticeVO getNotice(int noticeId) throws SQLException;
	 
	 void regist(NoticeVO notice) throws SQLException;
	
	 void modify(NoticeVO notice) throws SQLException;
	 
	 void  remove(int noticeId) throws SQLException;
	 
	 
	 NoticeVO detail(int noticeId) throws SQLException;

	SchoolVO getSchoolURL(String userId);

	List<NoticeVO> getSchoolNoticeList(String schoolUrl,Criteria cri);

	NoticeVO crawlDetail(NoticeVO inNotice);
}
