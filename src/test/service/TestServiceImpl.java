package test.service;

import java.sql.SQLException;
import java.util.List;

import test.dao.TestDAO;
import test.vo.UserVO;

public class TestServiceImpl implements TestService {
	
	//Service 최초생성 시, apllication-context.xml 참조
	protected TestDAO testDAO;
	public void setTestDAO(TestDAO testDAO) {
		this.testDAO = testDAO;
	}
	
	
	@Override
	public List<UserVO> testMethod() throws SQLException {
		return testDAO.selectTest();
	}

}
