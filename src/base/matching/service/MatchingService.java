package base.matching.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import base.matching.vo.MatchingHistoryVO;

@Repository("MatchingService")
public interface MatchingService {
	
	List<MatchingHistoryVO> getHistoryList(String myID, String selectType, String baseDate) throws SQLException;
	
	String getLatestDate(String myID) throws SQLException;
	
	String getPreviousLaterDate(String myID, String baseDate) throws SQLException;
	
}
