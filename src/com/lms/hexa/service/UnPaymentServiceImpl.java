package com.lms.hexa.service;


import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dao.UnPaymentDAO;
import com.lms.hexa.dto.UnPaymentVO;


public class UnPaymentServiceImpl implements UnPaymentService {

	private UnPaymentDAO unPaymentDAO;
	
	public void setUnPaymentDAO(UnPaymentDAO unPaymentDAO) {
		this.unPaymentDAO = unPaymentDAO;
	}

	@Override
	public List<UnPaymentVO> getUnPaymentList(UnPaymentVO unPayment) {
		List<UnPaymentVO> paymentList = null;
		
		try {
			paymentList = unPaymentDAO.selectUnPaymentList(unPayment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return paymentList;
		
	}




	

}
