package base.matching.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

import base.matching.vo.MatchingHistoryVO;
import gameMatching.vo.GameVO;

@Repository("MatchingService")
public interface MatchingService {
	
	List<MatchingHistoryVO> getHistoryList(String myID, String selectType, String baseDate) throws SQLException;
	
	String getLatestDate(String myID) throws SQLException;
	
	String getPreviousLaterDate(String myID, String baseDate) throws SQLException;
	
	List<MatchingHistoryVO> selectExceptList(MatchingHistoryVO vo) throws SQLException;
	
	void insertMatchingHistory(List<GameVO> gamematchingHistoryList) throws SQLException, ParseException, UnsupportedEncodingException, FileNotFoundException, IOException, InterruptedException;
	
}
