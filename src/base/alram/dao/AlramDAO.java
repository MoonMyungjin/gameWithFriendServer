package base.alram.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import base.alram.vo.AlramVO;
import base.friend.vo.FriendVO;
import base.main.vo.MainVO;

@Repository("AlramDAO")
public class AlramDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;

	public List<AlramVO> findMyAlramList(AlramVO alramVO) throws SQLException {
		return session.selectList("base.alram.mapper.findMyAlramList", alramVO);
	}
	
	public int findMyAlramListUnReadCount(AlramVO alramVO) throws SQLException {
		return session.selectOne("base.alram.mapper.findMyAlramListUnReadCount", alramVO);
	}
	
	public void sendAlram(AlramVO alramVO) throws SQLException {
		session.update("base.alram.mapper.sendAlram", alramVO);
	}
	
	public void alramDelete(AlramVO alramVO) throws SQLException {
		session.update("base.alram.mapper.alramDelete", alramVO);
	}
	
	public void alramRead(AlramVO alramVO) throws SQLException {
		session.update("base.alram.mapper.alramRead", alramVO);
	}
}
