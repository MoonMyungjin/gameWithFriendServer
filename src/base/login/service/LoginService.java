package base.login.service;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import util.CustomMap;

@Repository("LoginService")
public interface LoginService {
	// 아이디 존재 여부 확인
	public CustomMap checkLoginUserInfo (HashMap<String, Object> commandMap) throws Exception;
	
}
