package base.report.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.report.dao.FReportDAO;

@Service("FReportService")
public class FReportServiceImpl implements FReportService{
	
	@Resource(name="FReportDAO")
	protected FReportDAO FReportDAO;
}
