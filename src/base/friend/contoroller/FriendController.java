package base.friend.contoroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import base.admin.service.AdminService;
import base.admin.vo.UserVO;
import base.friend.service.FriendService;
import base.friend.vo.FriendVO;


@Controller
public class FriendController {
	
	@Resource(name="FriendService")
	private FriendService friendService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/friend/friendAdd.do", method = RequestMethod.GET)
	public void friendAdd(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String myNick,@RequestParam(required = true) String yourNick) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		FriendVO friendVO = new FriendVO();
		friendVO.setfMyId(myNick);
		friendVO.setfYouId(yourNick);
		friendService.friendAddSend(friendVO);
		friendService.friendAddReceive(friendVO);

	}
	
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/friend/findFriendList.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> findFriendList(@RequestParam(required = true) String myNick,HttpServletRequest req
			,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();		
		List<FriendVO> friendList = friendService.friendList(myNick);
		int friendNum = friendService.friendNum(myNick);
		dataMap.put("friendList", friendList);
		dataMap.put("friendNum", friendNum);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	

}
