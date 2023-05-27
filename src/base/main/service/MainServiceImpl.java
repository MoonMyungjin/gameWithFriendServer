package base.main.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.dao.AdminDAO;
import base.admin.vo.UserVO;
import base.friend.dao.FriendDAO;
import base.friend.vo.FriendVO;
import base.main.dao.MainDAO;

@Service("MainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name="MainDAO")
	protected MainDAO mainDAO;

	@Override
	public List<UserVO> selectLikeTop5List() throws SQLException {
		List<UserVO> selectLikeTop5List = mainDAO.selectLikeTop5List();
		return selectLikeTop5List;
	}



}
