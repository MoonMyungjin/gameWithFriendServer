package base.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.dao.AdminDAO;
import base.admin.vo.UserVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name="AdminDAO")
	protected AdminDAO adminDAO;

	@Override
	public List<UserVO> getUserList(Map<String, Object> params) throws SQLException {
		return adminDAO.getUserList(params);
	}

	@Override
	public void userUpdate(Map<String, Object> params) throws SQLException {
		adminDAO.userUpdate(params);
	}

}
