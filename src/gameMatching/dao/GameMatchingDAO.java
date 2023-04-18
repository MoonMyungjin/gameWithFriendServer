package gameMatching.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

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

}
