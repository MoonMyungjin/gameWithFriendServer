package base.friend.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.friend.vo.FriendVO;

@Repository("FriendDAO")
public class FriendDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public void friendAddSend(FriendVO friendVO) throws SQLException {
		session.update("base.friend.mapper.friendAddSend",friendVO);
	}
	
	public void friendAddReceive(FriendVO friendVO) throws SQLException {
		session.update("base.friend.mapper.friendAddReceive",friendVO);
	}
	
	public List<FriendVO> selectFriendList(FriendVO friendVO) throws SQLException {
		return session.selectList("base.friend.mapper.selectFriendList", friendVO);
	}

}
