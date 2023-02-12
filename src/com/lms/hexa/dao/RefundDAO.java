package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.RefundVO;





public interface RefundDAO {

	


	
	List<RefundVO> selectRefundtList() throws SQLException;

	void refund(RefundVO refundVO);


	

}
