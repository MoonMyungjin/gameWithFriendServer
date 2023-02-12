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

import com.lms.hexa.service.AcademyScheService;
import com.lms.hexa.service.AcademyinfoService;

@Controller
@RequestMapping("/manager/academysche")
public class AcademyScheController {
	
	@Resource(name="academyScheService")
	private AcademyScheService academyScheService;
	
	
	@RequestMapping("/list")	
	public ModelAndView list(ModelAndView mnv)throws Exception{
		String url="/manager/academysche/list";
		Map<String, Object> dataMap = academyScheService.selectAcademyScheList();
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/regist", method = RequestMethod.POST, consumes = "application/json")
	public String regist(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		System.out.println("index1"+params);
		String url = "redirect:/manager/academysche/list.do";
		
		int result = academyScheService.registAcademyUpSche(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/registmain", method = RequestMethod.POST, consumes = "application/json")
	public String registmain(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/academysche/list.do";
		
		int result = academyScheService.registAcademySche(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST, consumes = "application/json")
	public String delete(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/academysche/list.do";
		
		academyScheService.deleteAcademyUpSche(params);
		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatecal", method = RequestMethod.POST, consumes = "application/json")
	public String updatecal(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/academysche/list.do";
		
		academyScheService.updateAcademyCal(params);
		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateResize", method = RequestMethod.POST, consumes = "application/json")
	public String updateResize(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/academysche/list.do";
		
		academyScheService.updateAcademyResize(params);
		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateDetail", method = RequestMethod.POST, consumes = "application/json")
	public String updateDetail(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/academysche/list.do";
		
		academyScheService.updateAcademyDetail(params);
		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteDetail", method = RequestMethod.POST, consumes = "application/json")
	public String deleteDetail(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		System.out.println(params);
		String url = "redirect:/manager/academysche/list.do";
		
		academyScheService.deleteAcademyDetail(params);
		
		
		
		return url;
	}
}
