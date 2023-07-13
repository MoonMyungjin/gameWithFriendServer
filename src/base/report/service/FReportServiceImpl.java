package base.report.service;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.report.dao.FReportDAO;

@Service("FReportService")
public class FReportServiceImpl implements FReportService{
	
	@Resource(name="FReportDAO")
	protected FReportDAO FReportDAO;

	@Override
	public int insertReport(Map<String, String> params) throws SQLException {
		return FReportDAO.insertReport(params);
	}
}
