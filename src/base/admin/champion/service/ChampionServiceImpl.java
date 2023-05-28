package base.admin.champion.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.champion.dao.ChampionDAO;
import common.dao.FileDAO;
import common.vo.FileVO;

@Service("ChampionService")
public class ChampionServiceImpl implements ChampionService {
	
	@Resource(name="ChampionDAO")
	protected ChampionDAO championDAO;
	
	@Resource(name="fileDAO")
	protected FileDAO fileDAO;

	@Override
	public List<HashMap<String,String>> selectChampionList(Map<String, String> searchMap) throws SQLException {
		return championDAO.selectChampionList(searchMap);
	}

	@Override
	public HashMap<String, Object> selectChampion(String chIndex) throws SQLException {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("champ",championDAO.selectChampion(chIndex));
		FileVO paramVO = new FileVO();
		paramVO.setFlTableId("CHAMPION");
		paramVO.setFlTableKey(chIndex);
		resultMap.put("image",fileDAO.selectFiles(paramVO));
		return resultMap;
	}

	@Override
	public void saveChampion(Map<String, Object> params, List<FileVO> files) throws SQLException {
		HashMap<String, String> champ = championDAO.selectChampion(params.get("CH_INDEX")+"");
		
		if(champ == null || champ.isEmpty()) {
			//insert
			params.put("CH_INDEX",championDAO.selectInsertKey());
			championDAO.insertChampion(params);
			
		} else {
			//update
			championDAO.updateChampion(params);
		}
		
		if(files != null) {
			//fileDB delete > insert
			FileVO paramVO = new FileVO();
			paramVO.setFlTableId("CHAMPION");
			paramVO.setFlTableKey(params.get("CH_INDEX")+"");
			fileDAO.deleteFile(paramVO);
		
			for (FileVO fileVO : files) {
				fileVO.setFlRegId("SYSTEM");
				fileVO.setFlTableId("CHAMPION");
				fileVO.setFlTableKey(params.get("CH_INDEX")+"");
				fileDAO.insertFile(fileVO);
			}
		}
	}

}
