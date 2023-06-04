package base.admin.option.controller;

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

import base.admin.champion.service.ChampionService;
import base.admin.option.service.OptionService;
import common.util.FileManageUtil;
import common.vo.FileVO;


@Controller
public class OptionController {
	
	@Resource(name="OptionService")
	private OptionService optionService;

	private final String FILE_PATH = "option";
	
	
	@RequestMapping(value = "/admin/option/list.do", method = RequestMethod.GET)
	public String optionList(HttpServletRequest request,Model model,@RequestParam Map<String,String> searchMap) throws Exception{
		
		searchMap.put("CD_DTL_PARENT_ID", "101");
		List<HashMap<String,String>> selectOptionList = optionService.selectOptionList(searchMap);
		model.addAttribute("selectOptionList", selectOptionList);
		model.addAttribute("searchMap", searchMap);

		
		return "/admin/option/list";
	}
	

}
