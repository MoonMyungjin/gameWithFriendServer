package base.myPage.dao;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("MypageDAO")
public class MypageDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public Map<String, Object> selectUserInfo(String uIntgId) throws SQLException {
		return session.selectOne("base.myPage.mapper.selectUserInfo", uIntgId);
	}
}
