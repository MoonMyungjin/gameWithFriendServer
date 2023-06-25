package base.alram.contoroller;

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
import base.alram.service.AlramService;
import base.alram.vo.AlramVO;
import base.friend.service.FriendService;
import base.friend.vo.FriendVO;
import base.main.service.MainService;
import base.main.vo.MainVO;


@Controller
public class AlramController {
	
	@Resource(name="AlramService")
	private AlramService alramService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/alram/findMyAlramList.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> findMyAlramList(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String myId) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		AlramVO alramVO = new AlramVO();
		alramVO.setAlMyId(myId);
		List<AlramVO> findMyAlramList = alramService.findMyAlramList(alramVO);
		dataMap.put("findMyAlramList", findMyAlramList);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/alram/alramDelete.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> alramDelete(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String alSeq) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		AlramVO alramVO = new AlramVO();
		alramVO.setAlSeq(alSeq);
		alramService.alramDelete(alramVO);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	


}
