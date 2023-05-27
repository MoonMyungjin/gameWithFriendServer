package base.main.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.friend.vo.FriendVO;
import gameMatching.vo.GameVO;

@Repository("MainService")
public interface MainService {
	
	List<UserVO> selectLikeTop5List() throws SQLException;
}
