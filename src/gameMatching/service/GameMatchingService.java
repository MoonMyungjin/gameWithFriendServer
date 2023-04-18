package gameMatching.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import gameMatching.vo.GameVO;

@Repository("GameMatchingService")
public interface GameMatchingService {

	List<GameVO> selectChampion() throws SQLException;

}
