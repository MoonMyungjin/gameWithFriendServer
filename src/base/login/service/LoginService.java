package base.login.service;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository("LoginService")
public interface LoginService {
	// 아이디 존재 여부 확인
	public HashMap<String, String> checkLoginUserInfo (HashMap<String, String> commandMap) throws Exception;
	
}
