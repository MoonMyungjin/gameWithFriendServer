package test.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import test.vo.UserVO;

@Repository("testDAO")
public class TestDAOImpl implements TestDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;

	@Override
	public List<UserVO> selectTest() throws SQLException {
		return session.selectList("test.dao.selectTest");
	}

}
