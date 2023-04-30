package base.admin.contoroller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import base.admin.service.AdminService;
import base.admin.vo.UserVO;


@Controller
public class AdminController {
	
	@Resource(name="AdminService")
	private AdminService adminService;
	
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.GET)
	public String adminLogin(HttpServletRequest request) throws Exception{
		
		return request.getRequestURI().replace(".do","");
	}
	
	@RequestMapping(value = "/admin/userList.do", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, Model model) throws Exception{
		
		List<UserVO> userList = adminService.getUserList();
		model.addAttribute("userList", userList);
		
		return "admin/list";
	}
}
