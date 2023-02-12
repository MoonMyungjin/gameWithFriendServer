package com.lms.hexa.service;

import java.util.List;

import com.lms.hexa.dto.TemplateVO;

public interface TemplateService {
	
	public TemplateVO getTemplateByTemplateName(String templateName) throws Exception;
		
	public int registTemplate(TemplateVO template) throws Exception;
	
	public void deleteTemplate(String templateName) throws Exception;
	
	public List<TemplateVO> getTemplateList() throws Exception;
	
	public TemplateVO getTemplateListCheck(String templateName) throws Exception;
	
	public void updateTemplate(TemplateVO template) throws Exception;
	
}
