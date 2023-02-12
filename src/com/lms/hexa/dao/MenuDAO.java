package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.MenuVO;

public interface MenuDAO {

	// Member 1depth 메뉴 리스트 조회
	List<MenuVO> selectStudentMenuList() throws SQLException;
	// Member 2depth 메뉴 리스트 조회
	List<MenuVO> selectStudentSubMenuList(String login_id) throws SQLException;
	// Member 1depth 메뉴 리스트 조회
	List<MenuVO> selectParentMenuList() throws SQLException;
	// Member 2depth 메뉴 리스트 조회
	List<MenuVO> selectParentSubMenuList(String login_id) throws SQLException;
	// mcode로 검색한  Member 정보 조회
	MenuVO selectMenuListByMcode(String mCode);
	// Manager 1depth 메뉴 리스트 조회
	List<MenuVO> selectManagerMenuList() throws SQLException;
	List<MenuVO> selectManagerMenuListByUserId(String login_id);
	// Manager 2depth 메뉴 리스트 조회
	List<MenuVO> selectManagerSubMenuList(String login_id) throws SQLException;
	
	// Student 1depth 즐겨찾기 메뉴 리스트 조회
	List<MenuVO> selectStudentFavoriteMenuList(String login_id);
	// Parent 1depth 즐겨찾기 메뉴 리스트 조회
	List<MenuVO> selectParentFavoriteMenuList(String login_id);
	// Manager 1depth 메뉴 리스트 조회
	List<MenuVO> selectManagerFavoriteMenuList(String login_id);
	
	// manager 권한 부여 되지 않은 메뉴 리스트 조회
	List<MenuVO> selectManagerNotAuthorityMenuList(String id);
	
	// manager 권한 부여 된 메뉴 리스트 조회
	List<MenuVO> selectManagerAuthorityMenuList(String id);

	// menuId 가져오기
	String selectMenuId(String menuName) throws SQLException;
	
	// menuName 가져오기
	String selectMenuNameByUrl(String menuUrl) throws SQLException;
	
	// 전체 메뉴 이름 가져오기
	List<MenuVO> selectMenuNameAll() throws SQLException;
	
	// 전체 메뉴 이름 가져오기2
	List<String> selectMenuNameAllStr() throws SQLException;
	

}
