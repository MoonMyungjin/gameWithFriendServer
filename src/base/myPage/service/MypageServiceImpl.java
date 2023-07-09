package base.myPage.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import base.admin.vo.UserVO;
import base.myPage.dao.MypageDAO;
import common.dao.FileDAO;
import common.vo.FileVO;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {
	
	@Resource(name="fileDAO")
	protected FileDAO fileDAO;
	
	@Resource(name="MypageDAO")
	protected MypageDAO mypageDAO;

	@Override
	public void saveMyImage(List<FileVO> saveFiles, String key,String tableName) throws SQLException {
		//fileDB delete > insert
		FileVO paramVO = new FileVO();
		paramVO.setFlTableId(tableName);
		paramVO.setFlTableKey(key);
		fileDAO.deleteFile(paramVO);
		
		for (FileVO fileVO : saveFiles) {
			fileVO.setFlTableId(tableName);
			fileVO.setFlRegId(key);
			fileVO.setFlTableKey(key);
			fileDAO.insertFile(fileVO);
		}
	}

	@Override
	public List<UserVO> selectUserInfo(String uIntgId) throws SQLException  {
		
		return mypageDAO.selectUserInfo(uIntgId);
	}

}
