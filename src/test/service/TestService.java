package test.service;

import java.sql.SQLException;
import java.util.List;

import test.vo.UserVO;

public interface TestService {

	List<UserVO> testMethod() throws SQLException;

}
