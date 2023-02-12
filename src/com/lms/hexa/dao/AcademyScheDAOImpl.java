package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.AcademyScheVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.SchoolVO;

public class AcademyScheDAOImpl implements AcademyScheDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AcademyScheVO> selectAcademyUpScheList() throws SQLException {
		List<AcademyScheVO> academySche = session.selectList("AcademySche-Mapper.selectacademyUpScheList");
		return academySche;
	}

	@Override
	public int insertAcademyUpSche(HashMap<String, Object> params) throws SQLException {
		
		int result = session.update("AcademySche-Mapper.insertAcademyUpSche",params);
		return result;
	}

	@Override
	public void deleteAcademyUpSche(HashMap<String, Object> params) throws SQLException {
		session.update("AcademySche-Mapper.deleteAcademyUpSche",params);
		
	}

	@Override
	public List<AcademyScheVO> selectAcademyScheList() throws SQLException {
		List<AcademyScheVO> academySche = session.selectList("AcademySche-Mapper.selectacademyScheList");
		return academySche;
	}

	@Override
	public int insertAcademySche(HashMap<String, Object> params) throws SQLException {
		int result = session.update("AcademySche-Mapper.insertAcademySche",params);
		return result;
	}

	@Override
	public void updateAcademyCal(HashMap<String, Object> params) throws SQLException {
		session.update("AcademySche-Mapper.updateAcademyCal",params);
		
	}

	@Override
	public void updateAcademyResize(HashMap<String, Object> params) throws SQLException {
		session.update("AcademySche-Mapper.updateAcademyResize",params);
		
	}

	@Override
	public void updateAcademyDetail(HashMap<String, Object> params) throws SQLException {
		
		session.update("AcademySche-Mapper.updateAcademyDetail",params);
		
	}

	@Override
	public void deleteAcademyDetail(HashMap<String, Object> params) throws SQLException {
		session.update("AcademySche-Mapper.deleteAcademyDetail",params);
		
	}

	
	
	
}
