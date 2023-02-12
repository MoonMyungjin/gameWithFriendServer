package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.KakaoSendVO;

public class KakaoSendDAOImpl implements KakaoSendDAO {
		
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insertKakaoSendList(HashMap<String, Object> params) throws Exception {
		int result = session.insert("KakaoSend-Mapper.insertSendList",params);
		return result;
	}

	@Override
	public List<KakaoSendVO> selectKakaoSendList(Criteria cri) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<KakaoSendVO> kakaoSendList = session.selectList("KakaoSend-Mapper.selectKakaoSendList",cri,rowBounds);
		return kakaoSendList;
	}

	@Override
	public int selectKakaoSendListTotalCount(Criteria cri) throws SQLException {
		int count = session.selectOne("KakaoSend-Mapper.selectKakaoSendListTotalCount", cri);
		return count;
	}
	
	
}
