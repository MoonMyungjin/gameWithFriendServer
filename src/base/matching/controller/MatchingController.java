package base.matching.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import base.alram.vo.AlramVO;
import base.friend.service.FriendService;
import base.friend.vo.FriendVO;
import base.matching.service.MatchingService;
import base.matching.vo.MatchingHistoryVO;

@Controller
public class MatchingController {
	
	@Resource(name="MatchingService")
	private MatchingService matchingService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/matching/historyList.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> findFriendList (@RequestParam(required = true) String myID, HttpServletRequest req, HttpMethod httpMethod) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		//List<FriendVO> friendList = friendService.friendList(myNick);
		//int friendNum = friendService.friendNum(myNick);
		
//		List<Map<String,String>> historyList = new ArrayList<>();
//		
//		Map<String, String> first = new HashMap<>();
//		first.put("M_MATCHING_ID", "1");
//		first.put("M_MY_ID","jonghwi");
//		first.put("M_USER_ID","TEST1");
//		first.put("M_MATCHING_DATE","2023-06-23");
//		first.put("M_GAME_TYPE","100");
//		first.put("M_MATCHING_SCORE","90");
//		
//		Map<String, String> second = new HashMap<>();
//		second.put("MATCHING_ID", "1");
//		second.put("M_MY_ID","jonghwi");
//		second.put("M_USER_ID","TEST1");
//		second.put("M_MATCHING_DATE","2023-06-23");
//		second.put("M_GAME_TYPE","100");
//		second.put("M_MATCHING_SCORE","90");
//		
//		historyList.add(first);
//		historyList.add(second);
		
		List<MatchingHistoryVO> historyList = matchingService.historyList(myID);
		resultMap.put("historyList", historyList);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
		
		return entity;
	}
}
