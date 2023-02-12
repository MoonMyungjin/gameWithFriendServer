package com.lms.hexa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lms.hexa.dto.ConsultingVO;
import com.lms.hexa.service.ConsultingService;


@Controller
public class ManagerConsultingController {
	
	
	@Autowired
	private ConsultingService consultingService;
	
	@RequestMapping(value="/manager/consulting/scheduleManagement", method = RequestMethod.GET, produces="text/plain;charset=utf-8")
	public ModelAndView scheduleManagement(ModelAndView mnv,Authentication auth,String mngId)throws Exception {
		String url = "manager/consulting/scheduleManagement";
		
		 String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		 
		 System.out.println("login_id : " + login_id);
		 System.out.println("mngId : " + mngId);
		 
		 if(mngId==null) {
			 mngId = login_id;
		 }
		 
		 List<ConsultingVO> scheduleList = consultingService.getSchedule(mngId);
		 
		 
		 ConsultingVO consulting = new ConsultingVO();
		 consulting.setMngId(login_id);
		
		 
		 System.err.println("************************"+login_id);
		 
		 
		 mnv.addObject("scheduleList",scheduleList);
		 
		 mnv.setViewName(url);
			return mnv;
	}
	
	
	@RequestMapping(value="/manager/consulting/scheduleDetail", method = RequestMethod.POST)
	@ResponseBody
//	public ResponseEntity<Map<String,Object>> scheduleDetail(String cnsltId)throws Exception {
	public ResponseEntity<Map<String,Object>> scheduleDetail(String cnsltId)throws Exception {

		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		 
		 System.out.println("cnsltId : " + cnsltId);
		 

		 
		 ConsultingVO scheduleDetailParentVer = consultingService.getScheduleDetailParentVer(cnsltId);

		 Date cnsltSchDate = scheduleDetailParentVer.getCnsltSchDate();
		 System.out.println(cnsltSchDate);
		 SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		 String format = newDtFormat.format(cnsltSchDate);
		 System.out.println(format);
		 
		 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");


		 Date to = transFormat.parse(format);
		 System.out.println(to);

		 dataMap.put("scheduleDetailParentVer",scheduleDetailParentVer);
	

		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	


	@RequestMapping(value="/manager/consulting/updateConfirmY", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> updateConfirmY(String cnsltId)throws Exception {
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		 
		 
		System.err.println(cnsltId);
		 consultingService.updateConfirmY(cnsltId);

	

		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	

	@RequestMapping(value="/manager/consulting/updateConfirmN", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> updateConfirmN(String cnsltId)throws Exception {
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		 
		 System.err.println(cnsltId);
		 
		 consultingService.updateConfirmN(cnsltId);

	

		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
	@RequestMapping("/manager/consulting/list")
	public ModelAndView list(ModelAndView mnv,Authentication auth,String mngId,String search)throws Exception {
		String url = "manager/consulting/list";
		
		
		
		 String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		

		 
		 ConsultingVO consulting = new ConsultingVO();
		 consulting.setMngId(login_id);
		 consulting.setCnsltApplyer(search);
		 consulting.setStudentName(search);

	
		 List<ConsultingVO> selectCNSLFinishList = consultingService.getselectCNSLFinishList(consulting);
		 
		 System.err.println("************************"+login_id +search );
		 


		
		mnv.addObject("selectCNSLFinishList",selectCNSLFinishList);	 
	    mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value="/manager/consulting/finishDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> managerSelectFinishDetail(String cnsltId)throws Exception {
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		 
		 System.out.println("cnsltId : " + cnsltId);
		 

		 
		 ConsultingVO finishDetail = consultingService.getManagerSelectFinishDetail(cnsltId);
	
		
		 
		 dataMap.put("finishDetail",finishDetail);
	

		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/manager/consulting/updateRegist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> updateRegist(ConsultingVO consulting)throws Exception {
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		 
		 System.err.println(consulting);
		 
		 consultingService.updateRegist(consulting);
		 

		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
}
