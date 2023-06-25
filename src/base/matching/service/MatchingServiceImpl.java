package base.matching.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.friend.dao.FriendDAO;
import base.friend.service.FriendService;
import base.matching.dao.MatchingDAO;
import base.matching.vo.MatchingHistoryVO;

@Service("MatchingService")
public class MatchingServiceImpl implements MatchingService {
	
	@Resource(name="MatchingDAO")
	protected MatchingDAO matchingDAO;
	
	@Override
	public List<MatchingHistoryVO> historyList(String myID) throws SQLException {
		return matchingDAO.selectHistoryList(myID);
	}

}
