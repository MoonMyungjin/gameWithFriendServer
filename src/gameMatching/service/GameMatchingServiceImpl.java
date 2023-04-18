package gameMatching.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import gameMatching.dao.GameMatchingDAO;
import gameMatching.vo.GameVO;

@Service("gameMatchingService")
public class GameMatchingServiceImpl implements GameMatchingService {
	
	@Resource(name="gameMatchingDAO")
	protected GameMatchingDAO gameMatchingDAO;
	
	@Override
	public List<GameVO> selectChampion() throws SQLException {
		return gameMatchingDAO.selectChampion();
	}

}
