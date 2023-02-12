package com.lms.hexa.service;


import java.util.List;

import com.lms.hexa.dto.RefundVO;




public interface RefundService {
	


	
	 List<RefundVO> getRefundList();

	void refund(RefundVO refundVO);
	 


	 

}
