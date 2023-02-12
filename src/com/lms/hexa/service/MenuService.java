package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.MenuVO;

public interface MenuService {
	
	// Member 1depth 메뉴 리스트 조회
	List<MenuVO> getStudentMenuList() throws SQLException;
	// MemberVO 정보 조회
	MenuVO getMenuListByMcode(String mCode);
	// Member 2depth 메뉴 리스트 조회
	List<MenuVO> getStudentSubMenuList(String login_id) throws SQLException;
	// Member 1depth 메뉴 리스트 조회
	List<MenuVO> getParentMenuList() throws SQLException;
	// Member 2depth 메뉴 리스트 조회
	List<MenuVO> getParentSubMenuList(String login_id) throws SQLException;
	// Manager 1depth 메뉴 리스트 조회
	List<MenuVO> getManagerMenuList() throws SQLException;
	List<MenuVO> getManagerMenuListByUserId(String login_id) throws SQLException;
	// Manager 2depth 메뉴 리스트 조회
	List<MenuVO> getManagerSubMenuList(String login_id) throws SQLException;
	// Student 즐겨찾기 조회
	List<MenuVO> getStudentFavoriteMenuList(String login_id);
	// Parent 즐겨찾기 조회
	List<MenuVO> getParentFavoriteMenuList(String login_id);
	// Manager 즐겨찾기 조회
	List<MenuVO> getManagerFavoriteMenuList(String login_id);
	
	// manager 권한 부여 되지 않은 메뉴 리스트 조회
	List<MenuVO> selectManagerNotAuthorityMenuList(String id);
	
	// manager 권한 부여 된 메뉴 리스트 조회
	List<MenuVO> selectManagerAuthorityMenuList(String id);

	
	// 메뉴아이디 가져오기
	String getMenuId(String menuName) throws SQLException;
	
	// 메뉴명 가져오기
	String selectMenuNameByUrl(String menuUrl) throws SQLException;
	
	
	
}
