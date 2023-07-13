package base.report.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gameMatching.vo.GameVO;

@Repository("FReportDAO")
public class FReportDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public int insertReport(Map<String, String> params) throws SQLException {
		String reportType = "";
		String reportOptions = params.get("reportOptions");
		
		if(!reportOptions.equals("")) reportType = reportOptions.substring(0, 3);
		
		params.put("reportType", reportType);
		
		return session.insert("base.freport.mapper.insertReport", params);
	}
}
