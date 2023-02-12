package test.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import test.vo.UserVO;

public class TestDAOImpl implements TestDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<UserVO> selectTest() throws SQLException {
		return session.selectList("test.dao.selectTest");
	}

}
