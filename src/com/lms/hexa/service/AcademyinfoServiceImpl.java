package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dao.AcademyinfoDAO;
import com.lms.hexa.dao.MenuDAO;
import com.lms.hexa.dao.SchoolDAO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.MenuVO;
import com.lms.hexa.dto.SchoolVO;

public class AcademyinfoServiceImpl implements AcademyinfoService {
	
	protected AcademyinfoDAO academyinfoDAO;

	public void setAcademyinfoDAO(AcademyinfoDAO academyinfoDAO) {
		this.academyinfoDAO = academyinfoDAO;
	}
	
	private MenuDAO menuDAO;
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	
	@Override
	public Map<String, Object> selectAcademyinfoList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<AcademyinfoVO> academyinfoList = academyinfoDAO.selectAcademyinfoList();
		dataMap.put("academyinfoList", academyinfoList);
		return dataMap;
	}


	@Override
	public void modify(AcademyinfoVO academyinfo) throws SQLException {
		academyinfoDAO.update(academyinfo);
		
	}


	@Override
	public Map<String, Object> selectMainMenu() throws SQLException {
		Map<String, Object> SMenu = new HashMap<String, Object>();
		List<MenuVO> SMenuList = academyinfoDAO.selectMainMenu();
		SMenu.put("SMenuList", SMenuList);
		return SMenu;
	}


	@Override
	public Map<String, Object> selectInfoList() throws SQLException {
		Map<String, Object> academyinfo = new HashMap<String, Object>();
		List<AcademyinfoVO> academyinfoList = academyinfoDAO.selectAcademyinfoList();
		AcademyinfoVO academyinfoVO = academyinfoList.get(0);
		academyinfo.put("academyinfoVO", academyinfoVO);
		return academyinfo;
	}


	@Override
	public void updateMenu(HashMap<String, Object> params) throws SQLException {
		System.out.println("sevice : " + params);
		
		academyinfoDAO.updateMenuCategory(params);
		
	}

	@Override
	public void updateMenuName(HashMap<String, Object> params) throws SQLException {
		System.out.println("sevice : " + params);
		
		academyinfoDAO.updateMenuName(params);
		
	}



	@Override
	public Map<String, Object> selectMenuNameAll() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<MenuVO> selectMenuNameAll = menuDAO.selectMenuNameAll();
		
		dataMap.put("selectMenuNameAll", selectMenuNameAll);
		return dataMap;
	}

	@Override
	public Map<String, Object> selectSubMenuList(String menuId) throws SQLException {
		Map<String, Object> subMenu = new HashMap<String, Object>();
		List<MenuVO> subMenuList = academyinfoDAO.selectSubMenu(menuId);
		subMenu.put("subMenuList", subMenuList);
		return subMenu;
	}

	@Override
	public Map<String, Object> selectMenuNameAll2() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> selectMenuNameAll = menuDAO.selectMenuNameAllStr();
		
		dataMap.put("selectMenuNameAll", selectMenuNameAll);
		return dataMap;
	}




}
