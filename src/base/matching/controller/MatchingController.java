package base.matching.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import base.matching.service.MatchingService;
import base.matching.vo.MatchingHistoryVO;

@Controller
public class MatchingController {
	
	@Resource(name="MatchingService")
	private MatchingService matchingService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/matching/historyList.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> findFriendList (@RequestParam(required = true) String myID,
			                                                  @RequestParam(required = true) String selectType,
			                                                  @RequestParam(required = false) String baseDate,
															  HttpServletRequest req,
															  HttpMethod httpMethod) throws Exception
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		
		// Matching History List
		List<MatchingHistoryVO> historyList = matchingService.getHistoryList(myID, selectType, baseDate);
		
		// Display Date
		String displayDate = "";
		if(historyList.size() > 0) displayDate = historyList.get(0).getmMatchingDate();
		
		// Previous & Later Date
		String previousLaterDate = "";
		if(!displayDate.equals("")) previousLaterDate = matchingService.getPreviousLaterDate(myID, displayDate);
		String[] arrPreLaterDate = null;
		if(!previousLaterDate.equals("")) arrPreLaterDate = previousLaterDate.split("@");
		
		resultMap.put("historyList", historyList);
		resultMap.put("displayDate", displayDate);
		resultMap.put("previousDate", arrPreLaterDate == null ? "" : arrPreLaterDate[0]);
		resultMap.put("LaterDate", arrPreLaterDate == null ? "" : arrPreLaterDate[1]);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
		
		return entity;
	}
}
