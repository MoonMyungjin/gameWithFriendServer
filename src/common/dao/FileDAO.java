package common.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import common.vo.FileVO;


@Repository("fileDAO")
public class FileDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	
	public int insertFile(FileVO file) throws SQLException {
		return session.insert("file.mapper.insertFile",file);
	}


	public void deleteFile(FileVO file) throws SQLException {
		session.insert("file.mapper.deleteFile",file);
	}


	public List<FileVO> selectFiles(FileVO file) {
		return session.selectList("file.mapper.selectFiles",file);
	}
	
	

}
