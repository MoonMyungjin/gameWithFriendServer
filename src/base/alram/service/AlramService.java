package base.alram.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.alram.vo.AlramVO;
import base.friend.vo.FriendVO;
import base.main.vo.MainVO;
import gameMatching.vo.GameVO;

@Repository("AlramService")
public interface AlramService {
	
	List<AlramVO> findMyAlramList(AlramVO alramVO) throws SQLException;
	
	void sendAlram(AlramVO alramVO) throws SQLException;
	
	void alramDelete(AlramVO alramVO) throws SQLException;
}
