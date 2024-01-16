package base.login.contoroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import base.login.service.LoginService;
import util.Error;
import util.HduoResponse;

@RestController
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value="/login/loginCheck.do")
	public ModelAndView loginCheck(HttpServletRequest request, HttpMethod httpMethod, @RequestBody HashMap<String, Object> commandMap ) throws Exception{
		ModelAndView modelAndView = new ModelAndView("jsonView");

		Map<String, Object> returnMap = loginService.checkLoginUserInfo(commandMap);
		
		
		modelAndView.addObject("sessionInfo", returnMap);
		
		return modelAndView;
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value="/login/saveUserNickName.do", method=RequestMethod.POST)
	public HduoResponse<Map<String,Object>> saveUserNickName(HttpServletRequest request,@RequestBody HashMap<String, Object> commandMap ) throws Exception{
		// 결과를 return하는 Hduo 공통 Response
		HduoResponse<Map<String, Object>> buildWith = null;
		
		Map<String, Object> resultMap = null;
		String msg = null;
		Error error = null;
		
		try {
			int cnt = loginService.saveUserNickName(commandMap);
			
			if (cnt >= 1) {
				resultMap = loginService.selectUserInfo(commandMap);
			} else {
				throw new Exception("닉네임 저장 실패");
			}
			
			buildWith = HduoResponse.create().succeed().buildWith(resultMap);
		} catch (NullPointerException e) {
			msg = "가입된 계정이 없습니다.";
			error = new Error(HttpStatus.INTERNAL_SERVER_ERROR, msg);
			buildWith = HduoResponse.create().fail(error).buildWith(resultMap);
		}catch (Exception e) {
			msg = "에러가 발생했습니다.";
			error = new Error(HttpStatus.INTERNAL_SERVER_ERROR, msg);
			buildWith = HduoResponse.create().fail(error).buildWith(resultMap);
		}
		
		return buildWith;
	}
	
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value="/login/userDelete.do")
	public void userDelete(HttpServletRequest request, HttpMethod httpMethod, @RequestParam(required = true) String myId ) throws Exception{
		loginService.updateUserDelete(myId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
