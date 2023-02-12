package com.lms.hexa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.ConsultingVO;
import com.lms.hexa.dto.LessonRoomVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.ClassService;
import com.lms.hexa.service.ConsultingService;
import com.lms.hexa.service.LessonService;
import com.lms.hexa.service.StudentService;

@RequestMapping("/manager/classManagement")
@Controller
public class MemberClassController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private ConsultingService consultingService;
	
	@Autowired
	private LessonService lessonService;
	
	@RequestMapping("/managementForm")
	public ModelAndView managementForm(ModelAndView mnv) throws Exception {
		
		String url = "manager/membermanagement/classManagement/list";
	
		List<StudentVO> studentList = studentService.getStudentClassInfoList();
		List<ClassVO> classList = classService.getClassList();
		int nextClassId = classService.getClassMaxClassId()+1;
		List<ConsultingVO> teacherList = consultingService.getTeacher();
		List<LessonRoomVO> roomList = lessonService.getAllLessonRoomList();
		
		mnv.addObject("studentList", studentList);
		mnv.addObject("classList", classList);
		mnv.addObject("nextClassId", nextClassId);
		mnv.addObject("teacherList", teacherList);
		mnv.addObject("roomList", roomList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/studentByClass")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> studentByClass(String className) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		System.out.println(className);
		
		List<StudentVO> studentByClassList = classService.getStudentByClass(className);
		dataMap.put("studentByClassList", studentByClassList);
		List<StudentVO> notIncludeStudentByClassList = classService.getNotIncludeStudentByClass(className);
		dataMap.put("notIncludeStudentByClassList", notIncludeStudentByClassList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/belongUpdate", method = RequestMethod.POST, consumes = "application/json")
	public String registtakeLessonInfo(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/classManagement/managementForm.do";
		
		classService.registBelongValues(params);
		
		return url;
	}
	
	@RequestMapping("/classInfoUpdate")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> classInfoUpdate(@RequestBody HashMap<String, Object> params) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
			classService.updateclassInfo(params);
		return entity;
	}
	
}
