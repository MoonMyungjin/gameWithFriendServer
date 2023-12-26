package base.main.contoroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import base.admin.vo.UserVO;
import base.alram.service.AlramService;
import base.alram.vo.AlramVO;
import base.main.service.MainService;
import base.main.vo.MainVO;
import common.service.CodeService;
import common.vo.CodeVO;
import util.Error;
import util.HduoResponse;


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
		
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value = "/main/selectMatchingOptionList.do", method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HduoResponse<List<CodeVO>> selectMatchingOption(HttpServletRequest request,HttpMethod httpMethod,@RequestParam(required = true) String option) throws Exception{
		CodeVO codeVO = new CodeVO();
		codeVO.setCdDtlParentId(option);
		List<CodeVO> selectMatchingOptionList = codeService.selectOptionList(codeVO);
		HduoResponse<List<CodeVO>> buildWith = HduoResponse.create().succeed().buildWith(selectMatchingOptionList);
		return buildWith;
	}
	
	
	@RequestMapping(value = "/privatePolicy", method = RequestMethod.GET)
	public String privatePolicy() throws Exception{
		

		
		return "admin/privatePolicy";
	}
	
	


}
