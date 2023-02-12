package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.UnPaymentVO;





public interface UnPaymentDAO {

	


	
	List<UnPaymentVO> selectUnPaymentList(UnPaymentVO unPayment) throws SQLException;


	

}
