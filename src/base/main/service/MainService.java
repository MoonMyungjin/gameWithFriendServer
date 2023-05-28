package base.main.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.friend.vo.FriendVO;
import base.main.vo.MainVO;
import gameMatching.vo.GameVO;

@Repository("MainService")
public interface MainService {
	
	List<MainVO> selectLikeTop5List() throws SQLException;
	
	String fintTargetLike(MainVO mainVO) throws SQLException;
	
	void likeTarget(MainVO mainVO) throws SQLException;
}
