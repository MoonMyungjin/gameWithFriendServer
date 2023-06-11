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
	
	public String selectUnderOptionIndex (String underOptionIndex) {
		return session.selectOne("base.admin.option.mapper.selectUnderOptionIndex",underOptionIndex);
	}
	
	public List<HashMap<String, String>> selectUnderOptionList (String selectUnderOptionIndex) {
		return session.selectList("base.admin.option.mapper.selectUnderOptionList",selectUnderOptionIndex);
	}
	
	public void insertMegaOption (Map<String, Object> searchMap) {
		session.insert("base.admin.option.mapper.insertMegaOption",searchMap);
	}
	
	public void insertOption (Map<String, Object> searchMap) {
		session.insert("base.admin.option.mapper.insertOption",searchMap);
	}
	
	
	public void updateMegaOption (Map<String, Object> searchMap) {
		session.update("base.admin.option.mapper.updateMegaOption",searchMap);
	}
	
	public void updateOption (Map<String, Object> searchMap) {
		session.update("base.admin.option.mapper.updateOption",searchMap);
	}
	
	public void insertOptionUnder (Map<String, Object> searchMap) {
		session.insert("base.admin.option.mapper.insertOptionUnder",searchMap);
	}
	
	public void updateOptionUnder (Map<String, Object> searchMap) {
		session.update("base.admin.option.mapper.updateOptionUnder",searchMap);
	}
	
	public HashMap<String, String> selectUnderUnderOption (String optionIndex) {
		return session.selectOne("base.admin.option.mapper.selectUnderUnderOption",optionIndex);
	}
	
	public List<HashMap<String, String>> selectUnderUnderOptionList (Map<String, String> searchMap) {
		return session.selectList("base.admin.option.mapper.selectUnderUnderOptionList",searchMap);
	}
	
	public void updateOptionUnderUnder (Map<String, Object> searchMap) {
		session.update("base.admin.option.mapper.updateOptionUnderUnder",searchMap);
	}
	
	public void insertOptionUnderUnder (Map<String, Object> searchMap) {
		session.insert("base.admin.option.mapper.insertUnderUnderOption",searchMap);
	}
	
	public List<HashMap<String, String>> selectMegaOptionList (String megaOptionId) {
		return session.selectList("base.admin.option.mapper.selectMegaOptionList",megaOptionId);
	}
	
	
}
