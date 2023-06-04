package base.alram.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.dao.AdminDAO;
import base.admin.vo.UserVO;
import base.alram.dao.AlramDAO;
import base.alram.vo.AlramVO;
import base.friend.dao.FriendDAO;
import base.friend.vo.FriendVO;
import base.main.dao.MainDAO;
import base.main.vo.MainVO;

@Service("AlramService")
public class AlramServiceImpl implements AlramService {
	
	@Resource(name="AlramDAO")
	protected AlramDAO alramDAO;

	@Override
	public List<AlramVO> findMyAlramList(AlramVO alramVO) throws SQLException {
		return alramDAO.findMyAlramList(alramVO);
	}


	

}
