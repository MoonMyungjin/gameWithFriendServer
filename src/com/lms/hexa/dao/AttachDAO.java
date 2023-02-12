package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.AttachVO;

public interface AttachDAO {
	
	public List<AttachVO> selectAttachesByPdsId(int pdsId) throws SQLException;
	
	public AttachVO selectAttachByAttachId(int attachId) throws SQLException;
	
	public void insertAttach(AttachVO attach);
	
	public void deleteAttach(int attachId) throws SQLException;
	
	public void deleteAllAttach(int pdsId) throws SQLException;

	public int selectAttachSeqNextValue();

	public AttachVO selectAttachByAttachAttachInfo(AttachVO attachVO);

	public void deleteAttach(AttachVO attachVO);

	public int selectMAXattachID(int attachGroupId);

	
}
