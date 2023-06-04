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
	public HashMap<String, Object> selectOption(String opDtlId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	


}
