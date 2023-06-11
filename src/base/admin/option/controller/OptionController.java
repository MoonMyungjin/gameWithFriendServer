package base.admin.option.controller;

import java.util.ArrayList;
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
		
		//최상위 옵션 셀렉트박스 리스트 
		List<HashMap<String,String>> selectMegaOptionList = optionService.selectMegaOptionList("게임매칭 옵션 목록");
		model.addAttribute("selectMegaOptionList", selectMegaOptionList);				
		
		//상위 옵션
		if(searchMap.get("CD_DTL_PARENT_ID") == null || searchMap.get("CD_DTL_PARENT_ID").equals("")) {
			searchMap.put("CD_DTL_PARENT_ID", "101");
		}	
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
		
		//하위 옵션
		Map<String,String> optionMap = (Map<String, String>) selectedOption.get("option");
		String underOptionIndex = optionMap.get("CD_DTL_NAME");
		List<HashMap<String,String>> selectOptionUnderList = optionService.selectOptionUnderList(underOptionIndex);
		model.addAttribute("selectOptionUnderList", selectOptionUnderList);
		String optionUnderIndex = "";
		if(searchMap.get("CD_DTL_ID_UNDER") == null || searchMap.get("CD_DTL_ID_UNDER").equals("")) {
			if(selectOptionUnderList.size() == 0) {
				
			}else {
				optionUnderIndex = String.valueOf(selectOptionUnderList.get(0).get("CD_DTL_ID"));
			}
		} else {
			optionUnderIndex = String.valueOf(searchMap.get("CD_DTL_ID_UNDER"));
		}
		HashMap<String,Object> selectedUnderOption = optionService.selectOption(optionUnderIndex);
		model.addAttribute("selectedUnderOption", selectedUnderOption);
		List<HashMap<String,String>> selectUnderUnderOptionList = new ArrayList<>();
		if(searchMap.get("CD_DTL_ID_UNDER") == null) {
			searchMap.put("CD_DTL_ID_UNDER", optionUnderIndex);
			selectUnderUnderOptionList = optionService.selectUnderUnderOptionList(searchMap);	
		}else {	
			selectUnderUnderOptionList = optionService.selectUnderUnderOptionList(searchMap);
		}
		
		//최하위 옵션
		model.addAttribute("selectUnderUnderOptionList", selectUnderUnderOptionList);
		String optionUnderUnderIndex = "";
		if(searchMap.get("CD_DTL_ID_UNDER_UNDER") == null || searchMap.get("CD_DTL_ID_UNDER_UNDER").equals("")) {
			if(selectUnderUnderOptionList.size() !=0 ) {
				optionUnderUnderIndex = String.valueOf(selectUnderUnderOptionList.get(0).get("CD_DTL_ID"));
			}
		} else {
			optionUnderUnderIndex = String.valueOf(searchMap.get("CD_DTL_ID_UNDER_UNDER"));
		}
		HashMap<String, Object> selectUnderUnderOption = optionService.selectUnderUnderOption(optionUnderUnderIndex);
		model.addAttribute("selectUnderUnderOption", selectUnderUnderOption);
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
		,@RequestParam("fileUnder") MultipartFile[] files
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
	
	@RequestMapping(value="/admin/option/insertUnderUnder.do", method = RequestMethod.POST)
	@ResponseBody
	public String saveOptionUnderUnder(@RequestParam Map<String,Object> params
		,@RequestParam("fileUnderUnder") MultipartFile[] files
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
			
			optionService.saveOptionUnderUnder(params, saveFiles);
			
		} catch (Exception e) {
			result = e.toString();
		}
		return result;
	}
	
	
	@RequestMapping(value="/admin/option/findUnderKey.do", method = RequestMethod.POST)
	@ResponseBody
	public String findUnderKey(@RequestParam(required = true) String upperKey
			) throws Exception {
		
		String selectOptionUnderKey = "";
		
		try {

		selectOptionUnderKey = optionService.selectOptionUnderKey(upperKey);
			
		} catch (Exception e) {
			
		}
		return selectOptionUnderKey;
	}
	

}
