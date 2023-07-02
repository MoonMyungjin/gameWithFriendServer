package base.admin.report.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import util.CustomMap;

@Repository("ReportDAO")
public class ReportDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;

	public List<CustomMap> selectReportList(Map<String, String> searchMap) {
		return session.selectList("base.admin.report.mapper.selectReportList",searchMap);
	}

}
