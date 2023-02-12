package com.lms.hexa.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.command.LessonRegistCommand;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.ConsultingVO;
import com.lms.hexa.dto.LessonRoomVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StandardCodeVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.TimeTableVO;
import com.lms.hexa.service.AuthorityService;
import com.lms.hexa.service.ClassService;
import com.lms.hexa.service.ConsultingService;
import com.lms.hexa.service.LessonService;
import com.lms.hexa.service.ManagerService;
import com.lms.hexa.service.TimeTableService;

@Controller
public class lessoncontroller {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private TimeTableService timeTableService;
	
	@Autowired
	private LessonService lessonService;

	@Autowired
	private ConsultingService consultingService;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@RequestMapping("/manager/lesson/registForm")
	public ModelAndView lessonRegistForm(String value,ModelAndView mnv)throws Exception{
		String url = "/manager/lesson/regist";
		
//		Criteria cri = new Criteria();
//		if(sh.getSearch4() != null) {
//			cri.setPage(Integer.parseInt(sh.getSearch4()));
//		}
//		cri.setPerPageNum(4);
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(lessonService.getModuleLessonListCountByTeacherName(sh));
//		mnv.addObject("pageMaker", pageMaker);
//		
		Map<String, Object> ScodeValues = lessonService.getScodeValues();
		mnv.addObject("ScodeValues", ScodeValues);
//		
//		mnv.addObject("sh", sh);
//		
//		List<LessonVO> lessonList = lessonService.getModuleLessonListByTeacherName(sh,cri);
		List<LessonVO> lessonList = lessonService.getModuleNotSearchLessonList(value);
		mnv.addObject("lessonList", lessonList);
		mnv.addObject("value", value);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/manager/lesson/detail")
	public ResponseEntity<Map<String,Object>> getlessonDetailInfo(String lessonId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		LessonVO lessonDetail = lessonService.getModuleLessonDetail(lessonId);
		dataMap.put("lessonDetailInfo", lessonDetail);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/manager/lesson/regist")
	public String lessonRegist(LessonVO lessonVO,RedirectAttributes rttr)throws Exception{
		String url = "redirect:/manager/lesson/registForm.do";
		String abc = lessonVO.getLessonGradeCategoryCode();
		
		lessonVO.setLessonGradeCategoryCode(abc.split(",")[0]);
		lessonVO.setLessonGradeInteGrate(abc.split(",")[1]+" "+lessonVO.getLessonGrade());
		System.out.println(lessonVO.toString());
		
		int result = lessonService.registLesson(lessonVO);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}

	
	@RequestMapping("/manager/lesson/assignment")
	public ModelAndView lessonRegistMain(SearchHelper sh,ModelAndView mnv)throws Exception{
		String url = "/manager/lesson/assignment";
		
//		List<ManagerVO> teacherList = managerService.getWorkingTeacherListSearchByName(name);
//		mnv.addObject("teacherList", teacherList);
		
		Criteria cri = new Criteria();
		if(sh.getSearch4() != null) {
			cri.setPage(Integer.parseInt(sh.getSearch4()));
		}
		cri.setPerPageNum(4);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lessonService.getModuleLessonListCountByTeacherName(sh));
		mnv.addObject("pageMaker", pageMaker);
		
		List<LessonVO> lessonList = lessonService.getModuleLessonListByTeacherName(sh,cri);
		mnv.addObject("lessonList", lessonList);
		
		
		mnv.addObject("sh", sh);
		
		Map<String, List<TimeTableVO>> ttMap = timeTableService.getTimeTablevalue();
		mnv.addObject("ttMap", ttMap);
		
		Map<String, Object> ScodeValues = lessonService.getScodeValues();
		mnv.addObject("ScodeValues", ScodeValues);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/manager/lesson/searchLessonList")
	public ResponseEntity<Map<String,Object>> searchLessonList(SearchHelper sh)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		Criteria cri = new Criteria();
		cri.setPage(Integer.parseInt(sh.getSearch4()));
		cri.setPerPageNum(4);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lessonService.getModuleLessonListCountByTeacherName(sh));
		dataMap.put("pageMaker", pageMaker);
		
		
		List<LessonVO> lessonList = lessonService.getModuleLessonListByTeacherName(sh,cri);
		dataMap.put("lessonList", lessonList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/lesson/teacherList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> lessonAssignmentByName(String subject,String name,ModelAndView mnv)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		ManagerVO managerVO = new ManagerVO();
		managerVO.setMngSubject(subject);
		managerVO.setMngName(name);
		List<ManagerVO> teacherList = managerService.getWorkingTeacherListSearchByName(managerVO);
		dataMap.put("teacherList", teacherList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	
	@RequestMapping("/manager/lesson/getInfo")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getTeacherInfoToJSON(String managerId,ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		ManagerVO teacherInfo = null;
		List<String> teacherSchedule = null;
		String id = managerId;
		try {
			teacherInfo = managerService.getManagerDetailById(id);		
			teacherSchedule = lessonService.getManagerScheduleListById(id);
			
			dataMap.put("teacherInfo", teacherInfo);
			dataMap.put("teacherSchedule", teacherSchedule);
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/manager/lesson/getSchudule")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getTeacherSchuduleToJSON(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		List<LessonVO> scheduleList = null;
		
		try {
			scheduleList = lessonService.getManagerScheduleListByPeriod(params);
			
			dataMap.put("scheduleList", scheduleList);
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	@RequestMapping("/manager/lesson/getLessonRoom")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getLessonRoomToJSON(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		List<LessonRoomVO> lessonRoomList = null;
		
		try {
			lessonRoomList = lessonService.getAvailableLessonRoomList(params);
			
			dataMap.put("lessonRoomList", lessonRoomList);
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/manager/lesson/realRegist", method = RequestMethod.POST)
	public String lessonRealRegist(@ModelAttribute LessonRegistCommand lessonRCommand,RedirectAttributes rttr)throws Exception{
		String url = "redirect:/manager/lesson/modify.do";
		System.out.println(lessonRCommand.toString());
		
		LessonVO lessonVO = lessonRCommand.toLessonVO();
		System.out.println(lessonVO.toString());
		int result = lessonService.registNewLesson(lessonVO);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
		
	}
	
	@RequestMapping("/manager/lesson/list")
	public ModelAndView lessonList(CriteriaCommand cri,ModelAndView mnv,Authentication auth)throws Exception{
		String url = "/manager/lesson/list";
		Map<String,Object> lessonMap = new HashMap<String, Object>();
		
		String userId = (String) auth.getPrincipal();
		Map<String,Object> searchInfoMap = new HashMap<String, Object>();
		List<LessonVO> lessonList = new ArrayList<LessonVO>();
		List<StandardCodeVO> lessonStateCodeList = lessonService.getLessonStateCodeList();
		searchInfoMap.put("cri",cri);
		
		int authorityCount = authorityService.getAuthorityCountById(userId);
		if(authorityCount>8) {
			lessonList = lessonService.getLessonListByTeacherName(searchInfoMap);
		} else {
			searchInfoMap.put("userId",userId);
			lessonList = lessonService.getLessonListByTeacherName(searchInfoMap);
		}
		
		lessonMap.put("lessonList", lessonList);
		lessonMap.put("lessonCri", cri);
		lessonMap.put("lessonStateCodeList", lessonStateCodeList);
		
		mnv.addObject("lessonMap", lessonMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/manager/lesson/getStudentList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getStudentListToJSON(String lessonId,ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		try {
			dataMap = lessonService.getStudentListByLessonId(lessonId);		
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/manager/takeLesson/regist", method = RequestMethod.POST, consumes = "application/json")
	public String registtakeLessonInfo(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr)throws Exception{
		
		String url = "redirect:/manager/lesson/list.do";
		
		int result = lessonService.registTakeLessonValues(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}
	
	@RequestMapping(value = "/manager/detail/regist", method = RequestMethod.POST)
	@ResponseBody
	public int registLessonAssignmentDetailInfo(@RequestBody LessonVO lessonVO)throws Exception{
		
		int result = lessonService.modifyLessonAssignmentDetailInfo(lessonVO);
		
		return result;
	}
	
	@RequestMapping("/manager/lesson/getSearchIncludeStudentListToJSON")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getSearchIncludeStudentListToJSON(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		Criteria cri =  criCmd.toCriteria();
		
		try {
			dataMap = lessonService.getSearchIncludeStudentList(cri);		
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/manager/lesson/updateLessonTimeInfo")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> updateLessonTimeInfo(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		lessonService.updateLessonAssignmentTableLaTimeInfo(params);		
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/lesson/getSearchNotIncludeStudentListToJSON")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getSearchNotIncludeStudentListToJSON(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		Criteria cri =  criCmd.toCriteria();
		
		try {
			dataMap = lessonService.getSearchNotIncludeStudentList(cri);		
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/common/lesson/detail", method = RequestMethod.GET)
	public ModelAndView lessonDetail(String lessonAssignmentId,ModelAndView mnv,HttpServletRequest request)throws Exception{
		String url = "/common/lesson/detail";
		
		HttpSession session = request.getSession();
		String category = (String)session.getAttribute("category");
		if(category.equals("s")) {
			StudentVO student = (StudentVO)session.getAttribute("loginUser");
			LessonVO lessonVO = new LessonVO();
			lessonVO.setStudentId(student.getId());
			lessonVO.setLessonAssignmentId(lessonAssignmentId);
			String result = lessonService.checkUserLesson(lessonVO);
			if(result != null) {
				mnv.addObject("isUserLesson", result);
			}
		}
		
		LessonVO lessonVO = lessonService.getLessonInfoByLessonAssignmentId(lessonAssignmentId);
		Map<String, Object> ScodeValues = lessonService.getScodeValues();
		List<StudentVO> IncludeList = lessonService.getIncludeStudentListByLessonAssignmentId(lessonAssignmentId);
		Map<String, List<TimeTableVO>> ttMap = timeTableService.getTimeTablevalue();
		List<String> lessonTimeList = lessonService.getLessonScheduleListByLessonAssignmentId(lessonAssignmentId);
		String lessonTimeInfo = lessonTimeList.toString();
		List<ManagerVO> teacherList = managerService.getWorkingTeacherList();
		
		HashMap<String, Object> dataMap= new HashMap<String, Object>();
		dataMap.put("managerId",lessonVO.getMngId());
		dataMap.put("startDate",lessonVO.getLessonStartDate());
		dataMap.put("endDate",lessonVO.getLessonEndDate());
		List<String> disabledScheduleList = lessonService.getManagerScheduleListByPeriodNotIncludeClassRoom(dataMap);
		
		
		mnv.addObject("ttMap", ttMap);
		mnv.addObject("lessonInfo", lessonVO);
		mnv.addObject("ScodeValues", ScodeValues);
		mnv.addObject("IncludeList", IncludeList);
		mnv.addObject("lessonTimeInfo", lessonTimeInfo);
		mnv.addObject("disabledScheduleInfo", disabledScheduleList.toString());
		mnv.addObject("teacherList", teacherList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping(value = "/manager/lesson/modify", method = RequestMethod.GET)
	public ModelAndView lessonmodify(Criteria cri,ModelAndView mnv,Authentication auth)throws Exception{
		
		String url = "/manager/lesson/modify";
		
		String userId = (String) auth.getPrincipal();
		Map<String,Object> searchInfoMap = new HashMap<String, Object>();
		List<LessonVO> lessonList = new ArrayList<LessonVO>();
		
		searchInfoMap.put("cri",cri);
		int authorityCount = authorityService.getAuthorityCountById(userId);
		
		if(authorityCount>8) {
			lessonList = lessonService.getLessonIntegratedSearchList(searchInfoMap);
		} else {
			searchInfoMap.put("userId",userId);
			lessonList = lessonService.getLessonIntegratedSearchList(searchInfoMap);
		}
//		cri.setPerPageNum(6);
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(lessonService.getLessonCount());
		
		
//		mnv.addObject("pageMaker", pageMaker);
		mnv.addObject("keyword",cri.getKeyword());
		mnv.addObject("lessonList", lessonList);
		mnv.setViewName(url);
		return mnv;
	}
//	
//	@RequestMapping("/manager/lesson/search")
//	@ResponseBody
//	public ResponseEntity<Map<String,Object>> lessonmodifySearchList(CriteriaCommand criCmd)throws Exception{
//		
//		ResponseEntity<Map<String,Object>> entity=null;
//		Map<String,Object> dataMap = new HashMap<String, Object>();
//		
//		Criteria cri =  criCmd.toCriteria();
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(lessonService.getLessonCount());
//		
//		
//		try {
//			List<LessonVO> lessonList = lessonService.getLessonIntegratedSearchList(cri);
//			dataMap.put("pageMaker", pageMaker);
//			dataMap.put("lessonList", lessonList);
//			
//			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
//		} catch (Exception e) {
//			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
//			e.printStackTrace();			
//		}
//		
//		return entity;
//	}
	
	@RequestMapping("/manager/lesson/listByClassRoom")
	public ModelAndView listByClassRoom(DayInfo dayInfo,ModelAndView mnv)throws Exception{
		String url = "/manager/lesson/listByClassRoom";
		
		System.err.println(dayInfo.toString());
		
		if(dayInfo.getMonday() == null) {
			String[] weekCalendar = dayInfo.weekCalendar("");
			dayInfo.setMonday(weekCalendar[0]);
			dayInfo.setTuesday(weekCalendar[1]);
			dayInfo.setWednesday(weekCalendar[2]);
			dayInfo.setThursday(weekCalendar[3]);
			dayInfo.setFriday(weekCalendar[4]);
			dayInfo.setSaturday(weekCalendar[5]);
			
			LocalDate now = LocalDate.now();
			int year = now.getYear();
			int dayOfYear = now.getDayOfYear();
			int week2 = (int) Math.ceil((dayOfYear-3)/7+1);
			String week = year+"-W"+week2;
			dayInfo.setWeek(week);
		}
		
		Map<String,Object> byDayMap = lessonService.getbyDayMap(dayInfo);
		List<LessonRoomVO> roomList = lessonService.getAllLessonRoomList();
		Map<String, List<TimeTableVO>> ttMap = timeTableService.getTimeTablevalue();
		
		mnv.addObject("ttMap", ttMap);
		mnv.addObject("byDayMap", byDayMap);
		mnv.addObject("roomList", roomList);
		mnv.addObject("dayInfo", dayInfo);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/lesson/myLessonList")
	public ModelAndView myLessonList(ModelAndView mnv,HttpServletRequest req,DayInfo dayInfo,String from)throws Exception{
		
		String url = "/member/lesson/myLessonList";
		
		String inStudentId = dayInfo.getInStudentId();
		
		HttpSession session = req.getSession();
		String category = (String)session.getAttribute("category");
		
		List<ConsultingVO> studentList = new ArrayList<ConsultingVO>();
		String studentId = "";
		if(inStudentId == null || inStudentId.equals("")) {
			if(category.equals("p")) {
				ParentVO loginUser = (ParentVO)session.getAttribute("loginUser");
				String parentId = loginUser.getId();
				studentList = consultingService.getStudent(parentId);
				studentId = studentList.get(0).getStudentId();
			}
			if(category.equals("s")) {
				StudentVO loginUser = (StudentVO)session.getAttribute("loginUser");
				studentId = loginUser.getId();
			}
		} else {
			if(category.equals("p")) {
				ParentVO loginUser = (ParentVO)session.getAttribute("loginUser");
				String parentId = loginUser.getId();
				studentList = consultingService.getStudent(parentId);
				studentId = inStudentId;
			}
			if(category.equals("s")) {
				studentId = inStudentId;
			}
		}
		
		if(dayInfo.getMonday() == null) {
			String[] weekCalendar = dayInfo.weekCalendar("");
			dayInfo.setMonday(weekCalendar[0]);
			dayInfo.setTuesday(weekCalendar[1]);
			dayInfo.setWednesday(weekCalendar[2]);
			dayInfo.setThursday(weekCalendar[3]);
			dayInfo.setFriday(weekCalendar[4]);
			dayInfo.setSaturday(weekCalendar[5]);
			
			LocalDate now = LocalDate.now();
			int year = now.getYear();
			int dayOfYear = now.getDayOfYear();
			int week2 = (int) Math.ceil((dayOfYear-3)/7+1);
			String week = year+"-W"+week2;
			dayInfo.setWeek(week);
		}
		
		Map<String,Object> byDayMap = lessonService.getbyDayUserMap(dayInfo,studentId);
		mnv.addObject("byDayMap", byDayMap);
		mnv.addObject("dayInfo", dayInfo);
		
		ClassVO classInfo = classService.getClassInfoByStudentId(studentId);
		mnv.addObject("classInfo", classInfo);
		
		Map<String, List<TimeTableVO>> ttMap = timeTableService.getTimeTablevalue();
		
		mnv.addObject("ttMap", ttMap);
		mnv.addObject("inStudentId",inStudentId);
		mnv.addObject("studentList", studentList);
		if(from != null) {
			mnv.addObject("from",from);
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/lesson/apply")
	public ModelAndView applyForm(ModelAndView mnv,String startDate,String endDate)throws Exception{
		String url = "/member/lesson/apply";
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if(startDate == null) {
			cal.add(Calendar.DATE, 1);
			startDate = df.format(cal.getTime());
		}
		if(endDate == null) {
			cal.add(Calendar.MONTH, 1);
			endDate = df.format(cal.getTime());
		}
		
		Map<String, List<TimeTableVO>> ttMap = timeTableService.getTimeTablevalue();
		mnv.addObject("ttMap", ttMap);
		mnv.addObject("startDate", startDate);
		mnv.addObject("endDate", endDate);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/lesson/timeListByPeriod")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getStudentScheduleListByPeriod(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		List<LessonVO> scheduleList = lessonService.getStudentScheduleListByPeriod(params);
		
		List<LessonVO> notIncludeLessonList = lessonService.getLessonListByPeriod(params);
		
		dataMap.put("scheduleList", scheduleList);
		dataMap.put("notIncludeLessonList", notIncludeLessonList);
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/member/lesson/cancellation")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> cancellationGo(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		int result = lessonService.cancellationGo(params);
		dataMap.put("result",result);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/member/lesson/lessonApply")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> lessonApply(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		int result = lessonService.lessonApplyGo(params);
		dataMap.put("result",result);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/lesson/viewSyllabus")
	public String viewSyllbus(HttpServletResponse response, String lessonAssignmentId)throws Exception{
		String url = "/manager/lesson/viewSyllabus";
		
		String pdfFileName;
		String systemLoginId = System.getProperty("user.name");
		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		try {
		 pdfFileName = lessonService.getSyllabusAddress(lessonAssignmentId);
		 pdfFileName = pdfFileName.replaceAll("zs0ad", systemLoginId);
		 System.out.println(pdfFileName);
		 File pdfFile = new File(pdfFileName);
		 
		 //클라이언트 브라우져에서 바로 보는 방법(헤더 변경)
		 response.setContentType("application/pdf");
		 //★ 이 구문이 있으면 [다운로드], 이 구문이 없다면 바로 target 지정된 곳에 view 해줍니다.
//		 response.addHeader("Content-Disposition", "attachment; filename="+pdfFile.getName()+".pdf");
		
		 //파일 읽고 쓰는 건 일반적인 Write방식이랑 동일합니다. 다만 reponse 출력 스트림 객체에 write.
		 fis = new FileInputStream(pdfFile);
		 int size = fis.available(); //지정 파일에서 읽을 수 있는 바이트 수를 반환
		 byte[] buf = new byte[size]; //버퍼설정
		 int readCount = fis.read(buf);
		
		 response.flushBuffer();
		 bos = new BufferedOutputStream(response.getOutputStream());
		 bos.write(buf, 0, readCount);
		 bos.flush();
		
		} catch(Exception e) {
		
		 e.printStackTrace();
		
		} finally {
		 try {
		  if (fis != null) fis.close(); //close는 꼭! 반드시!
		  if (bos != null) bos.close();
		 } catch (IOException e) {
		  e.printStackTrace();
		 }
		}
		return url;
	}
	
	@RequestMapping("/manager/lesson/registSyllabus")
	public ModelAndView registSyllabus(ModelAndView mnv,String lessonAssignmentId)throws Exception{
		String url = "/manager/lesson/registSyllabus";
		
		mnv.addObject("lessonAssignmentId",lessonAssignmentId);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/manager/lesson/registSyllabusToDataBase")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> registSyllabusToDataBase(@RequestBody HashMap<String, Object> params)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		System.out.println(params);
		int result = lessonService.registSyllabusToDataBase(params);
		dataMap.put("result",result);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/lesson/outmodify")
	public void outmodify()throws Exception{}
	

}
