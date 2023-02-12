package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.UserVO;

public interface UserService {
	
	public UserVO getUser(String id) throws Exception;
	
	public ManagerVO getManager(String id) throws Exception;
	
	public StudentVO getStudent(String id) throws Exception;
	
	public ParentVO getParent(String id) throws Exception;
	
	public void insertUser(UserVO user) throws SQLException;
	
	public int getUserByEmail(String emailAddress) throws Exception;

	public String getUserCategory(String emailAddress) throws Exception;
		
		// 비밀번호 초기화
		void updatePwd(String emailAddress) throws Exception;
		// 비밀번호 수정
		public void modifyPwd(UserVO user) throws SQLException;
	
	public Map<String, Object> getUserList(Criteria cri) throws Exception;	
}
