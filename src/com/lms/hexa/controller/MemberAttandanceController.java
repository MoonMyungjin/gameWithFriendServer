package com.lms.hexa.controller;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.ManagerAttandanceService;

@Controller
@RequestMapping("/member/attandance")
public class MemberAttandanceController {
	
	
	
	@RequestMapping("/inmodify")
	public void inmodify()throws Exception{}
	
	@Resource(name="managerAttandanceService")
	private ManagerAttandanceService service;
	
	@RequestMapping("/outmodify")
	public ModelAndView outmodify(HttpServletRequest req,ModelAndView mnv)throws Exception{
		String selectAtt ="";
		String url = "/member/attandance/outmodify";
		HttpSession session = req.getSession();
		StudentVO student = (StudentVO) session.getAttribute("loginUser");
		String id = student.getId();
		
		selectAtt = service.selectAtt(id);
		System.out.println(selectAtt);
		mnv.addObject("selectAtt",selectAtt);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest req,ModelAndView mnv)throws Exception{
		String url = "/member/attandance/list";
		String id = "";
		String name = "";
		Map<String, Object> dataMap = new HashMap<>();
		HttpSession session = req.getSession();
		List<StudentVO> selectChildList = new ArrayList<>();
		
		String cate = (String) session.getAttribute("category");
	
		if(cate.equals("s")){
			StudentVO student = (StudentVO) session.getAttribute("loginUser");
			id = student.getId();
		}else if(cate.equals("p")){
			ParentVO parent = (ParentVO) session.getAttribute("loginUser");
			 String id2 = parent.getId();
			 selectChildList = service.selectChildList(id2);
			 StudentVO studentVO = selectChildList.get(0);
			 id = studentVO.getId();
			 name = studentVO.getName();
			 
		}
	
		List<ManagerAttandanceVO> selectAttMember = new ArrayList<>();
		Date parse2 = new Date();
		Date parse = new Date();
		for(int i =0; i<7; ++i) {
			ManagerAttandanceVO attVO = new ManagerAttandanceVO();
			attVO.setStudentId(id);
			attVO.setNowDate(Integer.toString(i));
			
			ManagerAttandanceVO attVO2 = new ManagerAttandanceVO();
			attVO2 = service.selectAttMember(attVO);
			if(attVO2 !=null) {
				SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
				
				
				if(attVO2.getMinStart() ==null && attVO2.getMaxEnd() ==null) {
					parse2 = new Date();
					parse = new Date();
				}else {
					parse2= formatter.parse(attVO2.getMinStart());
					parse = formatter.parse(attVO2.getMaxEnd());
					
				}
				long diffMin = (parse.getTime() - parse2.getTime())/ 60000;
				String valueOf = String.valueOf(diffMin);
				attVO2.setRealTimeLesson(valueOf);
				
			}
			
			 selectAttMember.add(i, attVO2);
		}
		dataMap.put("selectAttMember", selectAttMember);
		dataMap.put("name", name);
		dataMap.put("cate", cate);
		dataMap.put("id", id);
		dataMap.put("selectChildList", selectChildList);
		dataMap.put("selectChildList2", selectChildList);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/listweek", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<Map<String,Object>> listweek(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/member/attandance/list.do";
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<Object> memAttList = (List<Object>) params.get("memAttlVOList");
		System.out.println(params);
		System.out.println(memAttList);
		
		List<ManagerAttandanceVO> selectAttMember = new ArrayList<>();
		
		  for(int i =0; i<7; ++i) {
		  
			  Object object = memAttList.get(i);
			  
			  ManagerAttandanceVO attVO2 = new ManagerAttandanceVO(); 
			  attVO2 =service.selectAttMember2(object); 
			  if(attVO2 !=null) {
				  	SimpleDateFormat formatter = new SimpleDateFormat("HH:mm"); 
				  	Date parse2 = formatter.parse(attVO2.getMinStart()); 
				  	Date parse = formatter.parse(attVO2.getMaxEnd()); 
				  	long diffMin = (parse.getTime() - parse2.getTime())/ 60000; String valueOf = String.valueOf(diffMin);
				  	attVO2.setRealTimeLesson(valueOf);
			  }
			  selectAttMember.add(i, attVO2); 
		}
		 dataMap.put("selectAttMember", selectAttMember);
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/listMonth", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<Map<String,Object>> listMonth(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		System.out.println(params);
		
		String url = "redirect:/member/attandance/list.do";
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<Object> memAttList = (List<Object>) params.get("memAttlVOList");
		
		
		List<ManagerAttandanceVO> selectAttMember = new ArrayList<>();
		
		
		for(int i =0; i<memAttList.size(); ++i) {
			  
			  Object object = memAttList.get(i);
			  
			  ManagerAttandanceVO attVO2 = new ManagerAttandanceVO(); 
			  attVO2 =service.selectAttMember2(object); 
			  if(attVO2 !=null) {
				  	SimpleDateFormat formatter = new SimpleDateFormat("HH:mm"); 
				  	Date parse2 = formatter.parse(attVO2.getMinStart()); 
				  	Date parse = formatter.parse(attVO2.getMaxEnd()); 
				  	long diffMin = (parse.getTime() - parse2.getTime())/ 60000; String valueOf = String.valueOf(diffMin);
				  	attVO2.setRealTimeLesson(valueOf);
			  }
			  selectAttMember.add(i, attVO2); 
		}
		dataMap.put("selectAttMember", selectAttMember);
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}
}
