package com.lms.hexa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
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

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.dto.MessageGroupVO;
import com.lms.hexa.dto.TemplateVO;
import com.lms.hexa.service.KakaoSendService;
import com.lms.hexa.service.ManagerService;
import com.lms.hexa.service.MessageGroupService;
import com.lms.hexa.service.ParentService;
import com.lms.hexa.service.StudentService;
import com.lms.hexa.service.TemplateService;
import com.lms.hexa.service.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/manager/academymanagement")
public class AcademyManagementController {
	
	@Autowired
	private StudentService studentService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="parentService")
	private ParentService parentService;
	
	@Resource(name="managerService")
	private ManagerService managerService;
	
	@Resource(name="messageGroupService")
	private MessageGroupService messageGroupService;
	
	@Resource(name="templateService")
	private TemplateService templateService;
	
	@Resource(name="kakaoSendService")
	private KakaoSendService kakaoSendService;
	
	@RequestMapping("/kakao/regist")
	public void regist()throws Exception{
	}
	
	@RequestMapping("/message/userSearchList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getUserSearchList(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		Criteria cri =  criCmd.toCriteria();
		cri.setPerPageNum(300);
		try {
			dataMap = userService.getUserList(cri);	
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/message/managerSearchList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getManagerSearchList(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap1 = new HashMap<String, Object>();
		
		Criteria cri =  criCmd.toCriteria();
		cri.setPerPageNum(300);
		try {
			dataMap1 =  managerService.getManagerList(cri);	
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap1,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/message/studentSearchList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getStudentSearchList(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap2 = new HashMap<String, Object>();
		
		Criteria cri =  criCmd.toCriteria();
		cri.setPerPageNum(300);
		try {
			dataMap2 =  studentService.getStudentList(cri);	
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap2,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/message/parentSearchList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getParentSearchList(CriteriaCommand criCmd, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> dataMap3 = new HashMap<String, Object>();
		
		Criteria cri =  criCmd.toCriteria();
		cri.setPerPageNum(300);
		try {
			dataMap3 =  parentService.selectParentList(cri);	
			
			entity  = new ResponseEntity<Map<String,Object>>(dataMap3,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping(value = "/messageGroup/regist", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void registMessageGroup(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr) throws Exception{
		int result = messageGroupService.registMessageGroup(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
			rttr.addFlashAttribute("msg", "ng");
		}
	
	@RequestMapping(value = "/messageGroup/delete", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void deleteMessageGroup(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr) throws Exception{
		messageGroupService.deleteOldMessageGroup(params);
	}
	
	
	@RequestMapping("/messageGroup/list")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> messeageGroupList()throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		List<MessageGroupVO> groupNameList = new ArrayList<MessageGroupVO>();
		groupNameList =  messageGroupService.selectMessageGroupList();	
		
		try {
			dataMap.put("groupNameList",groupNameList);
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	@RequestMapping("/messageGroup/detail")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> messeageGroupDetail(String messageGroupName)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<MessageGroupVO> groupNameDetail = new ArrayList<MessageGroupVO>();
		groupNameDetail =  messageGroupService.getMessageGroupByGroupName(messageGroupName);	
		
		try {
			dataMap.put("groupNameDetail",groupNameDetail);
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	// 그룹 Name 중복체크
	@RequestMapping("messageGroup/groupNameCheck")
	@ResponseBody
	public ResponseEntity<String> GroupNameCheck(String messageGroupName) throws Exception {
		
		ResponseEntity<String> entity = null;
			
		MessageGroupVO messageGroupNameCheck = messageGroupService.getMessageGroupName(messageGroupName);
			if (messageGroupNameCheck != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		
		return entity;
	}
	
	// template insert
	@RequestMapping(value = "/template/regist", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void registTemplate(@RequestBody TemplateVO template,RedirectAttributes rttr) throws Exception{
		int result = templateService.registTemplate(template);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
			rttr.addFlashAttribute("msg", "ng");
		}
	
	@RequestMapping(value = "/template/update", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void updateTemplate(@RequestBody TemplateVO template,RedirectAttributes rttr) throws Exception{
		templateService.updateTemplate(template);
	}
	
	@RequestMapping(value = "/template/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deleteTemplate(String templateId) throws Exception{
		templateService.deleteTemplate(templateId);
	}
	
	@RequestMapping("/template/detail")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> templateDetail(String templateId)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		TemplateVO templateDetail = new TemplateVO();
		templateDetail =  templateService.getTemplateByTemplateName(templateId);	
		
		try {
			dataMap.put("templateDetail",templateDetail);
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	@RequestMapping("/template/list")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> templateList()throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		List<TemplateVO> templateList = new ArrayList<TemplateVO>();
		templateList =  templateService.getTemplateList();	
		
		try {
			dataMap.put("templateList",templateList);
			entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}
		
		return entity;
	}
	
	@RequestMapping("template/templateListCheck")
	@ResponseBody
	public ResponseEntity<String> templateListCheck(String templateName) throws Exception {
		
		ResponseEntity<String> entity = null;
			
		TemplateVO templateNameCheck = templateService.getTemplateListCheck(templateName);
			if (templateNameCheck != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		
		return entity;
	}
	
	@RequestMapping(value = "/message/send", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void sendMessage(@RequestBody HashMap<String, Object> param,RedirectAttributes rttr) throws Exception{
		JSONObject test = new JSONObject(param);
		List<LinkedHashMap<String, String>> messageGroup = (List<LinkedHashMap<String, String>>) test.get("messageGroupList");
		List<String> sendListHp = new ArrayList<String>(); 
		String hp = null;
		String text = (String) test.get("kakaoSendContent");
		
		for(int i=0; i<messageGroup.size(); i++) {
			LinkedHashMap<String, String> sendList = new LinkedHashMap<String, String>(messageGroup.get(i));
			hp = sendList.get("kakaoReceiverHp");
			sendListHp.add(hp);
		}
		
		System.out.println(sendListHp);
		//System.out.println(param);
		//System.out.println(messageGroup);
		System.out.println(text);
		
		for(int i = 0; i<sendListHp.size(); i++) {
			String api_key = "NCSJCY9X6YGZTIHQ";
		    String api_secret = "NKBPT5QKEEEVGBGAMMH7XVK5672OGDXZ";
		    Message coolsms = new Message(api_key, api_secret);
	
		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to",  sendListHp.get(i));	// 수신전화번호
		    params.put("from", "01022598908");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", text);
		    params.put("app_version", "test app 2.2"); // application name and version
	
		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		}
		
		}
	
	@RequestMapping(value = "/message/alarmSend", method = RequestMethod.POST)
	@ResponseBody
	public void sendAlarmMessage(String parentHp, String studentName) throws Exception{
		
			String api_key = "NCSJCY9X6YGZTIHQ";
		    String api_secret = "NKBPT5QKEEEVGBGAMMH7XVK5672OGDXZ";
		    Message coolsms = new Message(api_key, api_secret);
	
		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to",  parentHp);	// 수신전화번호
		    params.put("from", "01022598908");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", "안녕하세요 HEXA학원입니다. 귀하의 자녀 " +studentName+" 학생이 등원을 완료하였습니다 ^^" );
		    params.put("app_version", "test app 2.2"); // application name and version
	
		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		
		}
	
	@RequestMapping(value = "/kakaoSendList/regist", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void registKakaoSendList(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr) throws Exception{
		int result = kakaoSendService.registKakaoSendList(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
			rttr.addFlashAttribute("msg", "ng");
		}
	


}
