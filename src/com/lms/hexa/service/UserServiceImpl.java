package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.ManagerDAO;
import com.lms.hexa.dao.ParentDAO;
import com.lms.hexa.dao.StudentDAO;
import com.lms.hexa.dao.UserDAO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.UserVO;

public class UserServiceImpl implements UserService {
	
	protected UserDAO userDAO;
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	protected ManagerDAO managerDAO;
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	
	protected StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	protected ParentDAO parentDAO;
	public void setParentDAO(ParentDAO parentDAO) {
		this.parentDAO = parentDAO;
	}
	

	@Override
	public UserVO getUser(String id) throws Exception {
		
		UserVO user = userDAO.selectUserById(id);
		
		return user;

	}

	@Override
	public ManagerVO getManager(String id) throws Exception {
		
		ManagerVO manager = managerDAO.selectManagerById(id);
		
		return manager;
	}

	@Override
	public StudentVO getStudent(String id) throws Exception {
		
		StudentVO student = studentDAO.selectStudentById(id);
		
		return student;
	}
	
	@Override
	public ParentVO getParent(String id) throws Exception {
		System.out.println(id);
		ParentVO parent = parentDAO.selectParentById(id);
		
		return parent;
	}

	@Override
	public void insertUser(UserVO user) throws SQLException {
		userDAO.insertUser(user);
	}
	
	@Override
	public int getUserByEmail(String emailAddress) throws Exception {
		
		int user = userDAO.selectUserByEmailAddress(emailAddress);

		return user;
	}



	@Override
	public String getUserCategory(String emailAddress) throws Exception {
		String type = userDAO.selectUserCategory(emailAddress);
		return type;
	}



	@Override
	public void updatePwd(String emailAddress) throws Exception {
		userDAO.updatePwd(emailAddress);
		
	}

	@Override
	public void modifyPwd(UserVO user) throws SQLException {
		userDAO.modifyPwd(user);
	}


	@Override
	public Map<String, Object> getUserList(Criteria cri) throws Exception {
		List<UserVO> userList = userDAO.selectUserList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(userDAO.selectUserListTotalCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("userList",userList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}




	
}
