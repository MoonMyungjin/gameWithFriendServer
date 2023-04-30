package base.admin.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;

@Repository("AdminDAO")
public class AdminDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public List<UserVO> getUserList() throws SQLException {
		return session.selectList("base.admin.mapper.getUserList");
	}

}
