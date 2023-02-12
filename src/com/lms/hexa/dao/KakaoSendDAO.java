package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.KakaoSendVO;

public interface KakaoSendDAO {

	public int insertKakaoSendList(HashMap<String, Object> params) throws Exception;
	
	public List<KakaoSendVO> selectKakaoSendList(Criteria cri) throws Exception;
	
	public int selectKakaoSendListTotalCount(Criteria cri) throws SQLException;
	
}
