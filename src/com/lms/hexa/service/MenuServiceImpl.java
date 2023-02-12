package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dao.MenuDAO;
import com.lms.hexa.dto.MenuVO;

public class MenuServiceImpl implements MenuService{

	private MenuDAO menuDAO;
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	
	@Override
	public List<MenuVO> getStudentMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectStudentMenuList();
		return menuList;
	}

	@Override
	public List<MenuVO> getStudentSubMenuList(String login_id) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectStudentSubMenuList(login_id);
		return menuList;
	}
	
	@Override
	public List<MenuVO> getParentMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectParentMenuList();
		return menuList;
	}
	
	@Override
	public List<MenuVO> getParentSubMenuList(String login_id) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectParentSubMenuList(login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> getManagerMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectManagerMenuList();
		return menuList;
	}
	
	@Override
	public List<MenuVO> getManagerMenuListByUserId(String login_id) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectManagerMenuListByUserId(login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> getManagerSubMenuList(String login_id) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectManagerSubMenuList(login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> getStudentFavoriteMenuList(String login_id) {
		List<MenuVO> menuList = menuDAO.selectStudentFavoriteMenuList(login_id);
		return menuList;
	}
	
	@Override
	public List<MenuVO> getParentFavoriteMenuList(String login_id) {
		List<MenuVO> menuList = menuDAO.selectParentFavoriteMenuList(login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> getManagerFavoriteMenuList(String login_id) {
		List<MenuVO> menuList = menuDAO.selectManagerFavoriteMenuList(login_id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectManagerNotAuthorityMenuList(String id) {
		List<MenuVO> menuList = menuDAO.selectManagerNotAuthorityMenuList(id);
		return menuList;
	}

	@Override
	public List<MenuVO> selectManagerAuthorityMenuList(String id) {
		List<MenuVO> menuList = menuDAO.selectManagerAuthorityMenuList(id);
		return menuList;
	}

	@Override
	public String getMenuId(String menuName) throws SQLException {
		String menuId = menuDAO.selectMenuId(menuName);
		return menuId;
	}

	@Override
	public MenuVO getMenuListByMcode(String mCode) {
		MenuVO menu = menuDAO.selectMenuListByMcode(mCode);
		return menu;
	}

	@Override
	public String selectMenuNameByUrl(String menuUrl) throws SQLException {
		String result = menuDAO.selectMenuNameByUrl(menuUrl);
		return result;
	}


}