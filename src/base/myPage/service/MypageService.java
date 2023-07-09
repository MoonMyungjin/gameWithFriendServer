package base.myPage.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import base.admin.vo.UserVO;
import common.vo.FileVO;

@Repository("MypageService")
public interface MypageService {

	void saveMyImage(List<FileVO> saveFiles, String Key,String tableName)throws SQLException;

	List<UserVO> selectUserInfo(String uIntgId) throws SQLException ;

}
