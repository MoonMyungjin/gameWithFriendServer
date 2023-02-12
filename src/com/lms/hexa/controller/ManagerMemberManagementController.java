package com.lms.hexa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.command.AttandanceNum;
import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.ParentRegistCommand;
import com.lms.hexa.command.StudentRegistCommand;
import com.lms.hexa.command.UserRegistCommand;
import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.SubjectAttendanceVO;
import com.lms.hexa.dto.UserVO;
import com.lms.hexa.service.ManagerAttandanceService;
import com.lms.hexa.service.ParentService;
import com.lms.hexa.service.SchoolService;
import com.lms.hexa.service.StudentService;
import com.lms.hexa.service.SubjectAttendanceService;
import com.lms.hexa.service.UserService;
import com.lms.hexa.util.MakeFileName;

@Controller
@RequestMapping("/manager/membermanagement")
public class ManagerMemberManagementController {
	
	@Resource(name="subjectAttendanceService")
	private SubjectAttendanceService subjectAttendanceService;
	
	@Autowired
	private StudentService studentService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="parentService")
	private ParentService parentService;
	
	@Resource(name="managerAttandanceService")
	private ManagerAttandanceService service;
	
	@Autowired
	private SchoolService schoolService;
	
	@RequestMapping("/IDApplyList")
	public void idModifyList() throws Exception {}
	
	@RequestMapping("/attandance/reader")
	public void reader() throws Exception {}
	
	@RequestMapping("/attandance/fail")
	public void fail() throws Exception {}
	
	@RequestMapping("/attandance/check")
	public ModelAndView check(String id,ModelAndView mnv) throws Exception {
		String url="manager/membermanagement/attandance/check";
		service.modifyByQr(id);
		mnv.addObject("id",id);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/attandance/checkz")
	public ModelAndView checkz(String id,ModelAndView mnv) throws Exception {
		String url="manager/membermanagement/attandance/checkz";
		service.modifyByQrz(id);
		mnv.addObject("id",id);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/attandance/inmodify")
	public ModelAndView inmodify(CriteriaCommand criCmd,ModelAndView mnv)throws Exception{
		String url="manager/membermanagement/attandance/inmodify";
		Criteria cri = criCmd.toCriteria();
		Map<String, Object> dataMap = service.getAttandanceStudentIdList(cri);							
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/attandance/outmodify")
	public ModelAndView outmodify(CriteriaCommand criCmd,ModelAndView mnv)throws Exception{
		String url="manager/membermanagement/attandance/outmodify";
		Criteria cri = criCmd.toCriteria();
		Map<String, Object> dataMap = service.selectOutGetStudentId(cri);						
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/attandance/list")
	public ModelAndView list(AttandanceNum att, ModelAndView mnv)throws Exception{
		String url="manager/membermanagement/attandance/list";
		Map<String, Object> dataMap = service.getAttandanceList(att);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	

	
	@RequestMapping(value="/attandance/inmodify",method=RequestMethod.POST)
	public String modifyPost(String studentId,HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/manager/membermanagement/attandance/inmodify.do";
		service.modify(studentId);
		return url;
	}
	
	@RequestMapping(value="/attandance/inmodifyCancle",method=RequestMethod.POST)
	public String modifyCanclePost(String studentId,HttpServletRequest request, //BoardModifyCommand modifyReq,
			RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/manager/membermanagement/attandance/inmodify.do";
		service.modifyCancle(studentId);
		return url;
	}
	@ResponseBody
	@RequestMapping(value="/attandance/inmodifyAll",method=RequestMethod.POST)
	public String updateAttAll(String atnId,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:manager/membermanagement/attandance/list.do";
		
		service.modifyAll(atnId);
		
		
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/attandance/inmodifyAllCancle",method=RequestMethod.POST)
	public String updateAttAllCancle(String atnId,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:manager/membermanagement/attandance/list.do";
		
		service.modifyAllCancle(atnId);
		
		
		
		return url;
	}
	
	@RequestMapping(value="/attandance/outmodify",method=RequestMethod.POST)
	public String modifyOut(String studentId,HttpServletRequest request, //BoardModifyCommand modifyReq,
			RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/manager/membermanagement/attandance/outmodify.do";
		service.modifyOut(studentId);
		return url;
	}
	
	@RequestMapping(value="/attandance/outmodifyCancle",method=RequestMethod.POST)
	public String modifyOutCancle(String studentId,HttpServletRequest request, //BoardModifyCommand modifyReq,
			RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/manager/membermanagement/attandance/outmodify.do";
		service.modifyOutCancle(studentId);
		return url;
	}
	
	@RequestMapping("/membermanagement/list")
	public ModelAndView memberManagementList(CriteriaCommand criCmd ,ModelAndView mnv)throws Exception{
		String url = "manager/membermanagement/membermanagement/list";
		
		Criteria cri = criCmd.toCriteria();
		
		Map<String, Object> dataMap = studentService.getStudentList(cri);
		Map<String, Object> dataMap1 = schoolService.selectSchoolList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap1", dataMap1);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/membermanagement/regist")
	public String regist(StudentRegistCommand studentReq) throws Exception {
		String url = "manager/membermanagement/membermanagement/regist_success";
		
		StudentVO student = studentReq.toStudentVO();
		studentService.insertStudent(student);
		
		return url;
	}
	
	@RequestMapping("/user/registUser")
	public String registUserStudent(UserRegistCommand userReq) throws Exception {
		String url = "manager/membermanagement/membermanagement/registUser_success";
		
		UserVO user = userReq.toUserVO();
		
		userService.insertUser(user);
		
		return url;
		
	}
	
	@RequestMapping("/membermanagement/registParent")
	public String registParent(ParentRegistCommand parentReq) throws Exception {
		String url = "manager/membermanagement/membermanagement/regist_success";
		
		ParentVO parent = parentReq.toParentVO();
		
		parentService.insertParent(parent);
		
		return url;
	}
	
	@RequestMapping("/membermanagement/detail")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> studentDetail(String id, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		StudentVO student = null; 
		StudentVO student1 = null;
		
		student = studentService.getStudent(id);
		student1 = studentService.getStudent(id);
		
		/*
		 * String originalFileName =
		 * MakeFileName.parseFileNameFromUUID(student1.getStudentPicture(), "\\$\\$");
		 * student1.setStudentPicture(originalFileName);
		 */
		
		ParentVO parent = parentService.selectParentByStudentId(id);
		
		try {
			dataMap.put("student", student);
			dataMap.put("student1", student1);
			dataMap.put("parent", parent);
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/attandance/subjectlist")
	public ModelAndView subjectlist(CriteriaCommand criCmd,AttandanceNum att, ModelAndView mnv,HttpServletRequest req)throws Exception{
		String url="manager/membermanagement/attandance/subjectlist";
		Criteria cri = criCmd.toCriteria();
		HttpSession session = req.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginUser");
		
		String mngId = manager.getId();
		
		Map<String, Object> dataMap = subjectAttendanceService.getByTeacherAttList(mngId, cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	
	@RequestMapping(value = "/attandance/subjectlistAjax", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> subjectListAjax(@RequestBody HashMap<String, Object> params,ModelAndView mnv,HttpServletRequest req)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> sqlMap = new HashMap<String, Object>();
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		
		List<SubjectAttendanceVO> ajaxSubjectList = subjectAttendanceService.forMainGetAttAjax(params);
		
		dataMap.put("ajaxSubjectList", ajaxSubjectList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	
	@RequestMapping("/attandance/subjectlistSearch")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> lessonAssignmentByName(String search,ModelAndView mnv,HttpServletRequest req)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> sqlMap = new HashMap<String, Object>();
		Map<String,Object> dataMap = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginUser");	
		String mngId = manager.getId();
		sqlMap.put("search", search);
		sqlMap.put("mngId", mngId);
		List<SubjectAttendanceVO> byTeacherAttSearchList = subjectAttendanceService.getByTeacherAttSearchList(sqlMap);
		
		dataMap.put("byTeacherAttSearchList", byTeacherAttSearchList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/attandance/subjectInmodify",method=RequestMethod.POST)
	public String subjectModifyPost(String studentId,String assignId,HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{	
		System.out.println(studentId);
		System.out.println(assignId);
		
		String url = "redirect:/manager/membermanagement/attandance/subjectlist.do";
		SubjectAttendanceVO subject = new SubjectAttendanceVO();
		subject.setStudentId(studentId);
		subject.setLessonAssignmentId(assignId);
		subjectAttendanceService.updateSubject(subject);
		return url;
	}
	@ResponseBody
	@RequestMapping(value="/attandance/subjectOutmodify",method=RequestMethod.POST)
	public String subjectOutModifyPost(String studentId,String assignId,HttpServletRequest request, //BoardModifyCommand modifyReq,
			RedirectAttributes rttr) throws Exception{
		System.out.println(studentId);
		System.out.println(assignId);
		
		String url = "redirect:/manager/membermanagement/attandance/subjectlist.do";
		SubjectAttendanceVO subject = new SubjectAttendanceVO();
		subject.setStudentId(studentId);
		subject.setLessonAssignmentId(assignId);
		subjectAttendanceService.updateOutSubject(subject);
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/attandance/subjectAllmodify",method=RequestMethod.POST, consumes = "application/json")
	public String updateSubjectAll(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/membermanagement/attandance/subjectlist.do";
		
		subjectAttendanceService.updateAll(params);
		
		
		
		return url;
	}
	

	@ResponseBody
	@RequestMapping(value="/attandance/subjectAllCanclemodify",method=RequestMethod.POST, consumes = "application/json")
	public String updateSubjectAllCancle(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/membermanagement/attandance/subjectlist.do";
		
		subjectAttendanceService.updateAllCancle(params);
		
		
		
		return url;
	}

	@RequestMapping("/membermanagement/takePicture")
	public void takePicture() {}
	
	
	
	
	@RequestMapping("/attandance/listForLate")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> listForLate(String id,HttpServletRequest req)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		
		
		ManagerAttandanceVO selectForLate = service.selectForLate(id);
		dataMap.put("selectForLate", selectForLate);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	@RequestMapping("/attandance/ajaxAtt")
	@ResponseBody
	public ResponseEntity ajaxAtt(AttandanceNum att, ModelAndView mnv,String ajaxDate)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String, Object> dataMap = service.getAttandanceList2(att,ajaxDate);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/attandance/ajaxAttMonth")
	@ResponseBody
	public ResponseEntity ajaxAttMonth(AttandanceNum att, ModelAndView mnv,String ajaxDate)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String, Object> dataMap = service.getAttandanceList3(att,ajaxDate);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}

}
