package com.lms.hexa.service;

import com.lms.hexa.dto.AttachVO;

public interface AttachService {
	
	// 첨부파일 상세가져오기
	AttachVO getAttachByAttachInfo(AttachVO attachVO);
	
	// 첨부파일 정보 삭제
	void removeAttachByAttachAttachInfo(AttachVO attachVO);
	
}
