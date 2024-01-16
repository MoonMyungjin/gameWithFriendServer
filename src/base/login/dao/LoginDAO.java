package base.login.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import util.CustomMap;

@Repository("loginDAO")
public class LoginDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public Map<String, Object> selectUserInfo(HashMap<String,Object> commandMap) throws Exception {
		Map<String, Object> returnMap = session.selectOne("base.login.mapper.selectUserInfo", commandMap);
		
		if (returnMap == null) {
			returnMap = new CustomMap();
		}
		
		return returnMap;
	}
	
	public int insertUserInfo(HashMap<String,Object> commandMap) throws Exception {
		int cnt = session.insert("base.login.mapper.insertUserInfo", commandMap);
		
		return cnt;
	}
	
	public int updateUserLoginInfo(HashMap<String,Object> commandMap) throws Exception {
		int cnt = session.update("base.login.mapper.updateUserLoginInfo", commandMap);
		
		return cnt;
	}
	
	public int updateUserNickName(HashMap<String,Object> commandMap) throws Exception {
		int cnt = session.update("base.login.mapper.updateUserNickName", commandMap);
		
		return cnt;
	}
	
	public int updateUserDelete(String myId) throws Exception {
		int cnt = session.update("base.login.mapper.updateUserDelete", myId);
		
		return cnt;
	}
	
	public int insertGameLolInfo(HashMap<String,Object> commandMap) throws Exception {
		int cnt = session.insert("base.login.mapper.insertGameLolInfo", commandMap);
		
		return cnt;
	}
}
