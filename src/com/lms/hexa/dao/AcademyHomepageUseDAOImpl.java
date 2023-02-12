package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionManager;
import org.springframework.beans.factory.annotation.Autowired;

import com.lms.hexa.dto.AcademyHomepageUseVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.SchoolVO;

public class AcademyHomepageUseDAOImpl implements AcademyHomepageUseDAO  {
	

	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	  
	
	@Override
	public AcademyHomepageUseVO insert() throws SQLException {
		AcademyHomepageUseVO selectOne = session.selectOne("MariaAcademyHomepageUse-Mapper.selectVisitor");
		return selectOne;
		
	}


	@Override
	public void insertHomeUseImpo(AcademyHomepageUseVO HomeImpo) throws SQLException {
		session.update("MariaAcademyHomepageUse-Mapper.insertVisitorMaria",HomeImpo);
		
	}


	@Override
	public List<AcademyHomepageUseVO> selectAcademyHomepageUse() throws SQLException {

		List<AcademyHomepageUseVO> selectList = session.selectList("MariaAcademyHomepageUse-Mapper.selectVisitorCount");
		return selectList;
	}

}
