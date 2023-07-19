package base.login.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import base.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> checkLoginUserInfo(HashMap<String, Object> commandMap) throws Exception {
		Map<String, Object> returnMap = loginDAO.selectUserInfo(commandMap); 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if (StringUtils.isEmpty((String) returnMap.get("uIntgId"))) {
			// 신규 아이디를 insert 해주는로직을 넣자
			paramMap.putAll(commandMap);
			paramMap.put("uStateCd", "10601");
			paramMap.put("uTypeCd", "10703");
			
			int cnt = loginDAO.insertUserInfo(paramMap);
			System.out.println("------------------------------------------!!" + cnt);
			if (cnt < 1) {
				returnMap.put("errorMsg", "fail");
			} else {
				returnMap = loginDAO.selectUserInfo(paramMap);
			}
			
		} else {
			// 로그인으로 확인되면 정보 수정하고 return	
			int cnt = loginDAO.updateUserLoginInfo(commandMap);
			
			if (cnt != 1) {
				returnMap.put("errorMsg", "fail");
			} else {
				returnMap = loginDAO.selectUserInfo(paramMap);
			}
			returnMap = loginDAO.selectUserInfo(commandMap);			
		}
		
		return returnMap;
	}

	@Override
	public Map<String, Object> selectUserInfo(HashMap<String, Object> commandMap) throws Exception {
		Map<String, Object> returnMap = loginDAO.selectUserInfo(commandMap);
		
		return returnMap;
	}

	@Override
	public int saveUserNickName(HashMap<String, Object> commandMap) throws Exception {
		int cnt = loginDAO.updateUserNickName(commandMap);
		
		return cnt;
	}

	@Override
	public int updateUserDelete(String myId) throws Exception {
		int cnt = loginDAO.updateUserDelete(myId);
		
		return cnt;
	}
	
}
