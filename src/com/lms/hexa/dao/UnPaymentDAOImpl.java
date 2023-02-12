package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import com.lms.hexa.dto.UnPaymentVO;



public class UnPaymentDAOImpl implements UnPaymentDAO{

	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<UnPaymentVO> selectUnPaymentList(UnPaymentVO unPayment) throws SQLException {
		List<UnPaymentVO> list = session.selectList("UnPayment-Mapper.selectUnPaymentList", unPayment);
		return list;
	}


	











	
}
