package com.lms.hexa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.MenuVO;
import com.lms.hexa.service.AcademyHomepageUseService;
import com.lms.hexa.service.AcademyinfoService;
import com.lms.hexa.service.MenuService;
import com.lms.hexa.service.SubjectAttendanceService;

@Controller
@RequestMapping("/manager/academyinfo")
public class AcademyinfoController {
	
	@Resource(name="academyinfoService")
	private AcademyinfoService academyinfoService;
	
	@Resource(name="academyHomepageUseService")
	private AcademyHomepageUseService academyHomepageUseService;
	

	
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv)throws Exception{
		String url="/manager/academyinfo/main";
		Map<String, Object> dataMap = academyinfoService.selectAcademyinfoList();
		Map<String, Object> SMenu = academyinfoService.selectMainMenu();
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("SMenu", SMenu);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> subMenu(String menuId) throws Exception {
		
		System.out.println("컨트롤러 : " + menuId);
		ResponseEntity<Map<String,Object>> entity=null;
		
		Map<String, Object> subMenuList = academyinfoService.selectSubMenuList(menuId);
		
		System.out.println("서브메뉴 : " + subMenuList);
		
		 entity  = new ResponseEntity<Map<String,Object>>(subMenuList,HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(value="/footer", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> footer() throws Exception {
		
		 ResponseEntity<Map<String,Object>> entity=null;
		 
		 
		 Map<String, Object> selectInfoList = academyinfoService.selectInfoList();
		
		 entity  = new ResponseEntity<Map<String,Object>>(selectInfoList,HttpStatus.OK);
		 return entity;
	}
	
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPost(AcademyinfoVO academyinfo,HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{
		
		
		System.out.println(academyinfo);
		String url="redirect:/manager/academyinfo/main.do";

		academyinfoService.modify(academyinfo);
		return url;
	}
	
	@RequestMapping("/uselog")
	public ModelAndView uselog(ModelAndView mnv)throws Exception{
		String url="/manager/academyinfo/uselog";
		Map<String, Object> dataMap = academyinfoService.selectMenuNameAll();
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST, consumes = "application/json")
	public String updateMenu(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/academyinfo/main.do";
		System.out.println(params);
		academyinfoService.updateMenu(params);
		return url;
	}
	
	@RequestMapping(value="/menuNameUpdate", method = RequestMethod.POST, consumes = "application/json")
	public String updateMenuName(@RequestBody HashMap<String, Object> params, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/academyinfo/main.do";
		
		System.out.println("메뉴아이디 : " + params);
		
		academyinfoService.updateMenuName(params);

		return url;
	}
	
	
	@RequestMapping(value="/uselog/list", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<Map<String,Object>> useList(@RequestBody HashMap<String, Object> params , ModelAndView mnv)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		
		
		Map<String, Object> dataMap = academyHomepageUseService.selectMenuNameList();
		
		try {
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();		
		}
		return entity;
	}
	
	@RequestMapping("/uselog/menulist")
	public ResponseEntity<Map<String,Object>> menuList(ModelAndView mnv)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		
		Map<String, Object> dataMap = academyinfoService.selectMenuNameAll2();
		
		try {
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();		
		}
		return entity;
	}
	
}
