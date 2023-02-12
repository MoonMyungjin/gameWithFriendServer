package com.lms.hexa.service;

import com.lms.hexa.dto.UserVO;
import com.lms.hexa.exception.IdNotFoundException;
import com.lms.hexa.exception.InvalidPasswordException;

public class LoginUserServiceImpl extends UserServiceImpl implements LoginUserService{

	@Override
	public void login(String id, String pw) throws IdNotFoundException, InvalidPasswordException, Exception {
		
		UserVO user = userDAO.selectUserById(id);

		if (user == null)
			throw new IdNotFoundException();
		if (!pw.equals(user.getPw()))
			throw new InvalidPasswordException();
		
	}

}
