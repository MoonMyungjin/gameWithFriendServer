package base.report.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("FReportDAO")
public class FReportDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
}
