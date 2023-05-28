package base.login.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public HashMap<String,String> selectUserInfo(HashMap<String,String> commandMap) throws Exception {
		HashMap<String,String> returnMap = session.selectOne("base.login.mapper.selectUserInfo", commandMap);
		
		return returnMap;
	}
	
	public void insertUserInfo(HashMap<String,String> commandMap) throws Exception {}
	
	public int updateUserLoginInfo(HashMap<String,String> commandMap) throws Exception {
		int cnt = session.update("base.login.mapper.updateUserLoginInfo", commandMap);
				
		return cnt;
	}
	
}
