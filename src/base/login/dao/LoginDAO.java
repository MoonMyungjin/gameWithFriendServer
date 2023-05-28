package base.login.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public HashMap<String,String> selectUserInfo(HashMap<?,?> commandMap) throws Exception {
		HashMap<String,String> returnMap = session.selectOne("login.mapper.selectUserInfo", commandMap);
		
		return returnMap;
	}
	
}
