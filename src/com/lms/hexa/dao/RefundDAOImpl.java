package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.RefundVO;



public class RefundDAOImpl implements RefundDAO{

	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}



	@Override
	public List<RefundVO> selectRefundtList() throws SQLException {
		List<RefundVO> list = session.selectList("Refund-Mapper.selectRefundList");
		return list;
	}



	@Override
	public void refund(RefundVO refundVO) {
		session.selectList("Refund-Mapper.deleteTakeLessonInfo",refundVO);
	}


	











	
}
