package base.matching.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.matching.vo.MatchingHistoryVO;

@Repository("MatchingService")
public interface MatchingService {
	
	List<MatchingHistoryVO> historyList(String myID) throws SQLException;
	
}
