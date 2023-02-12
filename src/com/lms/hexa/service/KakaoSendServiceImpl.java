package com.lms.hexa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.KakaoSendDAO;
import com.lms.hexa.dto.KakaoSendVO;

public class KakaoSendServiceImpl implements KakaoSendService {
		
	private KakaoSendDAO kakaoSendDAO;

	public void setKakaoSendDAO(KakaoSendDAO kakaoSendDAO) {
		this.kakaoSendDAO = kakaoSendDAO;
	}

	@Override
	public int registKakaoSendList(HashMap<String, Object> params) throws Exception {
		int result = kakaoSendDAO.insertKakaoSendList(params);
		return result;
	}

	@Override
	public Map<String, Object> getKakaoSendList(Criteria cri) throws Exception {
		List<KakaoSendVO> kakaoSendList = kakaoSendDAO.selectKakaoSendList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(kakaoSendDAO.selectKakaoSendListTotalCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("kakaoSendList", kakaoSendList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
}
