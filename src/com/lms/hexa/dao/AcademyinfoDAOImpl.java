package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.MenuVO;
import com.lms.hexa.dto.SchoolVO;

public class AcademyinfoDAOImpl implements AcademyinfoDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<AcademyinfoVO> selectAcademyinfoList() throws SQLException {
		List<AcademyinfoVO> academyinfo = session.selectList("Academyinfo-Mapper.selectacademyinfo");
		return academyinfo;
	}

	@Override
	public void update(AcademyinfoVO acdemyinfo) throws SQLException {
		session.update("Academyinfo-Mapper.updateAcademyinfo", acdemyinfo);
		
	}

	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		List<MenuVO> SMenuList = session.selectList("Menu-Mapper.selectMenuList");
		return SMenuList;
	}

	@Override
	public void updateMenuCategory(HashMap<String, Object> params) throws SQLException {
		session.update("Menu-Mapper.updateMenuCategory", params);
		
	}

	@Override
	public void updateMenuName(HashMap<String, Object> params) throws SQLException {
//		System.out.println("dao : " + menuId + menuName);
		
		session.update("Menu-Mapper.updateMenuName",params);
	}

	@Override
	public List<MenuVO> selectSubMenu(String menuId) throws SQLException {
		List<MenuVO> subMenuList = session.selectList("Menu-Mapper.selectSubMenuList", menuId);
		return subMenuList;
	}

}
