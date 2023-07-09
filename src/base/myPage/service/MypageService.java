package base.myPage.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import common.vo.FileVO;

@Repository("MypageService")
public interface MypageService {

	void saveMyImage(List<FileVO> saveFiles, String Key,String tableName)throws SQLException;

}
