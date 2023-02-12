package com.lms.hexa.dao;

import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.AuthorityVO;

public interface AuthorityDAO {
	
	 public List<AuthorityVO> selectAuthorityById(String id) throws Exception;
	 
	 public void deleteOldAuthority(HashMap<String, Object> params) throws Exception;
	 
	 public int insertAuthority(HashMap<String, Object> params) throws Exception;

	public int selectAuthorityCountById(String userId);
	 
	 
}
