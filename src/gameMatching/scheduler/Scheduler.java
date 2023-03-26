package gameMatching.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import gameMatching.cassandra.CassandraMapper;
import gameMatching.controller.GameMatchingController;
import gameMatching.vo.UserGameInfoVO;

@Component("jobTask")
public class Scheduler  {
	
	@Scheduled(cron = "0 47 14 * * *")
	public void inserUserGameInfoScheduler() throws Exception {
		CassandraMapper cassandra = new CassandraMapper();
		GameMatchingController gameMatchingController = new GameMatchingController();
		
		UserGameInfoVO userGameInfoVO = gameMatchingController.pullRiotApi();
		cassandra.apiDBInsert(userGameInfoVO);
	}
}
