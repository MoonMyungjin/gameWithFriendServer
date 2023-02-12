package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.UserVO;

public interface UserDAO {
	
	UserVO selectUserById(String id) throws Exception;
	
	public void insertUser(UserVO user) throws SQLException;
	
	int selectUserByEmailAddress(String emailAddress) throws Exception;
	
	String selectUserCategory(String emailAddress) throws Exception;
	
	// 비밀번호 초기화
	public void updatePwd(String emailAddress) throws SQLException;
	
	// 비밀번호 수정
	public void modifyPwd(UserVO user) throws SQLException;
	
	// userList
	List<UserVO> selectUserList(Criteria cri) throws Exception;
	
	public int selectUserListTotalCount(Criteria cri) throws Exception;
	
}
