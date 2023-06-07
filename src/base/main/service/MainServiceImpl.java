package base.main.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.dao.AdminDAO;
import base.admin.option.dao.OptionDAO;
import base.admin.vo.UserVO;
import base.alram.dao.AlramDAO;
import base.alram.vo.AlramVO;
import base.friend.dao.FriendDAO;
import base.friend.vo.FriendVO;
import base.main.dao.MainDAO;
import base.main.vo.MainVO;

@Service("MainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name="MainDAO")
	protected MainDAO mainDAO;
	
	@Resource(name="AlramDAO")
	protected AlramDAO alramDAO;
	

	

	@Override
	public List<MainVO> selectLikeTop5List() throws SQLException {
		List<MainVO> selectLikeTop5List = mainDAO.selectLikeTop5List();
		return selectLikeTop5List;
	}

	@Override
	public String fintTargetLike(MainVO mainVO) throws SQLException {
		String msg = "";
		if(mainDAO.selectLikeUser(mainVO) == null) {
			msg= "N";
		}else {
			msg=mainDAO.selectLikeUser(mainVO);
		}

		return msg;
	}

	@Override
	public void likeTarget(MainVO mainVO) throws SQLException {
		 mainDAO.likeTarget(mainVO);
		 String msg = "";
		 if(mainDAO.selectLikeUser(mainVO) == null) {
			msg= "N";
		 }else {
			msg=mainDAO.selectLikeUser(mainVO);
		 }
		 if(msg.equals("Y")) {
			 AlramVO alramVO = new AlramVO();
			 alramVO.setMyId(mainVO.getMyId());
			 alramVO.setTargetId(mainVO.getTargetId());
			 alramVO.setAlCodeId("10802");
			 alramDAO.sendLikeAlram(alramVO);
			 
		 }
	}
	
	
	

	

}
