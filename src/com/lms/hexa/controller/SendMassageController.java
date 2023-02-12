package com.lms.hexa.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.service.KakaoSendService;

@Controller
public class SendMassageController {
	
	@Resource(name="kakaoSendService")
	private KakaoSendService kakaoSendService;
	
	
	@RequestMapping("/manager/academymanagement/kakao/list")
	public ModelAndView list(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		String url="/manager/academymanagement/kakao/list";
		Criteria cri = criCmd.toCriteria();
		
		Map<String, Object> dataMap = kakaoSendService.getKakaoSendList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
}
