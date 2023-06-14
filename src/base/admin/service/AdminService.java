package base.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;

@Repository("AdminService")
public interface AdminService {

	List<UserVO> getUserList(Map<String, Object> params) throws SQLException;

	void userUpdate(Map<String, Object> params) throws SQLException;

}
