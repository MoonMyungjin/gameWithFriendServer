package base.login.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import base.login.dao.LoginDAO;
import util.CustomMap;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public CustomMap checkLoginUserInfo(HashMap<String, Object> commandMap) throws Exception {
		
		CustomMap returnMap = loginDAO.selectUserInfo(commandMap); 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		System.out.println("------------------------------------------" + returnMap.size());
		System.out.println("------------------------------------------" + (returnMap.size() == 1));
		if (StringUtils.isEmpty((String) returnMap.get("uIntgId"))) {
			// 신규 아이디를 insert 해주는로직을 넣자
			System.out.println("------------------------------------------isnert");
			paramMap.putAll(commandMap);
			loginDAO.insertUserInfo(paramMap);
			
			returnMap = loginDAO.selectUserInfo(paramMap);
		} else {
			// 로그인으로 확인되면 정보 수정하고 return
			System.out.println("------------------------------------------update");
			loginDAO.updateUserLoginInfo(commandMap);
			
			returnMap = loginDAO.selectUserInfo(commandMap);
		}
		
		return returnMap;
	}
	
}
