package com.lms.hexa.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.service.SchoolService;

@Controller
@RequestMapping("/manager/school")
public class SchoolController {
	
	@Resource(name="schoolService")
	private SchoolService service;
	
	@RequestMapping("/list")
	public ModelAndView list(CriteriaCommand criCmd,ModelAndView mnv)throws Exception{
		
		String url="manager/school/list";
		Criteria cri = criCmd.toCriteria();
		Map<String, Object> dataMap = service.selectSchoolList(cri);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/regist", method = RequestMethod.POST, consumes = "application/json")
	public String regist(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/school/list.do";
		
		int result = service.registSchool(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST, consumes = "application/json")
	public String delete(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/school/list.do";
		
		 service.deleteSchool(params);
		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json")
	public String update(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/school/list.do";
		
		service.updateSchool(params);
		
		
		
		return url;
	}
}
