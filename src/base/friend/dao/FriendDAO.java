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
		return session.selectList("base.friend.mapper.selectFriendList",friendVO);
	}
	

	public int selectFriendNum(String myNick) throws SQLException {
		return session.selectOne("base.friend.mapper.selectFriendNum", myNick);
	}
	
	public FriendVO selectUserFriendState(FriendVO friendVO) throws SQLException {
		return session.selectOne("base.friend.mapper.selectUserFriendState",friendVO);
	}
	
	public void addFriendAccept(FriendVO friendVO) throws SQLException {
		session.update("base.friend.mapper.addFriendAccept",friendVO);
	}
	
	public void addFriendAcceptYou(FriendVO friendVO) throws SQLException {
		session.update("base.friend.mapper.addFriendAcceptYou",friendVO);
	}
	
	public FriendVO friendCheck(FriendVO friendVO) throws SQLException {
		return session.selectOne("base.friend.mapper.friendCheck",friendVO);
	}
}
