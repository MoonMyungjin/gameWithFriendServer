package gameMatching.scheduler;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import gameMatching.cassandra.CassandraMapper;
import gameMatching.controller.GameMatchingController;
import gameMatching.dao.GameMatchingDAO;
import gameMatching.service.GameMatchingService;
import gameMatching.service.GameMatchingServiceImpl;
import gameMatching.vo.GameVO;
import gameMatching.vo.UserGameInfoVO;





@EnableScheduling
@Component
public class Scheduler  {
	
	UserGameInfoVO userGameInfo = new UserGameInfoVO();
	GameVO game = new GameVO();
	
	@Resource(name="gameMatchingService")
	public GameMatchingService gameMatchingService;
	
	@Resource(name="gameMatchingDAO")
	public GameMatchingDAO gameMatchingDAO;
	
	@Scheduled(cron = "0 14 22 * * *")
	public void inserUserGameInfoScheduler() throws Exception {
		List<GameVO> selectSummonerlist = gameMatchingService.selectSummonerlist();
		gameMatchingService.findSummonerData(selectSummonerlist);
	}
}
