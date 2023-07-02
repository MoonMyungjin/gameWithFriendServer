package base.admin.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.report.dao.ReportDAO;
import util.CustomMap;

@Service("ReportService")
public class ReportServiceImpl implements ReportService {
	
	@Resource(name="ReportDAO")
	protected ReportDAO reportDAO;

	@Override
	public List<CustomMap> selectReportList(Map<String, String> searchMap) {
		return reportDAO.selectReportList(searchMap);
	}
	
}
