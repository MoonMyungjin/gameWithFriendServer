package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.MenuVO;

public class MenuDAOImpl implements MenuDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MenuVO> selectStudentMenuList() throws SQLException {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectStudentMenuList");
		return menuList;
	}

	@Override
	public List<MenuVO> selectStudentSubMenuList(String login_id) throws SQLException {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectStudentSubMenuList",login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectParentMenuList() throws SQLException {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectParentMenuList");
		return menuList;
	}

	@Override
	public List<MenuVO> selectParentSubMenuList(String login_id) throws SQLException {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectParentSubMenuList",login_id);
		return menuList;
	}	
	
	@Override
	public List<MenuVO> selectManagerMenuList() throws SQLException {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectManagerMainMenu");
		return menuList;
	}
	
	@Override
	public List<MenuVO> selectManagerMenuListByUserId(String login_id) {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectManagerMenuListByUserId",login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectManagerSubMenuList(String login_id) throws SQLException {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectManagerSubMenuList",login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectStudentFavoriteMenuList(String login_id) {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectStudentFavoriteMenuList",login_id);
		return menuList;
	}
	@Override
	public List<MenuVO> selectParentFavoriteMenuList(String login_id) {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectParentFavoriteMenuList",login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectManagerFavoriteMenuList(String login_id) {
		List<MenuVO> menuList= session.selectList("Menu-Mapper.selectManagerFavoriteMenuList",login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectManagerNotAuthorityMenuList(String id) {
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectManagerNotAuthorityMenuList",id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectManagerAuthorityMenuList(String id) {
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectManagerAuthorityMenuList",id);
		return menuList;
	}
	
	@Override
	public String selectMenuId(String menuName) throws SQLException {
		String menuId = session.selectOne("Menu-Mapper.selectMenuId", menuName);
		return menuId;
	}

	@Override
	public MenuVO selectMenuListByMcode(String mCode) {
		MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMcode", mCode);
		String menuId = menu.getMenuUrl().split("'")[1];
		menu.setMenuUrl(menuId);
		return menu;
	}

	@Override
	public String selectMenuNameByUrl(String menuUrl) throws SQLException {
		String menuName = "";
		menuName = session.selectOne("Menu-Mapper.selectMenuNameByUrl",menuUrl);
	
		
		if(menuName ==null) {
			menuName = "메뉴명이 없습니다";
		}
		
		System.out.println(menuName);
		return menuName;
	}

	@Override
	public List<MenuVO> selectMenuNameAll() throws SQLException {
		List<MenuVO> selectList = session.selectList("Menu-Mapper.selectMenuAllList");
		return selectList;
	}


	@Override
	public List<String> selectMenuNameAllStr() throws SQLException {
		List<String> selectList = session.selectList("Menu-Mapper.selectMenuAllListStr");
		return selectList;
	}


}
