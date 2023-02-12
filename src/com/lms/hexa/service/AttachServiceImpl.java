package com.lms.hexa.service;

import com.lms.hexa.dao.AttachDAO;
import com.lms.hexa.dto.AttachVO;

public class AttachServiceImpl implements AttachService {

	private AttachDAO attachDAO;
	
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public AttachVO getAttachByAttachInfo(AttachVO attachVO) {
		AttachVO attach = attachDAO.selectAttachByAttachAttachInfo(attachVO);
		return attach;
	}

	@Override
	public void removeAttachByAttachAttachInfo(AttachVO attachVO) {
		attachDAO.deleteAttach(attachVO);
	}

}
