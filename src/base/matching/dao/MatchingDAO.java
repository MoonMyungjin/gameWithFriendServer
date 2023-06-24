package base.matching.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.friend.vo.FriendVO;
import base.matching.vo.MatchingHistoryVO;

@Repository("MatchingDAO")
public class MatchingDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<MatchingHistoryVO> selectHistoryList(String myID) throws SQLException {
		return session.selectList("base.matching.mapper.selectHistoryList", myID);
	}

	
}
