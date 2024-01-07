package base.myPage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import common.vo.FileVO;

@Repository("MypageService")
public interface MypageService {
	// 프로필 사진을 저장하는 메서드
	public void saveMyImage(List<FileVO> saveFiles, String Key,String tableName)throws SQLException;
	
	// 유저 id를 통해 유저정보를 조회한다.
	public Map<String, Object> selectUserInfo(String uIntgId) throws SQLException ;

}
