package com.lms.hexa.service;

import java.util.List;

import com.lms.hexa.dao.TemplateDAO;
import com.lms.hexa.dto.TemplateVO;

public class TemplateServiceImpl implements TemplateService {
	
	private TemplateDAO templateDAO;

	public void setTemplateDAO(TemplateDAO templateDAO) {
		this.templateDAO = templateDAO;
	}

	@Override
	public TemplateVO getTemplateByTemplateName(String templateName) throws Exception {
		TemplateVO template = templateDAO.selectTemplateByTemplateName(templateName);
		return template;
	}

	@Override
	public int registTemplate(TemplateVO template) throws Exception {
		int result = templateDAO.insertTemplate(template);
		return result;
	}

	@Override
	public void deleteTemplate(String templateName) throws Exception {
		templateDAO.deleteTemplate(templateName);
	}

	@Override
	public List<TemplateVO> getTemplateList() throws Exception {
		List<TemplateVO> templateList = templateDAO.selectTemplateList();
		return templateList;
	}

	@Override
	public TemplateVO getTemplateListCheck(String templateName) throws Exception {
		TemplateVO template = templateDAO.selectTemplateListCheck(templateName);
		return template;
	}

	@Override
	public void updateTemplate(TemplateVO template) throws Exception {
		templateDAO.updateTemplate(template);
	}

}
