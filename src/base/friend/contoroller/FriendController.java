package base.friend.contoroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public void friendAdd(HttpServletRequest request,HttpMethod httpMethod,@RequestBody HashMap<String, Object> friendInfo) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		System.out.println(friendInfo);
		
		FriendVO friendVO = new FriendVO();
		friendService.friendAddSend(friendVO);
		friendService.friendAddReceive(friendVO);

	}
	

}
