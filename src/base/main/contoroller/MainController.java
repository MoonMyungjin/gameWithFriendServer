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
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import base.alram.service.AlramService;
import base.alram.vo.AlramVO;
import base.main.service.MainService;
import base.main.vo.MainVO;
import common.service.CodeService;
import common.vo.CodeVO;


@Controller
public class MainController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@Resource(name="AlramService")
	private AlramService alramService;
	
	@Resource(name="MainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main/fameTop5.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> fameTop5List(HttpServletRequest request,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<MainVO> selectLikeTop5List = mainService.selectLikeTop5List();
		dataMap.put("selectLikeTop5List", selectLikeTop5List);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/main/findTargetLike.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> findTargetLike(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String myId,@RequestParam(required = true) String targetId) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		MainVO mainVO = new MainVO();
		mainVO.setMyId(myId);
		mainVO.setTargetId(targetId);
		String msg="";
		msg = mainService.fintTargetLike(mainVO);
		System.out.println(msg);
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
		AlramVO alramVO = new AlramVO();
		alramVO.setAlMyId(yourNick);
		alramVO.setAlSendId(myNick);
		alramVO.setAlCodeId("10802");
		alramService.sendAlram(alramVO);
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/main/selectMatchingOptionList.do", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> selectMatchingOption(HttpServletRequest request,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		CodeVO codeVO = new CodeVO();
		codeVO.setCdDtlParentId("109");
		List<CodeVO> selectMatchingOptionList = codeService.selectOptionList(codeVO);
		dataMap.put("selectMatchingOptionList", selectMatchingOptionList);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	


}
