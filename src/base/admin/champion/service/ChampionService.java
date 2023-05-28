package base.admin.champion.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import common.vo.FileVO;

@Repository("ChampionService")
public interface ChampionService {

	List<HashMap<String, String>> selectChampionList(Map<String,String> searchMap)throws SQLException;

	HashMap<String, Object> selectChampion(String chIndex) throws SQLException;

	void saveChampion(Map<String, Object> params, List<FileVO> files) throws SQLException;

}
