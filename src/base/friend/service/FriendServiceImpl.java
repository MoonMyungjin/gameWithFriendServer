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
		friendDAO.friendAddSend();
	}
	
	@Override
	public void friendAddReceive(FriendVO friendVO) throws SQLException {
		friendDAO.friendAddSend();
	}

}
