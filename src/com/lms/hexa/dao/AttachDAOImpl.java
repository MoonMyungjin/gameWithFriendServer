package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AttachVO> selectAttachesByPdsId(int pdsId) throws SQLException {
		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachByPdsId", pdsId);
		return attachList;
	}

	@Override
	public AttachVO selectAttachByAttachId(int attachId) throws SQLException {
		AttachVO attach = session.selectOne("Attach-Mapper.selectAttachByAttachId", attachId);
		return attach;
	}

	@Override
	public AttachVO selectAttachByAttachAttachInfo(AttachVO attachVO) {
		AttachVO attach = session.selectOne("Attach-Mapper.selectAttachByAttachAttachInfo", attachVO);
		return attach;
	}

	@Override
	public void insertAttach(AttachVO attach){
		session.update("Attach-Mapper.insertAttach",attach);
		
	}

	@Override
	public void deleteAttach(int attachId) throws SQLException {
		session.update("Attach-Mapper.deleteAttach",attachId);	
		
	}
	
	@Override
	public void deleteAttach(AttachVO attach){
		session.update("Attach-Mapper.deleteAttachOne",attach);	
		
	}

	@Override
	public void deleteAllAttach(int attachGroupId) throws SQLException {
		session.update("Attach-Mapper.deleteAllAttach",attachGroupId);		
		
	}

	@Override
	public int selectAttachSeqNextValue() {
		int seq= session.selectOne("Attach-Mapper.selectAttachSeqNextValue");
		return seq;
	}

	@Override
	public int selectMAXattachID(int attachGroupId) {
		int maxVal = session.selectOne("Attach-Mapper.selectMAXattachID", attachGroupId);
		return maxVal;
	}


	
}
