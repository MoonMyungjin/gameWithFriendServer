package base.myPage.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.FileDAO;
import common.vo.FileVO;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {
	
	@Resource(name="fileDAO")
	protected FileDAO fileDAO;

	@Override
	public void saveMyImage(List<FileVO> saveFiles, String key,String tableName) throws SQLException {
		//fileDB delete > insert
		FileVO paramVO = new FileVO();
		paramVO.setFlTableId("USER");
		paramVO.setFlTableKey(key);
		fileDAO.deleteFile(paramVO);
		
		for (FileVO fileVO : saveFiles) {
			fileVO.setFlRegId(key);
			fileVO.setFlTableId("CHAMPION");
			fileVO.setFlTableKey(key);
			fileDAO.insertFile(fileVO);
		}
	}

}
