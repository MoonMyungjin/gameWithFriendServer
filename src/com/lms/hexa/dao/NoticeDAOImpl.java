package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;


import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.SchoolVO;



public class NoticeDAOImpl implements NoticeDAO{

	
	private SqlSession session;
	private SqlSession mariaSession;
		
	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setMariaSession(SqlSession mariaSession) {
		this.mariaSession = mariaSession;
	}


	@Override
	public List<NoticeVO> selectNoticeCriteria(Criteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<NoticeVO> noticeList=
		   session.selectList("Notice-Mapper.selectSearchNoticeList",cri,rowBounds);	
			
		return noticeList;
	}

	@Override
	public List<NoticeVO> selectNoticeList(String schoolUrl,Criteria cri) {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		String keyword = cri.getKeyword();
		SchoolVO school = new SchoolVO();
		if(!(keyword==null || keyword.equals(""))) {
			school.setSchoolDong("%"+keyword+"%");
		}
		school.setSchoolURL(schoolUrl);
		List<NoticeVO> noticeList = mariaSession.selectList("MariaNotice-Mapper.selectNoticeList",school,rowBounds);
		return noticeList;
	}
	
	@Override
	public int selectNoticeCriteriaTotalCount(Criteria cri) throws SQLException {
		int count=session.selectOne("Notice-Mapper.selectSearchNoticeListCount",cri);
		return count;
	}
	
	@Override
	public NoticeVO selectNoticeByNno(int noticeId) throws SQLException {
		NoticeVO notice=session.selectOne("Notice-Mapper.selectNoticeByNno",noticeId);
		return notice;
	}



	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		session.insert("Notice-Mapper.insertNotice", notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice", notice);
				
	}

	@Override
	public void deleteNotice(int noticeId) throws SQLException {
		session.update("Notice-Mapper.deleteNotice", noticeId);
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		int noticeId = session.selectOne("Notice-Mapper.selectNoticeSeqNext");
		return noticeId;
	}


	@Override
	public List<NoticeVO> noticeForMain() throws SQLException {
		 List<NoticeVO> selectList = session.selectList("Notice-Mapper.noticeForMain");
		return selectList;
	}


	@Override
	public NoticeVO noticeDetail(int noticeId) throws SQLException {
		NoticeVO notice=session.selectOne("Notice-Mapper.noticeDetail",noticeId);
		return notice;
	}


	@Override
	public SchoolVO selectSchoolURL(String userId) {
		SchoolVO schoolURL = session.selectOne("Notice-Mapper.selectSchoolURL",userId);
		return schoolURL;
	}



	@Override
	public NoticeVO crawlDetail(NoticeVO inNotice) {
		NoticeVO notice = mariaSession.selectOne("MariaNotice-Mapper.selectNoticeDetail",inNotice);
		return notice;
	}

	@Override
	public List<NoticeVO> selectNoticeListForMain(String schoolUrl) {
		List<NoticeVO> noticeList = mariaSession.selectList("MariaNotice-Mapper.selectNoticeList2",schoolUrl);
		return noticeList;
	}

	
}
