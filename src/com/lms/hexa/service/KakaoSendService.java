package com.lms.hexa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.KakaoSendVO;

public interface KakaoSendService {
	
	public int registKakaoSendList(HashMap<String, Object> params) throws Exception;
	
	public Map<String, Object> getKakaoSendList(Criteria cri) throws Exception;
	
}
