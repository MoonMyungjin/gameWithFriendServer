package gameMatching.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

import gameMatching.vo.GameVO;

@Repository("GameMatchingService")
public interface GameMatchingService {

	List<GameVO> selectChampion() throws SQLException;
	
	List<GameVO> selectSearchChampion(String keyWord) throws SQLException;
	
	List<GameVO> selectSummonerlist() throws SQLException;
	
	/* findSummonerData: 인증한 유저 리스트를 받아와 테이블에 Update 한다*/
	void findSummonerData(List<GameVO> summonerList) throws SQLException, ParseException, UnsupportedEncodingException, FileNotFoundException, IOException, InterruptedException;

	List<GameVO> selectGameMatchingUserTop3 (HashMap<String, Object> optionInfo, String myId) throws SQLException;
	
	List<GameVO> optionRankPointGet (int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iRankChoice) throws SQLException;
	
	List<GameVO> optionTimePointGet (int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iTimeChoice) throws SQLException;
	
	List<GameVO> optionPositionPointGet (int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iPositionChoice) throws SQLException;
	
	List<GameVO> optionChampionPointGet (int optionSelectNumber,int optionSelectNumberPoint,List<GameVO> selectUserList, String iChampionChoice) throws SQLException;
}
