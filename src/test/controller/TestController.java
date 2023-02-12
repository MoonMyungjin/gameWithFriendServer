package test.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.hexa.dto.UserVO;


@Controller
public class TestController {
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping("/common/test")
	public ResponseEntity<Map<String,Object>> test(@RequestParam(required = true) String id,
			@RequestParam(required = true) String pw,HttpServletRequest req
			,HttpMethod httpMethod) throws Exception{
		UserVO userVO = new UserVO();
		userVO.setId(id);
		userVO.setPw(pw);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("userInfo", userVO);
		
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
}
