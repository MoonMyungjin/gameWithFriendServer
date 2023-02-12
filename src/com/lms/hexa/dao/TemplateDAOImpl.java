package com.lms.hexa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.TemplateVO;

public class TemplateDAOImpl implements TemplateDAO {
		
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public TemplateVO selectTemplateByTemplateName(String templateName) throws Exception {
		TemplateVO template = session.selectOne("Template-Mapper.selectTemplateByTemplateName",templateName);
		return template;
	}

	@Override
	public int insertTemplate(TemplateVO template) throws Exception {
		int result = session.insert("Template-Mapper.insertTemplate",template);
		return result;
	}

	@Override
	public void deleteTemplate(String templateName) throws Exception {
		session.delete("Template-Mapper.deleteTemplate",templateName);
	}

	@Override
	public List<TemplateVO> selectTemplateList() throws Exception {
		List<TemplateVO> templateList = session.selectList("Template-Mapper.selectTemplateList");
		return templateList;
	}

	@Override
	public TemplateVO selectTemplateListCheck(String templateName) throws Exception {
		TemplateVO template = session.selectOne("Template-Mapper.selectTemplateListCheck", templateName);
		return template;
	}

	@Override
	public void updateTemplate(TemplateVO template) throws Exception {
		session.update("Template-Mapper.updateTemplate", template);
	}
	
}
