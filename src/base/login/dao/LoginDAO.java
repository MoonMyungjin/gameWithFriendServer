package base.login.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import util.CustomMap;

@Repository("loginDAO")
public class LoginDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public CustomMap selectUserInfo(HashMap<String,Object> commandMap) throws Exception {
		CustomMap returnMap = session.selectOne("base.login.mapper.selectUserInfo", commandMap);
		
		return returnMap;
	}
	
	public void insertUserInfo(HashMap<String,Object> commandMap) throws Exception {}
	
	public int updateUserLoginInfo(HashMap<String,Object> commandMap) throws Exception {
		int cnt = session.update("base.login.mapper.updateUserLoginInfo", commandMap);
				
		return cnt;
	}
	
}
