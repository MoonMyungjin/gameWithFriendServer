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
		// 사용자 통합id
		String uIntgId = (String) commandMap.get("uIntgId");
		// 유저 라이엇id
		String glSummoner = (String) commandMap.get("glSummoner");
		
		int cnt = 0;
		int cnt2 = 0;
		
		// 닉네임 저장
		if (StringUtils.isNotEmpty(uIntgId)) {
			cnt = loginDAO.updateUserNickName(commandMap);
		}
		
		// 라이엇 Id 저장
		if (StringUtils.isNotEmpty(glSummoner)) {
			cnt2 = loginDAO.insertGameLolInfo(commandMap);
		}
		
		return cnt + cnt2;
	}

	@Override
	public int updateUserDelete(String myId) throws Exception {
		int cnt = loginDAO.updateUserDelete(myId);
		
		return cnt;
	}
	
}
