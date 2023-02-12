package test.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import test.vo.UserVO;

@Repository("TestService")
public interface TestService {

	List<UserVO> testMethod() throws SQLException;

}
