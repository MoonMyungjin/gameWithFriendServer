package com.lms.hexa.controller;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lms.hexa.command.ChangeGoWorkStatusCommand;
import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.ManagerRegistCommand;
import com.lms.hexa.dto.GoWorkVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.MenuVO;
import com.lms.hexa.service.GoWorkService;
import com.lms.hexa.service.ManagerService;
import com.lms.hexa.service.MenuService;
import com.lms.hexa.service.UserService;
import com.lms.hexa.util.MakeFileName;

@Controller
@RequestMapping("/manager/managermanagement")
public class ManagerManagerManagementController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="managerService")
	private ManagerService managerService;
	
	@Autowired
	private MenuService menuService;
	
	@Resource(name="goWorkService")
	private GoWorkService goWorkService;
	
	
	@RequestMapping("/attandance/list")
	public ModelAndView attandanceList(GoWorkVO work, CriteriaCommand criCmd, ModelAndView mnv) throws Exception {
		String url = "manager/managermanagement/attandance/list";
		
		Criteria cri = criCmd.toCriteria();
		
		Map<String, Object> dataMap = managerService.getManagerList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping("/attandance/registDayWorkList")
	public String registDayWorkList() throws Exception{
		String url = "manager/managermanagement/attandance/list";
		goWorkService.insertDayGoWorkList();
		return url;
	}
	
	@RequestMapping("/attandance/updateGoWorkTime")
	public String updateGoWorkTime(String id) throws Exception {
		String url = "manager_home";
		goWorkService.updateGoWorkTime(id);
		return url;
	}
	
	@RequestMapping("/attandance/updateGoWorkOutTime")
	public String updateGoWorkOutTime(String id) throws Exception {
		String url = "manager_home";
		GoWorkVO workStatus = null; 
		workStatus = goWorkService.selectTodayWorkStatusById(id);
		goWorkService.updateGoWorkOutTime(id);
		String goWorkTime = workStatus.getGoWorkTime();
		
		String startTime = workStatus.getGoWorkStartTime();
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		DateTimeFormatter dateFormat2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

		LocalDateTime date1 = LocalDateTime.parse(goWorkTime, dateFormat);
		LocalDateTime date2 = LocalDateTime.parse(startTime, dateFormat2);
		//System.out.println("뭐가 나올까? " + date2);
		
		boolean beforeStart = date1.isBefore(date2);
		
		if(beforeStart) {
			goWorkService.updateGoWorkTotalTime(id);
		} else {
			goWorkService.updateGoWorkTotalTimeLate(id);
		}
		
		int totalWorkTime = Integer.parseInt(workStatus.getGoWorkTotalTime());
		if(totalWorkTime > 540) {
			goWorkService.updateGoWorkYes(id);
		}
		
		return url;
	}
	
	@RequestMapping("/attandance/changeGoWorkStatus")
	public String changeGoWorkStatus(ChangeGoWorkStatusCommand cmd) throws Exception {
		String url ="manager/managermanagement/attandance/list";
		
		GoWorkVO work = cmd.toGoWorkVO();
		goWorkService.changeGoWorkStatus(work);
		return url;
	}
	
	@RequestMapping("/attandance/changeGoWorkReason")
	public String changeGoWorkReason(ChangeGoWorkStatusCommand cmd) throws Exception {
		String url ="manager/managermanagement/attandance/list";

		GoWorkVO work = cmd.toGoWorkVO();
		goWorkService.changeGoWorkReason(work);
		return url;
	}
	
	@RequestMapping("/attandance/changeGoWorkOutStatus")
	public String changeGoWorkOutStatus(ChangeGoWorkStatusCommand cmd) throws Exception {
		String url ="manager/managermanagement/attandance/list";

		GoWorkVO work = cmd.toGoWorkVO();
		goWorkService.changeGoWorkOutStatus(work);
		return url;
	}
	
	@RequestMapping("/attandance/workListSelectDay")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> workListSelectDay(String goWorkDate)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> workListDataMap = new HashMap<String, Object>();
		List<GoWorkVO> workListDay = goWorkService.selectGoWorkListBySelectDay(goWorkDate);
		
		try {
			workListDataMap.put("workListDay", workListDay);
			
			entity  = new ResponseEntity<Map<String,Object>>(workListDataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/attandance/workListById")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> workListById(GoWorkVO work, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> workListDataMap = new HashMap<String, Object>();
		List<GoWorkVO> workListById = goWorkService.selectGoWorkListBySelectMonthAndId(work);
		
		try {
			workListDataMap.put("workListById", workListById);
			
			entity  = new ResponseEntity<Map<String,Object>>(workListDataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
	@RequestMapping("/managermanagement/list")
	public ModelAndView managerList(CriteriaCommand criCmd, ModelAndView mnv) throws Exception {
		String url = "manager/managermanagement/managermanagement/list";
		
		Criteria cri = criCmd.toCriteria();
		
		Map<String, Object> dataMap = managerService.getManagerList(cri);
		
		List<MenuVO> menuList = menuService.getManagerMenuList();			
		
		mnv.addObject("menuList", menuList);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/managermanagement/regist")
	public String regist(ManagerRegistCommand managerReq) throws Exception {
		String url = "/manager/managermanagement/managermanagement/regist_success";
		
		ManagerVO manager = managerReq.toManagerVO();
		
		managerService.insertManager(manager);
		
		return url;
	}
	
	@RequestMapping("/managermanagement/detail")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> managerDetail(String id, ModelAndView mnv)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
		Map<String,Object> managerDataMap = new HashMap<String, Object>();
		
		ManagerVO manager = null; 
		ManagerVO manager1 = null;
		
		List<MenuVO> menuList = menuService.selectManagerNotAuthorityMenuList(id);
		List<MenuVO> menuList1 = menuService.selectManagerAuthorityMenuList(id);
		
		manager = managerService.getManager(id);
		manager1 = managerService.getManager(id);
		
		/*
		 * String originalFileName =
		 * MakeFileName.parseFileNameFromUUID(manager1.getMngPicture(), "\\$\\$");
		 * manager1.setMngPicture(originalFileName);
		 */
		
		try {
			managerDataMap.put("manager", manager);
			managerDataMap.put("manager1", manager1);
			managerDataMap.put("notAuthorityMenuList", menuList);
			managerDataMap.put("AuthorityMenuList", menuList1);
			
			entity  = new ResponseEntity<Map<String,Object>>(managerDataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();			
		}

		return entity;
	}
	
}
