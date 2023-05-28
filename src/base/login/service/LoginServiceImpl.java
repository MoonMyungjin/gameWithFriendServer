package base.login.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public HashMap<String, String> checkLoginUserInfo(HashMap<String, String> commandMap) throws Exception {
		HashMap<String, String> returnMap = new HashMap<String, String>();
		
		returnMap = loginDAO.selectUserInfo(commandMap);
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		if (returnMap == null) {
			// 신규 아이디를 insert 해주는로직을 넣자
			paramMap.putAll(commandMap);
			loginDAO.insertUserInfo(paramMap);
			
			returnMap = loginDAO.selectUserInfo(paramMap);
		} else {
			// 로그인으로 확인되면 정보 수정하고 return
			loginDAO.updateUserLoginInfo(commandMap);
			
			returnMap = loginDAO.selectUserInfo(commandMap);
		}
		
		return returnMap;
	}
	
}
