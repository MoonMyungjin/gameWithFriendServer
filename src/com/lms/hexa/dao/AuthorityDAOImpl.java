package com.lms.hexa.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.AuthorityVO;

public class AuthorityDAOImpl implements AuthorityDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<AuthorityVO> selectAuthorityById(String id) throws Exception {
		List<AuthorityVO> authorityList = session.selectList("Authority-Mapper.selectAuthorityById",id);
		return authorityList;
	}

	@Override
	public int insertAuthority(HashMap<String, Object> params) {
		int result = session.insert("Authority-Mapper.insertAuthority",params);
		return result;
	}

	@Override
	public void deleteOldAuthority(HashMap<String, Object> params) throws Exception {
		session.delete("Authority-Mapper.deleteOldAuthority", params);
	}

	@Override
	public int selectAuthorityCountById(String userId) {
		int result = session.selectOne("Authority-Mapper.checkCountAuthority",userId);
		return result;
	}

}
