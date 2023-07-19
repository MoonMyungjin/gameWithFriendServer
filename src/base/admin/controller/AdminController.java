package base.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import base.admin.option.service.OptionService;
import base.admin.service.AdminService;
import base.admin.vo.UserVO;


@Controller
public class AdminController {
	
	@Resource(name="AdminService")
	private AdminService adminService;
	
	@Resource(name="OptionService")
	private OptionService optionService;
	
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.GET)
	public String adminLogin(HttpServletRequest request) throws Exception{
		
		return request.getRequestURI().replace(".do","");
	}
	
	@RequestMapping(value = "/admin/userList.do", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, Model model, @RequestParam Map<String,Object> params) throws Exception{
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("CD_DTL_PARENT_ID","106");
		List<HashMap<String, String>> stateList = optionService.selectOptionList(searchMap);
		model.addAttribute("stateList", stateList);
		
		searchMap.put("CD_DTL_PARENT_ID","107");
		List<HashMap<String, String>> typeList = optionService.selectOptionList(searchMap);
		model.addAttribute("typeList", typeList);
		
		List<UserVO> userList = adminService.getUserList(params);
		model.addAttribute("userList", userList);
		model.addAttribute("params", params);
		
		return "admin/list";
	}
	
	@RequestMapping(value="/admin/userUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String userUpdate(@RequestParam Map<String,Object> params) throws Exception{
		String result = "";
		try {
			adminService.userUpdate(params);
		} catch (Exception e) {
			result = e.toString();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/admin/selectApiKey.do", method = RequestMethod.GET)
	public String selectApiKey(HttpServletRequest request, Model model) throws Exception{
		
		String selectApiKey = adminService.selectApiKey();
		return selectApiKey;
	}
}
