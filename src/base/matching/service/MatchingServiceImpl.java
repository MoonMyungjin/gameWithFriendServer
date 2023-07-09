package base.matching.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import base.matching.dao.MatchingDAO;
import base.matching.vo.MatchingHistoryVO;
import gameMatching.vo.GameVO;

@Service("MatchingService")
public class MatchingServiceImpl implements MatchingService {
	
	@Resource(name="MatchingDAO")
	protected MatchingDAO matchingDAO;
	
	@Override
	public List<MatchingHistoryVO> getHistoryList(String myID, String selectType, String baseDate) throws SQLException {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("myID", myID);
		paramMap.put("selectType", selectType);
		paramMap.put("baseDate", baseDate);
		
		return matchingDAO.selectHistoryList(paramMap);
	}
	
	@Override
	public String getLatestDate(String myID) throws SQLException {
		return matchingDAO.selectLatestDate(myID);
	}

	@Override
	public String getPreviousLaterDate(String myID, String baseDate) throws SQLException {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("myID", myID);
		paramMap.put("baseDate", baseDate);
		
		return matchingDAO.selectPreviousLaterDate(paramMap);
	}

	@Override
	public List<MatchingHistoryVO> selectExceptList(MatchingHistoryVO vo) throws SQLException {
		
		return matchingDAO.selectExceptList(vo);
	}
	
	
	@Override
	public void insertMatchingHistory(List<GameVO> gamematchingHistoryList) throws SQLException,
			ParseException, UnsupportedEncodingException, FileNotFoundException, IOException, InterruptedException {
		matchingDAO.insertMatchingHistory(gamematchingHistoryList);
		
	}

}
