package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;


import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.PdsVO;

public class PdsDAOImpl implements PdsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	
	@Override
	public List<PdsVO> selectPdsCriteria(Criteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<PdsVO> pdsList=
		   session.selectList("Pds-Mapper.selectSearchPdsList",cri,rowBounds);	
			
		return pdsList;
	}

	@Override
	public int selectPdsCriteriaTotalCount(Criteria cri) throws SQLException {
		int count=session.selectOne("Pds-Mapper.selectSearchPdsListCount",cri);
		return count;
	}

	@Override
	public PdsVO selectPdsByPno(int pdsId) throws SQLException {
		PdsVO pds=session.selectOne("Pds-Mapper.selectPdsByPno",pdsId);
		return pds;
	}

	@Override
	public PdsVO selectPdsByImage(String imageFile) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPds(PdsVO pds) throws SQLException {
		session.update("Pds-Mapper.insertPds",pds);
		
	}

	@Override
	public void updatePds(PdsVO pds) throws SQLException {
		session.update("Pds-Mapper.updatePds",pds);
		
	}

	@Override
	public void deletePds(int pdsId) throws SQLException {
		session.update("Pds-Mapper.deletePds",pdsId);
		
	}

	@Override
	public void increaseViewCnt(int pdsId) throws SQLException {
		session.update("Pds-Mapper.increaseViewCnt",pdsId);
		
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		int pdsId = session.selectOne("Pds-Mapper.selectPdsSeqNext");
		return pdsId;
	}
	


	
	
}
