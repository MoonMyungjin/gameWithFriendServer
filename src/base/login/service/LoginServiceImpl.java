package base.login.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public HashMap<String, String> selectUserInfo(HashMap<?, ?> commandMap) throws Exception {
		HashMap<String, String> returnMap = new HashMap<String, String>();
		
		returnMap = loginDAO.selectUserInfo(commandMap);
		
		if (returnMap.size() <= 0) {
			// 신규 아이디를 insert 해주는로직을 넣자
			
		}
		
		
		return returnMap;
	}
	
}
