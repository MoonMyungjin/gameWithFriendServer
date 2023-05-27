package base.main.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.friend.vo.FriendVO;

@Repository("MainDAO")
public class MainDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<UserVO> selectLikeTop5List() throws SQLException {
		return session.selectList("base.main.mapper.selectLikeTop5List");
	}
	
}
