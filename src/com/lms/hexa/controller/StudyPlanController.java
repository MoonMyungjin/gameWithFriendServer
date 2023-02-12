package com.lms.hexa.controller;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.dto.StudyPlanVO;
import com.lms.hexa.service.StudyPlanService;


@Controller
public class StudyPlanController {


	
	@Autowired
	private StudyPlanService studyPlanService;


	   @RequestMapping("/manager/studyPlan/registForm") 
	   public ModelAndView managerWeekList(ModelAndView mnv, Authentication auth, String week)throws Exception{
	    String url = "manager/studyPlan/registForm"; 
	    String login_id = (String) auth.getPrincipal(); // 濡쒓렇�씤 �떆�룄�븳 ID瑜� 媛��졇�삩�떎
	    LocalDate now = LocalDate.now();
		  
		  
		  if(week == null) {
			  int year = now.getYear();
			  int dayOfYear = now.getDayOfYear();
			  int week2 = (int) Math.ceil((dayOfYear-3)/7)+1;
			  
			  week = year+"-W"+week2;
		  }
		  
		  StudyPlanVO studyPlanWeek = new StudyPlanVO();
		  studyPlanWeek.setMngId(login_id);
		  studyPlanWeek.setSplanWeek(week);
//		  studyPlanWeek.setStudentId(studentId);
		  

//		  StudyPlanVO studyPlanWeek = studyPlanService.getStudyPlanWeek(studyPlan);
//		  List<StudyPlanVO> subjectStudyPlanWeekList = studyPlanService.getSubjectStudyPlanWeekList(studyPlan);
//		  List<StudyPlanVO> dateStudyPlanWeekList = studyPlanService.getDateStudyPlanWeekList(studyPlan);
		  List<StudyPlanVO> studentList = studyPlanService.getStudentList(login_id);
		  
		  
//		  System.out.println(studyPlanWeek);
		  mnv.addObject("studyPlanWeek", studyPlanWeek);
//		  mnv.addObject("subjectStudyPlanWeekList", subjectStudyPlanWeekList);
//		  mnv.addObject("dateStudyPlanWeekList", dateStudyPlanWeekList);
		  mnv.addObject("studentList", studentList);
		  
		  mnv.setViewName(url);
		  return mnv;
		  

	   
	   }
	   
	    @ResponseBody
	   @RequestMapping(value = "/manager/studyPlan/studentRegistForm", method = RequestMethod.POST, consumes = "application/json")
		public ResponseEntity<Map<String,Object>> studentWeekList(@RequestBody HashMap<String, Object> params, Authentication auth)throws Exception{
			
			ResponseEntity<Map<String,Object>> entity=null;
			Map<String,Object> dataMap = new HashMap<String, Object>();
			
			String login_id = (String) auth.getPrincipal(); // 濡쒓렇�씤 �떆�룄�븳 ID瑜� 媛��졇�삩�떎
			
			try {	
			String studentId = (String)params.get("studentId");
			String week = (String)params.get("week");
			
		    LocalDate now = LocalDate.now();
			  
		    if(week == null) {
				  int year = now.getYear();
				  int dayOfYear = now.getDayOfYear();
				  int week2 = (int) Math.ceil((dayOfYear-3)/7)+1;
				  
				  week = year+"-W"+week2;
			  }
			  
			  
			  System.err.println(week + studentId);
			  
			  StudyPlanVO studyPlan = new StudyPlanVO();
			  studyPlan.setSplanWeek(week);
			  studyPlan.setStudentId(studentId);
			  
	  		  StudyPlanVO studyPlanWeek = studyPlanService.getStudyPlanWeek(studyPlan);
	  		  List<StudyPlanVO> subjectStudyPlanWeekList = studyPlanService.getSubjectStudyPlanWeekList(studyPlan);
	  		  List<StudyPlanVO> dateStudyPlanWeekList = studyPlanService.getDateStudyPlanWeekList(studyPlan);
	  		  
	  		  
	  		  if(studyPlanWeek == null) {
	  			  studyPlanWeek = new StudyPlanVO();
	  			  studyPlanWeek.setSplanWeek(week);
	  		  }
	  		  if(studyPlanWeek.getSplanFeedback() == null) {
	  			  studyPlanWeek.setMngId(login_id);
	  			  
	  		  }
	  		  
	  		  System.out.println(studyPlanWeek);
	  		  dataMap.put("studyPlanWeek", studyPlanWeek);
	  		  dataMap.put("subjectStudyPlanWeekList", subjectStudyPlanWeekList);
	  		  dataMap.put("dateStudyPlanWeekList", dateStudyPlanWeekList);
	  		  
	  		 entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		    	}  catch (Exception e) {
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
				e.printStackTrace();			
			}
			
			return entity;
			
		}
			  

		@ResponseBody
		@RequestMapping(value = "/manager/studyPlan/regist", method = RequestMethod.POST, consumes = "application/json")
		public String managerRegist(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
			
			String url = "redirect:/manager/studyPlan/studentRegistForm.do";
			System.out.println(params);
			int result = studyPlanService.regist(params);
			
			if(result>0) {
				rttr.addFlashAttribute("msg", "ok");
			}
			rttr.addFlashAttribute("msg", "ng");
			
			return url;
		

		
		}
		
	   
	  @RequestMapping(value ="/member/studyPlan/list")
	  public ModelAndView pStudentWeekList(ModelAndView mnv, Authentication auth,String week,String studentId)throws Exception { 
		  
		  
//	    	  String url = "redirect:/member/studyPlan/list.do";
	    	  String url = "member/studyPlan/list";
		      String login_id = (String) auth.getPrincipal(); // 濡쒓렇�씤 �떆�룄�븳 ID瑜� 媛��졇�삩�떎
	    	    LocalDate now = LocalDate.now();
			  
			  
	    	    if(week == null) {
	  			  int year = now.getYear();
	  			  int dayOfYear = now.getDayOfYear();
	  			  int week2 = (int) Math.ceil((dayOfYear-3)/7)+1;
	  			  
	  			  week = year+"-W"+week2;
	  		  }
			  List<StudyPlanVO> pStudentList = studyPlanService.getPStudentList(login_id);
			  
			  if(studentId == null) {
				  studentId = pStudentList.get(0).getStudentId();
			  }
			  
			  
			  StudyPlanVO studyPlan = new StudyPlanVO();
			  studyPlan.setParentId(login_id);
			  studyPlan.setSplanWeek(week);
			  studyPlan.setStudentId(studentId);
			  
			  
			  System.err.println("************************"+login_id + week+ studentId);
			  
			  
		      StudyPlanVO studyPlanWeek = studyPlanService.getStudyPlanWeek(studyPlan);
			  List<StudyPlanVO> subjectStudyPlanWeekList = studyPlanService.getSubjectStudyPlanWeekList(studyPlan);
			  List<StudyPlanVO> dateStudyPlanWeekList = studyPlanService.getDateStudyPlanWeekList(studyPlan);
			  
			  
			  if(studyPlanWeek == null) {
				  studyPlanWeek = new StudyPlanVO();
				  studyPlanWeek.setSplanWeek(week);
			  }
			  System.err.println(studyPlanWeek);

			  mnv.addObject("studyPlanWeek", studyPlanWeek);
			  mnv.addObject("subjectStudyPlanWeekList", subjectStudyPlanWeekList);
			  mnv.addObject("dateStudyPlanWeekList", dateStudyPlanWeekList);
			  mnv.addObject("pStudentList", pStudentList);
			  mnv.addObject("selectedStudentId", studentId);
			  
			  mnv.setViewName(url);
			  return mnv;
		  
		  
		  
		  }
	  

	  
	  
	  
	  @RequestMapping(value = "/member/studyPlan/registForm") 
	  public ModelAndView weekList(ModelAndView mnv, Authentication auth, String week)throws Exception{
		  
		  String url = "member/studyPlan/registForm";
		  String login_id = (String) auth.getPrincipal(); // 濡쒓렇�씤 �떆�룄�븳 ID瑜� 媛��졇�삩�떎
		  LocalDate now = LocalDate.now();
		  
		  System.out.println(week);
		  
		  
		  if(week == null) {
			  int year = now.getYear();
			  int dayOfYear = now.getDayOfYear();
			  int week2 = (int) Math.ceil((dayOfYear-3)/7)+1;
			  
			  week = year+"-W"+week2;
		  }
		  
		  StudyPlanVO studyPlan = new StudyPlanVO();
		  studyPlan.setStudentId(login_id);
		  studyPlan.setSplanWeek(week);
		  
		  
		  StudyPlanVO studyPlanWeek = studyPlanService.getStudyPlanWeek(studyPlan);
		  List<StudyPlanVO> subjectStudyPlanWeekList = studyPlanService.getSubjectStudyPlanWeekList(studyPlan);
		  List<StudyPlanVO> dateStudyPlanWeekList = studyPlanService.getDateStudyPlanWeekList(studyPlan);
		  
		  if(studyPlanWeek == null) {
			  studyPlanWeek = new StudyPlanVO();
			  studyPlanWeek.setSplanWeek(week);
		  }
		  System.out.println(studyPlanWeek);
		  mnv.addObject("studyPlanWeek", studyPlanWeek);
		  mnv.addObject("subjectStudyPlanWeekList", subjectStudyPlanWeekList);
		  mnv.addObject("dateStudyPlanWeekList", dateStudyPlanWeekList);
		  mnv.setViewName(url);
		  return mnv;
		  }
	  
	  
		
		@ResponseBody
		@RequestMapping(value = "/member/studyPlan/regist", method = RequestMethod.POST, consumes = "application/json")
		public String regist(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
			
			String url = "redirect:/member/studyPlan/registForm.do";
			System.out.println(params);
			int result = studyPlanService.regist(params);
			
			if(result>0) {
				rttr.addFlashAttribute("msg", "ok");
			}
			rttr.addFlashAttribute("msg", "ng");
			
			return url;
		}

	@RequestMapping("/member/studyPlan/registFormGuide")
	public String guide()throws Exception{
		String url = "/member/studyPlan/registFormGuide";
		
		return url;
		
	}
	
}
     
