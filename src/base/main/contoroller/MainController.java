package base.main.contoroller;

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
import base.main.service.MainService;
import base.main.vo.MainVO;


@Controller
public class MainController {
	
	@Resource(name="MainService")
	private MainService mainService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/main/fameTop5.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> fameTop5List(HttpServletRequest request,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<MainVO> selectLikeTop5List = mainService.selectLikeTop5List();
		dataMap.put("selectLikeTop5List", selectLikeTop5List);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/main/findTargetLike.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> findTargetLike(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String myId,@RequestParam(required = true) String targetId) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		MainVO mainVO = new MainVO();
		mainVO.setMyId(myId);
		mainVO.setYlYouId(targetId);
		String msg = mainService.fintTargetLike(mainVO);
		dataMap.put("msg", msg);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/main/likeTarget.do", method = RequestMethod.GET)
	public void likeTarget(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String myNick,@RequestParam(required = true) String yourNick) throws Exception{
		MainVO mainVO = new MainVO();
		mainVO.setTargetId(yourNick);
		mainVO.setMyId(myNick);
		mainService.likeTarget(mainVO);

	}
	


}
