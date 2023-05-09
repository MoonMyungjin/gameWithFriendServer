package gameMatching.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

import gameMatching.vo.GameVO;

@Repository("GameMatchingService")
public interface GameMatchingService {

	List<GameVO> selectChampion() throws SQLException;
	
	List<GameVO> selectSummonerlist() throws SQLException;
	
	void findSummonerData(List<GameVO> summonerList) throws SQLException, ParseException, UnsupportedEncodingException, FileNotFoundException, IOException, InterruptedException;

	List<GameVO> selectGameMatchingUserTop3 () throws SQLException;
}
