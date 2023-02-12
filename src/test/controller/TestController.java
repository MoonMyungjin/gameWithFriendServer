package test.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import test.service.TestService;
import test.vo.UserVO;


@Controller
public class TestController {
	
	@Resource(name="testService")
	private TestService testService;
	
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping("/common/test")
	public ResponseEntity<Map<String,Object>> test(@RequestParam(required = true) String id,
			@RequestParam(required = true) String pw,HttpServletRequest req
			,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<UserVO> testMethod = testService.testMethod();
		dataMap.put("userInfo", testMethod);
		
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
}
