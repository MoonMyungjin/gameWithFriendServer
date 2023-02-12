package com.lms.hexa.service;

import com.lms.hexa.exception.IdNotFoundException;
import com.lms.hexa.exception.InvalidPasswordException;

public interface LoginUserService extends UserService {
	
	void login(String id, String pw) throws IdNotFoundException, InvalidPasswordException, Exception;
}
