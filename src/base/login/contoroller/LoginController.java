package base.login.contoroller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import base.login.service.LoginService;

@Controller
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value="/login/loginCheck.do", method = RequestMethod.GET)
	public ModelAndView loginCheck(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView, @RequestParam HashMap<String, String> commandMap ) throws Exception{
		Map<String, String> returnMap = new HashMap<String, String>();
		
		commandMap.put("uIntgId","TEST39");
		
		returnMap = loginService.selectUserInfo(commandMap);
		
		modelAndView.addObject("userInfo", returnMap);
		
		modelAndView.setViewName("jsonView");
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
