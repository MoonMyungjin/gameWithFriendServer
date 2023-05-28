package base.admin.champion.controller;

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
import common.util.FileManageUtil;
import common.vo.FileVO;


@Controller
public class ChampionController {
	
	@Resource(name="ChampionService")
	private ChampionService championService;

	private final String FILE_PATH = "champ";
	
	
	@RequestMapping(value = "/admin/champion/list.do", method = RequestMethod.GET)
	public String championList(HttpServletRequest request,Model model,@RequestParam Map<String,String> searchMap) throws Exception{
		
		List<HashMap<String,String>> championList = championService.selectChampionList(searchMap);
		model.addAttribute("championList", championList);
		String champIndex = "";
		
		if(searchMap.get("CH_INDEX") == null || searchMap.get("CH_INDEX").equals("")) {
			champIndex = String.valueOf(championList.get(0).get("CH_INDEX"));
		} else {
			champIndex = String.valueOf(searchMap.get("CH_INDEX"));
		}
		HashMap<String,Object> selectedChamp = championService.selectChampion(champIndex);
		model.addAttribute("selectedchampion", selectedChamp);
		model.addAttribute("searchMap", searchMap);
		
		return "/admin/champion/list";
	}
	
	@RequestMapping(value="/admin/champion/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public String saveChampion(@RequestParam Map<String,Object> params
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
			
			championService.saveChampion(params, saveFiles);
			
		} catch (Exception e) {
			result = e.toString();
		}
		return result;
	}
}
