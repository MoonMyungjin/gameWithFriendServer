package com.lms.hexa.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.lms.hexa.command.ScoreRegistCommand;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.ChartVO;
import com.lms.hexa.dto.ExamVO;
import com.lms.hexa.dto.MarkVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.QuestionVO;
import com.lms.hexa.dto.ScoreVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.AttachService;
import com.lms.hexa.service.ManagerAttandanceService;
import com.lms.hexa.service.ScoreService;
import com.lms.hexa.service.StudentService;
import com.lms.hexa.util.GetAttachesByMultipartFileAdapter;

@Controller
public class ScoreController {
	
	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private ManagerAttandanceService service;
	
	
	@Resource(name = "scoreUploadPath")
	public String scoreUploadPath;
	
	@RequestMapping(value="/manager/score/fileRegist", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String fileRegist(ScoreRegistCommand score, HttpServletRequest req, RedirectAttributes rttr, Authentication auth) throws Exception{
		
		String url = "redirect:/manager/score/examMngm.do";
		
		String loginId = (String) auth.getPrincipal();
		
		int attachGroupId = 0;
		int attachId = 0;
		
		if(!score.getAttachGroupId().equals("")) {
			attachGroupId = Integer.parseInt(score.getAttachGroupId());
		}
		System.out.println("attachGroupId : " + attachGroupId);
		
		//file 저장
		String savePath = this.scoreUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(score.getUploadFile(), savePath);
		
			// 사용자가 삭제한 첨부파일 삭제
			if(score.getDeleteFile() != null && score.getDeleteFile().length > 0) {
				for(String attachStr : score.getDeleteFile()) {
					System.out.println(attachStr);
					
					attachGroupId = Integer.parseInt(attachStr.split("&")[0]);
					attachId = Integer.parseInt(attachStr.split("&")[1]);
					
					AttachVO paramsAttachVO = new AttachVO();
					paramsAttachVO.setAttachGroupId(attachGroupId);
					paramsAttachVO.setAttachId(attachId);
					
					AttachVO attachVO = attachService.getAttachByAttachInfo(paramsAttachVO);
					
					File deleteFile = new File(attachVO.getAttachPath(), attachVO.getAttachName());
					if(deleteFile.exists()) {
						deleteFile.delete();	// file 삭제
					}
					
					attachService.removeAttachByAttachAttachInfo(paramsAttachVO);
				}
			}
		
		
		
		
		
		//DB
		ScoreVO scoreVO = score.toScoreVO();
		scoreVO.setAttachList(attachList);
		scoreVO.setAttachGroupId(Integer.parseInt(score.getSubExamId()));
		scoreVO.setAttachWriter(loginId);
		
		
		scoreService.regist(scoreVO,attachGroupId);
		
		return url;
		
		
		
		
	}
	
	@RequestMapping("/manager/lesson/viewTestPaper")
	public String viewSyllbus(String attachName,String attachPath,HttpServletResponse response)throws Exception{
		String url = "/manager/lesson/viewSyllabus";
		
		String pdfFileName;
		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		try {
		 pdfFileName = attachPath +File.separator+ attachName;
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
	
	
	@RequestMapping("/manager/score/examMngm")
	public ModelAndView examManagement(HttpServletRequest request, ModelAndView mnv)throws Exception{
		String url = "manager/score/examMngm";
		
		List<ExamVO> examList = scoreService.getExamList();
		
		mnv.addObject("examList", examList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/manager/score/examSearch")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> examSearch(String value) throws Exception {
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
//		System.out.println(value);
		
		List<ExamVO> examList = scoreService.getSearchExamList(value);
		dataMap.put("examList", examList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/manager/score/studentSearch")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> studentSearch(String value) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
//		System.out.println(value);
		
		List<StudentVO> studentList = studentService.getSearchStudentList(value);
		dataMap.put("studentList", studentList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/manager/score/searchExam", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchExam(@RequestBody HashMap<String, Object> params) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		System.out.println("params : " + params);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ExamVO> exam = scoreService.searchExam(params);
		dataMap.put("exam", exam);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/manager/score/selectChart1", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> selectChart1(@RequestBody HashMap<String, Object> params) throws Exception { 
		ResponseEntity<Map<String, Object>> entity = null;
		
//		System.out.println(params);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ExamVO> chart1 = scoreService.selectChart1(params);
		dataMap.put("chart1", chart1);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/manager/score/selectChart2", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> selectChart2(@RequestBody HashMap<String, Object> params) throws Exception { 
		ResponseEntity<Map<String, Object>> entity = null;
		
		System.out.println(params);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ExamVO> chart2 = scoreService.selectChart2(params);
		dataMap.put("chart2", chart2);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/manager/score/selectChart3", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> selectChart3(@RequestBody HashMap<String, Object> params) throws Exception { 
		ResponseEntity<Map<String, Object>> entity = null;
		
		System.out.println("컨트롤러" + params);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
	
		ChartVO chart3 = scoreService.selectChart3(params);
		dataMap.put("chart3",chart3);
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/manager/score/selectChart4", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> selectChart4(@RequestBody HashMap<String, Object> params) throws Exception { 
		ResponseEntity<Map<String, Object>> entity = null;
		
		System.out.println("컨트롤러 : " + params);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
	
		List<ExamVO> chart4 = scoreService.selectChart4(params);
		dataMap.put("chart4",chart4);
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping("/manager/score/examMark")
	public ModelAndView examMark(HttpServletRequest request, ModelAndView mnv)throws Exception{
		String url = "manager/score/examMark";
		
		List<ExamVO> examList = scoreService.getExamList();
		List<StudentVO> studentList = studentService.getStudentClassInfoList();
		
		mnv.addObject("examList", examList);
		mnv.addObject("studentList", studentList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/manager/score/gradeCheck")
	public ModelAndView managerGradeCheck(ModelAndView mnv)throws Exception{
		String url = "manager/score/gradeCheck";
		
		List<StudentVO> studentList = studentService.getStudentClassInfoList();
		
		mnv.addObject("studentList", studentList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/manager/score/examCheckByStudent", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> examCheckByStudent(String studentId) throws Exception {
		ResponseEntity<Map<String, Object>> entity=null;
//		System.out.println("컨트롤러 : " + studentId);
		
		Map<String, Object> examByStudent = scoreService.getExamByStudent(studentId);
		
		System.out.println(examByStudent);
		
		entity  = new ResponseEntity<Map<String, Object>>(examByStudent,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/manager/score/overall")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> overall(@RequestBody HashMap<String, Object> params) throws Exception {
		ResponseEntity<Map<String, Object>> entity=null;
		
		System.out.println("컨트롤러" + params);
		
		Map<String, Object> overallScore = scoreService.getOverallScore(params);
		
		
		entity  = new ResponseEntity<Map<String, Object>>(overallScore,HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping("/manager/score/feedback")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> feedback(@RequestBody HashMap<String, Object> params) throws Exception {
		ResponseEntity<Map<String, Object>> entity=null;
		
		System.out.println("피드백 param : " + params);
		
		Map<String, Object> feedback = scoreService.getFeedBack(params);
		
		System.out.println(feedback);
		
		entity  = new ResponseEntity<Map<String, Object>>(feedback,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/manager/score/saveFeedback", method = RequestMethod.POST, consumes="application/json")
	public ResponseEntity<Map<String, Object>> saveFeedback(@RequestBody HashMap<String, Object> params) throws Exception {
		
		ResponseEntity<Map<String, Object>>  entity=null;
		System.out.println("피드백 정보 : " + params);
		
		int result = scoreService.insertFeedback(params);
		
		if(result>0) {
			entity  = new ResponseEntity<Map<String, Object>> (HttpStatus.OK);
		}
		return entity;
	}
	
	
	@RequestMapping("/manager/score/gradeDetail")
	public void managerGradeDetail()throws Exception{}
	
	@RequestMapping("/manager/score/gradeFeedback")
	public void managerGradeFeedback()throws Exception{}
	
	@RequestMapping("/member/score/gradeCheck")
	public ModelAndView memberGradeCheck(ModelAndView mnv, Authentication auth,HttpServletRequest req,String childId)throws Exception{
		String url = "member/score/gradeCheck";
		
		
		
		
		String studentId = "";
		String name = "";
		Map<String, Object> dataMap = new HashMap<>();
		HttpSession session = req.getSession();
		List<StudentVO> selectChildList = new ArrayList<>();
		
		String cate = (String) session.getAttribute("category");
	
		if(cate.equals("s")){
			StudentVO student = (StudentVO) session.getAttribute("loginUser");
			studentId = student.getId();
		}else if(cate.equals("p")){
			ParentVO parent = (ParentVO) session.getAttribute("loginUser");
			 String id2 = parent.getId();
			 selectChildList = service.selectChildList(id2);
			 StudentVO studentVO = selectChildList.get(0);
			 studentId = studentVO.getId();
			 name = studentVO.getName();
			 
		}
		dataMap.put("name2", name);
		if(childId != null) {
			studentId = childId;
			StudentVO student = studentService.getStudent(studentId);
			String name2 = student.getName();
			dataMap.put("studentId", studentId);
			dataMap.put("name2", name2);
		}
		
		
		dataMap.put("cate", cate);
		dataMap.put("selectChildList", selectChildList);
		
		
		Map<String, Object> examList = scoreService.getExamByStudent(studentId);
		System.out.println(examList);
		mnv.addObject("examList", examList);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/score/gradeDetail")
	public void memberGradeDetail()throws Exception{}
	
	@RequestMapping("/member/score/gradeFeedback")
	public void memberGradeFeedback()throws Exception{
		
		
	}
	
	@RequestMapping(value = "/manager/score/examRegist", method = RequestMethod.POST)
	public String regist(ExamVO exam) throws Exception, IOException { // 시험 등록
		String url = "manager/score/regist_success";

		scoreService.examRegist(exam);

		return url;
	}
	
	@RequestMapping("/manager/score/questionList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> subMenuToJSON(int examId) {
		
		ResponseEntity<Map<String, Object>> entity=null;
	
		List<QuestionVO> questionList = null;
		List<QuestionVO> quesAreaList = null;

		try {
			questionList = scoreService.getQuestionList(examId);
			quesAreaList = scoreService.getQuesAreaList(examId);
			
			Map<String, Object> questionMap = new HashMap<String, Object>();
			
			questionMap.put("questionList", questionList);
			questionMap.put("quesAreaList", quesAreaList);
		
			entity  = new ResponseEntity<Map<String, Object>>(questionMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/manager/score/attachList")
	public ResponseEntity<Map<String, Object>> attachList(int examId) throws Exception{
		ResponseEntity<Map<String, Object>> entity=null;
		
		System.out.println(examId);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<AttachVO> attachList = scoreService.getAttachList(examId);
		System.out.println("컨트롤ㄹ러 : " + attachList);
		dataMap.put("attachList", attachList);
		
		entity  = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/manager/score/markList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> markList(int examId, String studentId) {
		
		ResponseEntity<Map<String, Object>> entity=null;
		
		MarkVO mark = new MarkVO();
		mark.setExamId(examId);
		mark.setStudentId(studentId);
		
	
		List<MarkVO> markList = null;
		ScoreVO result = null;
		
		Map<String, Object> markMap = new HashMap<String, Object>();

		try {
			markList = scoreService.getMarkList(mark);
			result = scoreService.getScore(mark);
			
			markMap.put("markList", markList);
			markMap.put("result", result);
			
		
			entity  = new ResponseEntity<Map<String, Object>>(markMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/manager/score/markingList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> markingList(int examId) {
		
		ResponseEntity<Map<String, Object>> entity=null;
		
		List<QuestionVO> markingList = null;
		try {
			markingList = scoreService.getQuestionList(examId);
			
			Map<String, Object> markingMap = new HashMap<String, Object>();
			
			markingMap.put("markingList", markingList);
		
			entity  = new ResponseEntity<Map<String, Object>>(markingMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping(value = "/manager/score/updateQuestion", method = RequestMethod.POST, consumes = "application/json")
	public String updateQuestion(@RequestBody HashMap<String, Object> params) {
		String url = "redirect:/manager/score/examMngm.do";
		System.out.println("컨트롤러 : " + params);
		try {
			scoreService.questionUpdate(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping(value = "/manager/score/updateMark", method = RequestMethod.POST, consumes = "application/json")
	public String updateMark(@RequestBody HashMap<String, Object> params) {
		String url = "redirect:/manager/score/examMark.do";
		try {
			scoreService.markUpdate(params);
			scoreService.scoreUpdate(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping(value = "/manager/score/updateScore", method = RequestMethod.POST, consumes = "application/json")
	public String updateScore(@RequestBody HashMap<String, Object> params) {
		String url = "redirect:/manager/score/examMark.do";
		try {
			scoreService.scoreUpdate(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping("/manager/score/examDetail")
	public ModelAndView examDetail(int examId, ModelAndView mnv)throws Exception{
		String url = "/manager/score/examDetail";
		
		ExamVO exam = scoreService.getExam(examId);
		
		List<StudentVO> scoredStudentList = studentService.getStudentScoreInfoList(examId);
		
		mnv.addObject("scoredStudentList", scoredStudentList);
		mnv.addObject("exam", exam);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/manager/score/saveExam", method = RequestMethod.POST)
	public String saveExam(int examId, String examDate, String examName, HttpServletRequest request) throws Exception {
		String url = "/manager/score/save_success";
		
		ExamVO modifyExam = new ExamVO();
		modifyExam.setExamId(examId);
		modifyExam.setExamDate(examDate);
		modifyExam.setExamName(examName);
		
		scoreService.modifyExam(modifyExam);
		
		request.setAttribute("examId", examId);
		
		return url;
	}
	
	
	
	
}
