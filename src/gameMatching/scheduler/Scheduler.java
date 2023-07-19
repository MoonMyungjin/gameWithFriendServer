package gameMatching.scheduler;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import gameMatching.cassandra.CassandraMapper;
import gameMatching.controller.GameMatchingController;
import gameMatching.dao.GameMatchingDAO;
import gameMatching.service.GameMatchingService;
import gameMatching.service.GameMatchingServiceImpl;
import gameMatching.vo.GameVO;
import gameMatching.vo.UserGameInfoVO;



@Component("jobTask")
public class Scheduler  {
	
	@Resource(name="gameMatchingDAO")
	protected GameMatchingDAO gameMatchingDAO;
	
	@Scheduled(cron = "0 58 20 * * *")
	public void inserUserGameInfoScheduler() throws Exception {
		System.out.println("TEST");
		List<GameVO> selectSummonerlist = gameMatchingDAO.selectSummonerlist();
	}
}
