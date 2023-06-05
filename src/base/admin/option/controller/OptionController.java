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
		String optionIndex = "";
		if(searchMap.get("CD_DTL_ID") == null || searchMap.get("CD_DTL_ID").equals("")) {
			optionIndex = String.valueOf(selectOptionList.get(0).get("CD_DTL_ID"));
		} else {
			optionIndex = String.valueOf(searchMap.get("CD_DTL_ID"));
		}
		HashMap<String,Object> selectedOption = optionService.selectOption(optionIndex);
		model.addAttribute("selectedOption", selectedOption);
		model.addAttribute("searchMap", searchMap);
		
		Map<String,String> optionMap = (Map<String, String>) selectedOption.get("option");
		String underOptionIndex = optionMap.get("CD_DTL_NAME");
		List<HashMap<String,String>> selectOptionUnderList = optionService.selectOptionUnderList(underOptionIndex);
		model.addAttribute("selectOptionUnderList", selectOptionUnderList);
		String optionUnderIndex = "";
		if(searchMap.get("CD_DTL_ID_UNDER") == null || searchMap.get("CD_DTL_ID_UNDER").equals("")) {
			optionUnderIndex = String.valueOf(selectOptionUnderList.get(0).get("CD_DTL_ID"));
		} else {
			optionUnderIndex = String.valueOf(searchMap.get("CD_DTL_ID_UNDER"));
		}
		HashMap<String,Object> selectedUnderOption = optionService.selectOption(optionUnderIndex);
		model.addAttribute("selectedUnderOption", selectedUnderOption);
		return "/admin/option/list";
	}
	
	@RequestMapping(value="/admin/option/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public String saveOption(@RequestParam Map<String,Object> params
		,@RequestParam("file") MultipartFile[] files
			) throws Exception {
		
		String result = "";
		
		try {
			List<FileVO> saveFiles = null;
			
			if(files.length > 0) {
				for (MultipartFile multiFile : files) {
					if(multiFile.getSize() > 0) {
						saveFiles = FileManageUtil.saveFiles(files,FILE_PATH);
					}
				}
			}
			
			optionService.saveOption(params, saveFiles);
			
		} catch (Exception e) {
			result = e.toString();
		}
		return result;
	}
	
	
	@RequestMapping(value="/admin/option/insertUnder.do", method = RequestMethod.POST)
	@ResponseBody
	public String saveOptionUnder(@RequestParam Map<String,Object> params
		,@RequestParam("file") MultipartFile[] files
			) throws Exception {
		
		String result = "";
		
		try {
			List<FileVO> saveFiles = null;
			
			if(files.length > 0) {
				for (MultipartFile multiFile : files) {
					if(multiFile.getSize() > 0) {
						saveFiles = FileManageUtil.saveFiles(files,FILE_PATH);
					}
				}
			}
			
			optionService.saveOptionUnder(params, saveFiles);
			
		} catch (Exception e) {
			result = e.toString();
		}
		return result;
	}
	

}
