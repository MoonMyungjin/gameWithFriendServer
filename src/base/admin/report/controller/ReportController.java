package base.admin.report.controller;

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
import org.springframework.web.multipart.MultipartFile;

import base.admin.report.service.ReportService;
import common.util.FileManageUtil;
import common.vo.FileVO;
import util.CustomMap;


@Controller
public class ReportController {
	
	@Resource(name="ReportService")
	private ReportService reportService;

	@RequestMapping(value = "/admin/report/list.do", method = RequestMethod.GET)
	public String ReportList(HttpServletRequest request,Model model,@RequestParam Map<String,String> searchMap) throws Exception{
		
		List<CustomMap> reportList = reportService.selectReportList(searchMap);
		model.addAttribute("reportList", reportList);
		
		model.addAttribute("searchMap", searchMap);
		
		return "/admin/report/list";
	}
	
}
