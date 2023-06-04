package base.admin.option.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.option.vo.OptionVO;

@Repository("OptionDAO")
public class OptionDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<HashMap<String, String>> selectOptionList (Map<String, String> searchMap) {
		return session.selectList("base.admin.option.mapper.selectOptionList",searchMap);
	}
	
	public HashMap<String, String> selectOption (String optionIndex) {
		return session.selectOne("base.admin.option.mapper.selectOption",optionIndex);
	}


}
