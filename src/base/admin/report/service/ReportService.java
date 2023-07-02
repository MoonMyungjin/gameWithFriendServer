package base.admin.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import util.CustomMap;

@Repository("ReportService")
public interface ReportService {

	List<CustomMap> selectReportList(Map<String, String> searchMap);

}
