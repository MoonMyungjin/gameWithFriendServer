package com.lms.hexa.service;

import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dao.AuthorityDAO;
import com.lms.hexa.dto.AuthorityVO;

public class AuthorityServiceImpl implements AuthorityService {
	
	private AuthorityDAO authorityDao;
	
	public void setAuthorityDAO(AuthorityDAO authorityDao) {
		this.authorityDao = authorityDao;
	}
	
	@Override
	public List<AuthorityVO> getAuthorityListById(String id) throws Exception {
		
		List<AuthorityVO> authorityList = authorityDao.selectAuthorityById(id);
		
		return authorityList;
	}

	@Override
	public int registAuthority(HashMap<String, Object> params) throws Exception {
		authorityDao.deleteOldAuthority(params);
		int result = authorityDao.insertAuthority(params);
		return result;
	}

	@Override
	public int getAuthorityCountById(String userId) {
		int result = authorityDao.selectAuthorityCountById(userId);
		return result;
	}
	
	
}
