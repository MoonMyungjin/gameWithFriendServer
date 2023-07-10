package base.friend.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.dao.AdminDAO;
import base.admin.vo.UserVO;
import base.friend.dao.FriendDAO;
import base.friend.vo.FriendVO;

@Service("FriendService")
public class FriendServiceImpl implements FriendService {
	
	@Resource(name="FriendDAO")
	protected FriendDAO friendDAO;


	@Override
	public void friendAddSend(FriendVO friendVO) throws SQLException {
		friendDAO.friendAddSend(friendVO);
	}
	
	@Override
	public void friendAddReceive(FriendVO friendVO) throws SQLException {
		friendDAO.friendAddReceive(friendVO);
	}
	
	@Override
	public List<FriendVO> friendList(String myNick) throws SQLException {
		return friendDAO.selectFriendList(myNick);
	}

	@Override
	public int friendNum(String myNick) throws SQLException {
		return friendDAO.selectFriendNum(myNick);
	}
	
	@Override
	public FriendVO selectUserFriendState(FriendVO friendVO) throws SQLException {
		return friendDAO.selectUserFriendState(friendVO);
	}

	@Override
	public void addFriendAccept(FriendVO friendVO) throws SQLException {
		friendDAO.addFriendAccept(friendVO);
		
	}
	
	@Override
	public void addFriendAcceptYou(FriendVO friendVO) throws SQLException {
		friendDAO.addFriendAcceptYou(friendVO);
		
	}
	
	
	@Override
	public FriendVO friendCheck(FriendVO friendVO) throws SQLException {
		return friendDAO.friendCheck(friendVO);
		
	}


}
