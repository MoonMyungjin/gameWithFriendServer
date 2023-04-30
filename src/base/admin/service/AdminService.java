package base.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;

@Repository("AdminService")
public interface AdminService {

	List<UserVO> getUserList() throws SQLException;

}
