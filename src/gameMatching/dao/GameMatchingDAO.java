package gameMatching.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gameMatching.vo.GameVO;


@Repository("gameMatchingDAO")
public class GameMatchingDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public List<GameVO> selectChampion() throws SQLException {
		return session.selectList("gameMatching.mapper.selectChampion");
	}
	
	public List<GameVO> selectSummonerlist() throws SQLException {
		return session.selectList("gameMatching.mapper.selectSummonerlist");
	}
	
	public List<String> selectMostChampionlist(List<String> list) throws SQLException {
		return session.selectList("gameMatching.mapper.selectMostChampionlist",list);
	}
	
	public void updateUserGameInfo(List<GameVO> list) throws SQLException {
		session.update("gameMatching.mapper.updateUserGameInfo", list);
	}


}
