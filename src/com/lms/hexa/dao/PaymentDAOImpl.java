package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.PaymentVO;



public class PaymentDAOImpl implements PaymentDAO{

	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	
	@Override
	public List<PaymentVO> selectPStudentList(String parentId) throws SQLException {
		List<PaymentVO> list = session.selectList("Payment-Mapper.selectPStudent", parentId);
		return list;
	}


	@Override
	public List<PaymentVO> selectPayment(PaymentVO payment) throws SQLException {
		List<PaymentVO> list = session.selectList("Payment-Mapper.selectPayment", payment);
		return list;
	}

	@Override
	public List<PaymentVO> selectPaymentList(PaymentVO payment) throws SQLException {
		List<PaymentVO> list = session.selectList("Payment-Mapper.selectPaymentList", payment);
		return list;
	}


	@Override
	public int insertPayment(PaymentVO payment) throws SQLException {
		int result =  session.insert("Payment-Mapper.insertPayment", payment);
		return result;
	}
	











	
}
