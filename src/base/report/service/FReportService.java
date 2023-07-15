package base.report.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("FReportService")
public interface FReportService {
	
	int insertReport(Map<String, String> params) throws SQLException;
	
}
