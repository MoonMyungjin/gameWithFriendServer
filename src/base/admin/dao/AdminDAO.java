package base.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;

@Repository("AdminDAO")
public class AdminDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public List<UserVO> getUserList(Map<String, Object> params) throws SQLException {
		return session.selectList("base.admin.mapper.getUserList",params);
	}
	
	public UserVO getUserInfo(String myNick) throws SQLException {
		return session.selectOne("base.admin.mapper.getUserInfo", myNick);
	}

	public void userUpdate(Map<String, Object> params) {
		session.update("base.admin.mapper.userUpdate", params);
	}

}
