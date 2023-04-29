package common.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import common.vo.CodeVO;
import gameMatching.vo.GameVO;


@Repository("codeDAO")
public class CodeDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public List<CodeVO> selectOption() throws SQLException {
		return session.selectList("code.mapper.selectOption");
	}

}
