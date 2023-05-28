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
import base.main.vo.MainVO;

@Service("MainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name="MainDAO")
	protected MainDAO mainDAO;

	@Override
	public List<MainVO> selectLikeTop5List() throws SQLException {
		List<MainVO> selectLikeTop5List = mainDAO.selectLikeTop5List();
		return selectLikeTop5List;
	}

	@Override
	public String fintTargetLike(MainVO mainVO) throws SQLException {
		String likeUserYn = mainDAO.selectLikeUser(mainVO);
		String msg = "";
		if(likeUserYn.equals("Y")) {
			msg = "Y";
		}else {
			msg = "N";
		}
		return msg;
	}

	@Override
	public void likeTarget(MainVO mainVO) throws SQLException {
		 mainDAO.likeTarget(mainVO);
	}

	

}
