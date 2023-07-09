package base.myPage.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;

@Repository("MypageDAO")
public class MypageDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<UserVO> selectUserInfo(String uIntgId) throws SQLException {
		return session.selectList("base.myPage.mapper.selectUserInfo", uIntgId);
	}
}
