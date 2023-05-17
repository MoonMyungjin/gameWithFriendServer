package base.friend.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;

@Repository("FriendDAO")
public class FriendDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public void friendAddSend() throws SQLException {
		session.update("base.friend.mapper.friendAddSend");
	}
	
	public void friendAddReceive() throws SQLException {
		session.update("base.friend.mapper.friendAddReceive");
	}

}
