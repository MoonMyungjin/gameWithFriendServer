package com.lms.hexa.dao;

import java.util.List;

import com.lms.hexa.dto.TemplateVO;

public interface TemplateDAO {
	
	public TemplateVO selectTemplateByTemplateName(String templateName) throws Exception;
	
	public int insertTemplate(TemplateVO template) throws Exception;
	
	public void deleteTemplate(String templateName) throws Exception;
	
	public List<TemplateVO> selectTemplateList() throws Exception;
	
	public TemplateVO selectTemplateListCheck(String templateName) throws Exception;
	
	public void updateTemplate(TemplateVO template) throws Exception;
	
}
