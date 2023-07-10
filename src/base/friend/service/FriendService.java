package base.friend.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.alram.vo.AlramVO;
import base.friend.vo.FriendVO;

@Repository("FriendService")
public interface FriendService {
	
	void friendAddSend(FriendVO friendVO) throws SQLException;
	
	void friendAddReceive(FriendVO friendVO) throws SQLException;
	
	List<FriendVO> friendList(String myNick) throws SQLException;
	
	int friendNum(String myNick) throws SQLException;
	
	FriendVO selectUserFriendState(FriendVO friendVO) throws SQLException;
	
	void addFriendAccept(FriendVO friendVO) throws SQLException;
	
	void addFriendAcceptYou(FriendVO friendVO) throws SQLException;
}
