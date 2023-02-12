package com.lms.hexa.service;

import java.sql.SQLException;

import java.util.List;

import com.lms.hexa.dao.PaymentDAO;
import com.lms.hexa.dto.PaymentVO;


public class PaymentServiceImpl implements PaymentService {

	private PaymentDAO paymentDAO;
	

	
	public void setPaymentDAO(PaymentDAO paymentDAO) {
		this.paymentDAO = paymentDAO;
	}

	  
	@Override
	public List<PaymentVO> getPStudentList(String parentId) {
		List<PaymentVO> pStudentList = null;
		try {
			pStudentList = paymentDAO.selectPStudentList(parentId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pStudentList;
	}





	@Override
	public List<PaymentVO> getPayment(PaymentVO payment) {
		List<PaymentVO> paymentList = null;
		
		try {
			paymentList = paymentDAO.selectPayment(payment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return paymentList;
		
		
		
		
	}
	
	@Override
	public List<PaymentVO> getPaymentList(PaymentVO payment) {
		List<PaymentVO> paymentList2 = null;
		
		try {
			paymentList2 = paymentDAO.selectPaymentList(payment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return paymentList2;
		
		
		
		
	}


	@Override
	public int regist(PaymentVO payment) throws SQLException {
		
		
		int result = paymentDAO.insertPayment(payment);
		return result;
	}





	

}
