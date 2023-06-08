package base.admin.option.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.champion.dao.ChampionDAO;
import base.admin.option.dao.OptionDAO;
import base.admin.option.vo.OptionVO;
import common.dao.FileDAO;
import common.vo.FileVO;

@Service("OptionService")
public class OptionServiceImpl implements OptionService {
	
	@Resource(name="OptionDAO")
	protected OptionDAO optionDAO;
	
	@Resource(name="fileDAO")
	protected FileDAO fileDAO;

	@Override
	public List<HashMap<String, String>> selectOptionList(Map<String,String> searchMap) throws SQLException {		
		return optionDAO.selectOptionList(searchMap);
	}

	@Override
	public HashMap<String, Object> selectOption(String optionIndex) throws SQLException {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("option",optionDAO.selectOption(optionIndex));
		FileVO paramVO = new FileVO();
		paramVO.setFlTableId("OPTION");
		paramVO.setFlTableKey(optionIndex);
		resultMap.put("image",fileDAO.selectFiles(paramVO));
		return resultMap;
	}
	
	@Override
	public List<HashMap<String, String>> selectOptionUnderList(String underOptionIndex) throws SQLException {		
		String selectUnderOptionIndex = optionDAO.selectUnderOptionIndex(underOptionIndex);
		return optionDAO.selectUnderOptionList(selectUnderOptionIndex);
	}

	@Override
	public void saveOption(Map<String, Object> params, List<FileVO> files) throws SQLException {
	HashMap<String, String> option = optionDAO.selectOption(params.get("CD_DTL_ID")+"");
		
		if(option == null || option.isEmpty()) {

			optionDAO.insertMegaOption(params);
			params.put("CD_DTL_PARENT_ID","101");
			optionDAO.insertOption(params);
			
		} else {
			optionDAO.updateMegaOption(params);
			optionDAO.updateOption(params);
		}
		
		if(files != null) {
			//fileDB delete > insert
			FileVO paramVO = new FileVO();
			paramVO.setFlTableId("OPTION");
			paramVO.setFlTableKey(params.get("CD_DTL_ID")+"");
			fileDAO.deleteFile(paramVO);
		
			for (FileVO fileVO : files) {
				fileVO.setFlRegId("SYSTEM");
				fileVO.setFlTableId("OPTION");
				fileVO.setFlTableKey(params.get("CD_DTL_ID")+"");
				fileDAO.insertFile(fileVO);
			}
		}
		
	}
	
	@Override
	public void saveOptionUnder(Map<String, Object> params, List<FileVO> files) throws SQLException {
	HashMap<String, String> option = optionDAO.selectOption(params.get("CD_DTL_ID_UNDER")+"");
		
		if(option == null || option.isEmpty()) {
			optionDAO.insertOptionUnder(params);
			
		} else {
			optionDAO.updateOptionUnder(params);
		}
		
		if(files != null) {
			//fileDB delete > insert
			FileVO paramVO = new FileVO();
			paramVO.setFlTableId("OPTION");
			paramVO.setFlTableKey(params.get("CD_DTL_ID_UNDER")+"");
			fileDAO.deleteFile(paramVO);
		
			for (FileVO fileVO : files) {
				fileVO.setFlRegId("SYSTEM");
				fileVO.setFlTableId("OPTION");
				fileVO.setFlTableKey(params.get("CD_DTL_ID_UNDER")+"");
				fileDAO.insertFile(fileVO);
			}
		}
		
	}
	
	@Override
	public void saveOptionUnderUnder(Map<String, Object> params, List<FileVO> files) throws SQLException {
	HashMap<String, String> option = optionDAO.selectOption(params.get("CD_DTL_ID_UNDER_UNDER")+"");
		
		if(option == null || option.isEmpty()) {
			optionDAO.insertOptionUnderUnder(params);
			
		} else {
			optionDAO.updateOptionUnderUnder(params);
		}
		
		if(files != null) {
			//fileDB delete > insert
			FileVO paramVO = new FileVO();
			paramVO.setFlTableId("OPTION");
			paramVO.setFlTableKey(params.get("CD_DTL_ID_UNDER_UNDER")+"");
			fileDAO.deleteFile(paramVO);
		
			for (FileVO fileVO : files) {
				fileVO.setFlRegId("SYSTEM");
				fileVO.setFlTableId("OPTION");
				fileVO.setFlTableKey(params.get("CD_DTL_ID_UNDER_UNDER")+"");
				fileDAO.insertFile(fileVO);
			}
		}
		
	}
	
	@Override
	public String selectOptionUnderKey(String upperOptionIndex) throws SQLException {		
		return  optionDAO.selectUnderOptionIndex(upperOptionIndex);
	}
	

	@Override
	public List<HashMap<String, String>> selectUnderUnderOptionList(Map<String,String> searchMap) throws SQLException {		
		return optionDAO.selectUnderUnderOptionList(searchMap);
	}
	
	
	@Override
	public HashMap<String, Object> selectUnderUnderOption(String optionIndex) throws SQLException {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("option",optionDAO.selectUnderUnderOption(optionIndex));
		if(optionIndex !="") {
			FileVO paramVO = new FileVO();
			paramVO.setFlTableId("OPTION");
			paramVO.setFlTableKey(optionIndex);
			resultMap.put("image",fileDAO.selectFiles(paramVO));
		}

		return resultMap;
	}
	

	
	
	

	


}
