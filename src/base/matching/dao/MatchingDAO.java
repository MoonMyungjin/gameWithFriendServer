package base.matching.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.matching.vo.MatchingHistoryVO;
import gameMatching.vo.GameVO;

@Repository("MatchingDAO")
public class MatchingDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<MatchingHistoryVO> selectHistoryList(Map<String, String> paramMap) throws SQLException {
		String where = "";
		String baseDate = paramMap.get("baseDate");
		
		if(baseDate == null || baseDate.equals("")) baseDate = "NOW()";
		
		switch (paramMap.get("selectType")) {
		case "latest": 
			where = "A.M_MATCHING_DATE IN (SELECT MAX(M_MATCHING_DATE) FROM MATCHING)";
			break;
		case "previous":
			where = "A.M_MATCHING_DATE IN (SELECT MAX(M_MATCHING_DATE) FROM MATCHING WHERE M_MATCHING_DATE < '" + baseDate + "')";
			break;
		case "later":
			where = "A.M_MATCHING_DATE IN (SELECT MIN(M_MATCHING_DATE) FROM MATCHING WHERE M_MATCHING_DATE > '" + baseDate + "')";
			break;
		default:
			where = "A.M_MATCHING_DATE IN (SELECT MAX(M_MATCHING_DATE) FROM MATCHING)";
			break;
		}
		
		paramMap.put("where", where);
		return session.selectList("base.matching.mapper.selectHistoryList", paramMap);
	}
	
	public String selectLatestDate(String myID) throws SQLException {
		return session.selectOne("base.matching.mapper.selectLatestDate", myID);
	}
	
	public String selectPreviousLaterDate(Map<String, String> paramMap) throws SQLException {
		return session.selectOne("base.matching.mapper.selectPreviousLaterDate", paramMap);
	}
	
	public List<MatchingHistoryVO> selectExceptList(MatchingHistoryVO vo) throws SQLException {
		return session.selectList("base.matching.mapper.selectExceptList", vo);
	}
	
	public void insertMatchingHistory(List<GameVO> list) throws SQLException {
		session.insert("base.matching.mapper.insertMatchingHistory", list);
	}
	
	public String selectMatchingHistoryTableKey() throws SQLException {
		return session.selectOne("base.matching.mapper.selectMatchingHistoryTableKey");
	}
}
