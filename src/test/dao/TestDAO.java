package test.dao;

import java.sql.SQLException;
import java.util.List;

import test.vo.UserVO;

public interface TestDAO {
	
	List<UserVO> selectTest() throws SQLException;
}
