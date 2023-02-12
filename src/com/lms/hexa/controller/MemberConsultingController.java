package com.lms.hexa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.lms.hexa.command.ConsultingRegistCommand;
import com.lms.hexa.dto.ConsultingVO;
import com.lms.hexa.service.ConsultingService;

@Controller
public class MemberConsultingController {
	
	
	@Autowired
	private ConsultingService consultingService;
	
	@RequestMapping("/member/consulting/request")
	public ModelAndView consultationRequest(ModelAndView mnv,Authentication auth,String prentId,String studentId)throws Exception {
		String url="member/consulting/request";
		
		 String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		
		 List<ConsultingVO> studentList = consultingService.getStudent(login_id);

		 
		 ConsultingVO consulting = new ConsultingVO();
		 consulting.setParentId(login_id);
		 consulting.setStudentId(studentId);
		 
		 System.err.println("************************"+login_id + studentId);
		 
		List<ConsultingVO> divisionList = consultingService.getDivision();
		List<ConsultingVO> teacherList = consultingService.getTeacher();
		

		
		mnv.addObject("divisionList",divisionList);
		mnv.addObject("teacherList",teacherList);
		mnv.addObject("studentList",studentList);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/consulting/getSchedule")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getManagerSchedule(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<ConsultingVO> managerScheduleList = consultingService.getManagerSchedule(params);
		dataMap.put("managerScheduleList", managerScheduleList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping(value="/member/consulting/regist", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String regist(HttpServletRequest request, RedirectAttributes rttr,ConsultingRegistCommand consultingReqCmd) throws Exception {
		
		String url = "member/consulting/regist_success";
		System.out.println(consultingReqCmd.toString());
		ConsultingVO consulting = consultingReqCmd.toConsultingVO();
		int result = consultingService.insertRequest(consulting);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}
	
	
	
	
	
	
	@RequestMapping("/member/consulting/history")
	public ModelAndView selectCNSLTBeforList(ModelAndView mnv,HttpServletRequest request,Authentication auth,String studentId)throws Exception {
		String url="member/consulting/history";
		
		HttpSession session = request.getSession();
		String category = (String)session.getAttribute("category");
		
		String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		
		List<ConsultingVO> parentSelectCNSLTBeforList = new ArrayList<ConsultingVO>();
		List<ConsultingVO> studentSelectCNSLTBeforList = new ArrayList<ConsultingVO>();
		List<ConsultingVO> selectFinishDetailParentVer = new ArrayList<ConsultingVO>();
		List<ConsultingVO> selectFinishDetailStudentVer = new ArrayList<ConsultingVO>();
		List<ConsultingVO> studentList = consultingService.getStudent(login_id);

		if(studentId == null && category.equals("p")) {
			studentId = studentList.get(0).getStudentId();
		  }
		  
		
		
		
		
		if( category.equals("p")) {
			parentSelectCNSLTBeforList = consultingService.getParentSelectCNSLTBeforList(login_id);
			selectFinishDetailParentVer = consultingService.getmemberSelectFinishDetailParentVer(login_id);
			studentList = consultingService.getStudent(login_id);
			
		
		}
			
		else if( category.equals("s")){
			studentSelectCNSLTBeforList = consultingService.getStudentSelectCNSLTBeforList(login_id);
			selectFinishDetailStudentVer = consultingService.getmemberSelectFinishDetailStudentVer(login_id);
		}
		
		 
		 ConsultingVO consulting = new ConsultingVO();
		 if( category.equals("p")) {
		 consulting.setParentId(login_id);
		 consulting.setStudentId(studentId);
		

			}
			
			else if( category.equals("s")){
		 consulting.setStudentId(login_id);
			}
		 
			
		mnv.addObject("parentSelectCNSLTBeforList",parentSelectCNSLTBeforList);
		mnv.addObject("studentSelectCNSLTBeforList",studentSelectCNSLTBeforList);
		mnv.addObject("selectFinishDetailParentVer",selectFinishDetailParentVer);
		mnv.addObject("selectFinishDetailStudentVer",selectFinishDetailStudentVer);
		mnv.addObject("studentList",studentList);
		
		mnv.setViewName(url);
		
		
		return mnv;
		
	}
	
	
	@RequestMapping(value="/member/consulting/beforDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> selectCNSLTBeforDetail(String cnsltId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<ConsultingVO> selectCNSLTBeforDetail = consultingService.getSelectCNSLTBeforDetail(cnsltId);
		dataMap.put("selectCNSLTBeforDetail", selectCNSLTBeforDetail);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
		
	}
	




	@RequestMapping(value="/member/consulting/studentUpdateConfirmN", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> studentUpdateConfirmN(String cnsltId)throws Exception {
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		 
		 System.err.println(cnsltId);
		 
		 consultingService.studentUpdateConfirmN(cnsltId);

	

		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	

}
