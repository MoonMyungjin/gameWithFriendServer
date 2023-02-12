package com.lms.hexa.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;
import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.HomeworkRegistCommand;
import com.lms.hexa.command.HomeworkUserRegistCommand;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.HomeworkVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.AttachService;
import com.lms.hexa.service.AuthorityService;
import com.lms.hexa.service.HomeworkService;
import com.lms.hexa.service.LessonService;
import com.lms.hexa.util.GetAttachesByMultipartFileAdapter;

@Controller
public class HomeworkController {
	
	@Autowired
	private HomeworkService homeworkService;
	
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@RequestMapping("/manager/homework/list")
	public ModelAndView HWKlist(ModelAndView mnv,CriteriaCommand criCmd,Authentication auth)throws Exception{
		String url = "/manager/homework/list";

		Criteria cri = criCmd.toCriteria();
		String userId = (String) auth.getPrincipal();
		
		Map<String,Object> searchInfoMap = new HashMap<String, Object>();
		List<LessonVO> lessonList = new ArrayList<LessonVO>();
		searchInfoMap.put("cri",cri);
		
		int authorityCount = authorityService.getAuthorityCountById(userId);
		if(authorityCount>8) {
			lessonList = homeworkService.getLessonGoingIntegratedSearchList(cri);
		} else {
			searchInfoMap.put("userId",userId);
			lessonList = homeworkService.getLessonGoingIntegratedSearchList(cri);
		}
		
		mnv.addObject("cri",cri);
		mnv.addObject("lessonList", lessonList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/manager/homework/getIncludeStudentList")
	public ResponseEntity<Map<String,Object>> lessonIncludeMemberlist(String lessonAssignmentId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<StudentVO> includeList = lessonService.getIncludeStudentListByLessonAssignmentId(lessonAssignmentId);
		dataMap.put("includeList", includeList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@Resource(name = "homeworkUploadPath")
	public String homeworkUploadPath;
	
	@RequestMapping(value="/manager/homework/regist", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String regist(HomeworkRegistCommand homeworkRegCmd, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String url = "redirect:/manager/homework/list.do";
		// file 저장
		String savePath = this.homeworkUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(homeworkRegCmd.getUploadFile(), savePath);
		
		int attachGroupId = 0;
		
		if(homeworkRegCmd.getAttachGroupId()!=null) {
			attachGroupId = Integer.parseInt(homeworkRegCmd.getAttachGroupId());
		}
		
		int attachId = 0;
		// 사용자가 삭제한 첨부파일 삭제
		if (homeworkRegCmd.getDeleteFile() != null && homeworkRegCmd.getDeleteFile().length > 0) {
			for (String attachStr : homeworkRegCmd.getDeleteFile()) {
				System.out.println(attachStr);
				attachGroupId = Integer.parseInt(attachStr.split("&")[0]);
				attachId = Integer.parseInt(attachStr.split("&")[1]);
				
				AttachVO paramsAttachVO = new AttachVO();
				paramsAttachVO.setAttachGroupId(attachGroupId);
				paramsAttachVO.setAttachId(attachId);
				
				AttachVO attachVO = attachService.getAttachByAttachInfo(paramsAttachVO);
				
				File deleteFile = new File(attachVO.getAttachPath(), attachVO.getAttachName());
				
				if (deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
				
				attachService.removeAttachByAttachAttachInfo(paramsAttachVO); // DB 삭제
			}
		}
		
		
		// DB
		HomeworkVO homeworkVO = homeworkRegCmd.toHomeworkVO();
		String studentInfoStr = homeworkRegCmd.getStudentInfoStr().split("\\[")[1];
		studentInfoStr = studentInfoStr.replaceAll("\"","").replaceAll("\\]}","");
		String[] studentInfoArr = studentInfoStr.split(",");
		ArrayList<String> StudentIdlist = new ArrayList<String>(Arrays.asList(studentInfoArr));
		homeworkVO.setAttachList(attachList);
		homeworkVO.setHwkName(HTMLInputFilter.htmlSpecialChars(homeworkVO.getHwkName()));
		homeworkVO.setHwkContent(HTMLInputFilter.htmlSpecialChars(homeworkVO.getHwkContent()));
		homeworkService.regist(homeworkVO,StudentIdlist,attachGroupId,attachId);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping("/manager/homework/getHomeWorkList")
	public ResponseEntity<Map<String,Object>> getHomeWorkList(String lessonAssignmentId)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<HomeworkVO> howeworkList = homeworkService.getHomeWorkList(lessonAssignmentId);
		dataMap.put("howeworkList", howeworkList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/homework/getAttachfileList")
	public ResponseEntity<Map<String,Object>> getAttachfileList(String attachGroupId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<AttachVO> attachFileList = homeworkService.getAttachfileList(attachGroupId);
		dataMap.put("attachFileList", attachFileList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/homework/getHomeworkList")
	public ResponseEntity<Map<String,Object>> getLessonList(String lessonAssignmentId,String homeworkId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<StudentVO> givenHomeStudentList = homeworkService.getGivenHomeworkStudentList(homeworkId);
		dataMap.put("givenHomeStudentList", givenHomeStudentList);
		
		HomeworkVO homework = new HomeworkVO();
		homework.setHwkId(Integer.parseInt(homeworkId));
		homework.setLessonassignmentId(Integer.parseInt(lessonAssignmentId));
		List<StudentVO> notGivenHomeStudentList = homeworkService.getNotGivenHomeworkStudentList(homework);
		dataMap.put("notGivenHomeStudentList", notGivenHomeStudentList);
		
		List<HomeworkVO> givenHomeWorkList = homeworkService.getGivenHomeWorkList(homeworkId);
		dataMap.put("givenHomeWorkList", givenHomeWorkList);
		
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/homework/remove")
	public ResponseEntity<String> removeAttachfileList(String homeworkId)throws Exception{
		
		ResponseEntity<String> entity=null;
		
		homeworkService.removeHomeWork(homeworkId);
		
		entity  = new ResponseEntity<String>("ok",HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/member/homework/list")
	public ModelAndView memberHWKlist(ModelAndView mnv,Authentication auth)throws Exception{
		String url = "/member/homework/list";
		String login_id = (String) auth.getPrincipal();
		
		List<LessonVO> userLessonList = homeworkService.getUserLessonListByloginId(login_id);
		mnv.addObject("userLessonList", userLessonList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/manager/homework/userGetHomeWorkList")
	public ResponseEntity<Map<String,Object>> userGetHomeWorkList(String lessonAssignmentId,String userId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		HomeworkVO homeworkVO = new HomeworkVO();
		homeworkVO.setStudentId(userId);
		homeworkVO.setLessonassignmentId(Integer.parseInt(lessonAssignmentId));
		
		List<HomeworkVO> howeworkList = homeworkService.userGetHomeWorkList(homeworkVO);
		dataMap.put("howeworkList", howeworkList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping("/member/homework/registForm")
	public ModelAndView memberHWKRegist(ModelAndView mnv,String homeworkId,String userId,String btnName)throws Exception{
		String url = "/member/homework/registForm";
		
		HomeworkVO inHomeworkVO = new HomeworkVO();
		inHomeworkVO.setHwkId(Integer.parseInt(homeworkId));
		inHomeworkVO.setStudentId(userId);
		
		HomeworkVO homeworkVO = homeworkService.getUserHomeworkDetailByUserInfo(inHomeworkVO);
		mnv.addObject("homeworkVO",homeworkVO);
		mnv.addObject("btnName",btnName);
		
		List<AttachVO> attachFileList = homeworkService.getUserHomeworkAttachFileList(inHomeworkVO);
		mnv.addObject("attachFileList", attachFileList);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/member/homework/studentRegist", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String studentHomeworkRegist(HomeworkUserRegistCommand homeworkUserRegCmd, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String url = "redirect:/member/homework/success.do";
		// file 저장
		String savePath = this.homeworkUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(homeworkUserRegCmd.getUploadFile(), savePath);
		
		int attachGroupId = 0;
		int attachId = 0;
		// 사용자가 삭제한 첨부파일 삭제
		if (homeworkUserRegCmd.getDeleteFile() != null && homeworkUserRegCmd.getDeleteFile().length > 0) {
			for (String attachStr : homeworkUserRegCmd.getDeleteFile()) {
				System.out.println(attachStr);
				attachGroupId = Integer.parseInt(attachStr.split("&")[0]);
				attachId = Integer.parseInt(attachStr.split("&")[1]);
				
				AttachVO paramsAttachVO = new AttachVO();
				paramsAttachVO.setAttachGroupId(attachGroupId);
				paramsAttachVO.setAttachId(attachId);
				
				AttachVO attachVO = attachService.getAttachByAttachInfo(paramsAttachVO);
				
				File deleteFile = new File(attachVO.getAttachPath(), attachVO.getAttachName());
				
				if (deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
				
				attachService.removeAttachByAttachAttachInfo(paramsAttachVO); // DB 삭제
			}
		}
		
		
		// DB
		HomeworkVO homeworkVO = homeworkUserRegCmd.toHomeworkVO();
		homeworkVO.setAttachList(attachList);
		homeworkService.studentHomeworkRegist(homeworkVO,attachGroupId,attachId);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping("/manager/homework/getUserHomeWorkInfo")
	public ResponseEntity<Map<String,Object>> getUserHomeWorkInfo(String homeWorkId,String studentId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		HomeworkVO inHomeworkVO = new HomeworkVO();
		System.out.println(studentId);
		System.out.println(homeWorkId);
		
		inHomeworkVO.setStudentId(studentId);
		inHomeworkVO.setHwkId(Integer.parseInt(homeWorkId));
		
		HomeworkVO howeworkVO = homeworkService.getUserHomeworkDetailByUserInfo(inHomeworkVO);
		dataMap.put("howeworkVO", howeworkVO);
		
		List<AttachVO> attachFileList = homeworkService.getUserHomeworkAttachFileList(inHomeworkVO);
		dataMap.put("attachFileList", attachFileList);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/manager/homework/confirm")
	public ResponseEntity<Map<String,Object>> confirm(String homeWorkId,String studentId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		HomeworkVO inHomeworkVO = new HomeworkVO();
		inHomeworkVO.setStudentId(studentId);
		inHomeworkVO.setHwkId(Integer.parseInt(homeWorkId));
		
		homeworkService.finalConfirm(inHomeworkVO);
		
		dataMap.put("success", "success");
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/member/homework/success")
	public String popupForm() {
		String url = "member/homework/success";
		return url;
	}
}
