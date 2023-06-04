package base.admin.option.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import base.admin.option.vo.OptionVO;
import common.vo.FileVO;

@Repository("OptionService")
public interface OptionService {

	List<HashMap<String, String>> selectOptionList(Map<String,String> searchMap)throws SQLException;
	
	HashMap<String, Object> selectOption(String opDtlId) throws SQLException;
	
	List<HashMap<String, String>> selectOptionUnderList(String underOptionIndex)throws SQLException;

}
