package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.MenuVO;
import com.lms.hexa.dto.SchoolVO;

public interface AcademyinfoDAO {
	
	List<AcademyinfoVO> selectAcademyinfoList() throws SQLException;
	
	void update(AcademyinfoVO acdemyinfo) throws SQLException;
	
	// 상위 메뉴 리스트 출력
	List<MenuVO> selectMainMenu() throws SQLException;
	
	// 메뉴 카테고리 업데이트
	void updateMenuCategory(HashMap<String, Object> params) throws SQLException;
	
	// 메뉴 이름 업데이트
	void updateMenuName(HashMap<String, Object> params) throws SQLException;
	
	// 메인 & 서브 메뉴 list
	List<MenuVO> selectSubMenu(String menuId) throws SQLException;
}
