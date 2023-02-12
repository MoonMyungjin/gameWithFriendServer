package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.NoticeVO;

public interface AcademyinfoService {

	Map<String, Object> selectAcademyinfoList() throws SQLException;
	
	 void modify(AcademyinfoVO academyinfo) throws SQLException;
	 
	 // 학생 메뉴
	 Map<String, Object> selectMainMenu() throws SQLException;
	 
	 Map<String, Object> selectInfoList() throws SQLException;
	 
	 // 메뉴 카테고리 변경
	 void updateMenu(HashMap<String, Object> params) throws SQLException;
	 

	 
	 Map<String, Object> selectMenuNameAll () throws SQLException;
	

	 Map<String, Object> selectMenuNameAll2 () throws SQLException;

	 // 메뉴 이름 변경
	 void updateMenuName(HashMap<String, Object> params) throws SQLException;
	 
	 // 서브 메뉴 리스트
	 Map<String, Object> selectSubMenuList(String menuId) throws SQLException;

}
