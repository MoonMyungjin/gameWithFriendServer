package com.lms.hexa.service;


import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dao.RefundDAO;
import com.lms.hexa.dto.RefundVO;


public class RefundServiceImpl implements RefundService {

	private RefundDAO refundDAO;
	
	public void setRefundDAO(RefundDAO refundDAO) {
		this.refundDAO = refundDAO;
	}


	@Override
	public List<RefundVO> getRefundList() {
		List<RefundVO> refundList = null;
		
		try {
			refundList = refundDAO.selectRefundtList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return refundList;
	}


	@Override
	public void refund(RefundVO refundVO) {
		refundDAO.refund(refundVO);
	}




	

}
