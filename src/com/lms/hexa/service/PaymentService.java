package com.lms.hexa.service;


import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.PaymentVO;




public interface PaymentService {
	

	
	 List<PaymentVO> getPStudentList(String parentId);
	 
	 List<PaymentVO> getPayment(PaymentVO payment);
	
	 List<PaymentVO> getPaymentList(PaymentVO payment);
	 
	 int regist(PaymentVO payment) throws SQLException;
	 

	 

	 

}
