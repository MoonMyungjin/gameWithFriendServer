package gameMatching.controller;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.http.client.HttpClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;

import gameMatching.cassandra.CassandraConnector;
import gameMatching.cassandra.CassandraMapper;
import gameMatching.service.GameMatchingService;
import gameMatching.vo.GameVO;
import gameMatching.vo.UserGameInfoVO;
import test.service.TestService;
import test.vo.UserVO;

@Controller
public class GameMatchingController {
	CassandraMapper cassandra = new CassandraMapper();
	
	UserGameInfoVO userGameInfo = new UserGameInfoVO();
	GameVO game = new GameVO();
	
	@Resource(name="gameMatchingService")
	private GameMatchingService gameMatchingService;
	
	@CrossOrigin("http://localhost:3000")	
	@RequestMapping("/gameMatching/pullRiotApi")	
	public UserGameInfoVO pullRiotApi() throws Exception {
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/다이아도전기?api_key=RGAPI-eeb5f35c-2a16-44cb-9da3-ccab12cb6ab6";
		String jsonString = restTemplate.getForObject(url, String.class);
		System.out.println(jsonString);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
		System.out.println(jsonObject);
		// 가장 큰 JSON 객체 response 가져오기
		JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
		System.out.println(jsonResponse);

		Object object = jsonObject.get("name");
		Object object2 = jsonObject.get("summonerLevel");
		
		String lolname = String.valueOf(object);
		String lolLevel = String.valueOf(object2);
		
		System.out.println(lolname);
		System.out.println(lolLevel);
		
		userGameInfo.setLolId(lolname);
		userGameInfo.setLolLevel(lolLevel);
		
		return userGameInfo;
		
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping("/gameMatching/pushRiotApi")
	public ResponseEntity<Map<String,Object>> pushRiotApi(@RequestParam(required = true) String id,
			HttpServletRequest req
		,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		userGameInfo.setUserId(id);
		UserGameInfoVO selectUserGameInfo = cassandra.selectUserGameInfo(userGameInfo);
		dataMap.put("userInfo", selectUserGameInfo);
		
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping("/gameMatching/selectChampion")
	public ResponseEntity<Map<String,Object>> selectChampion(
		HttpServletRequest req,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<GameVO> gameVO = gameMatchingService.selectChampion();
		dataMap.put("gameVO", gameVO);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	
}