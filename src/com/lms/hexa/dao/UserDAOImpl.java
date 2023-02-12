package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.UserVO;

public class UserDAOImpl implements UserDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public UserVO selectUserById(String id) throws Exception {
		UserVO user = session.selectOne("User-Mapper.selectUserById", id);
		return user;
	}

	@Override
	public void insertUser(UserVO user) throws SQLException {
		session.update("User-Mapper.insertUser",user);
	}

	
	@Override
	public int selectUserByEmailAddress(String emailAddress) throws Exception {
		int user = session.selectOne("User-Mapper.selectUserByEmailAddress", emailAddress);
		return user;
	}

	@Override
	public String selectUserCategory(String emailAddress) throws Exception {
		String type = session.selectOne("User-Mapper.selectUserCategory", emailAddress);
		return type;
	}

	@Override
	public void updatePwd(String emailAddress) throws SQLException {
		session.update("User-Mapper.updatePwd", emailAddress);
		
	}
	
	@Override
	public void modifyPwd(UserVO user) throws SQLException {
		session.update("User-Mapper.modifyPwd", user);
	}

	@Override
	public List<UserVO> selectUserList(Criteria cri) throws Exception {
		List<UserVO> user = session.selectList("User-Mapper.selectUserList",cri);
		return user;
	}

	@Override
	public int selectUserListTotalCount(Criteria cri) throws Exception {
		int count = session.selectOne("User-Mapper.selectUserListTotalCount",cri);
		return count;
	}
}
