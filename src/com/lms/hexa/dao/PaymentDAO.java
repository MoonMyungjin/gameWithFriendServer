package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.PaymentVO;



public interface PaymentDAO {

	

	// list
	List<PaymentVO> selectPStudentList(String parentId) throws SQLException;

	List<PaymentVO> selectPayment(PaymentVO payment) throws SQLException;
	
	List<PaymentVO> selectPaymentList(PaymentVO payment) throws SQLException;
	
	
	
	int insertPayment(PaymentVO payment) throws SQLException;
	

	

}
