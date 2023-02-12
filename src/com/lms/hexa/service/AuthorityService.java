package com.lms.hexa.service;

import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.AuthorityVO;

public interface AuthorityService {
	
	public List<AuthorityVO> getAuthorityListById(String id) throws Exception;
	
	public int registAuthority(HashMap<String, Object> params) throws Exception;

	public int getAuthorityCountById(String userId);
	
}
