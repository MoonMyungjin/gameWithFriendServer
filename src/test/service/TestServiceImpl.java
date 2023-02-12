package test.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import test.dao.TestDAO;
import test.vo.UserVO;

@Service("testService")
public class TestServiceImpl implements TestService {
	
	@Resource(name="testDAO")
	protected TestDAO testDAO;
	
	@Override
	public List<UserVO> testMethod() throws SQLException {
		return testDAO.selectTest();
	}

}
