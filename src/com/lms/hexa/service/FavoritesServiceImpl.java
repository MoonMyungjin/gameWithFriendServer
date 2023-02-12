package com.lms.hexa.service;

import java.sql.SQLException;

import com.lms.hexa.dao.FavoritesDAO;
import com.lms.hexa.dto.FavoritesVO;

public class FavoritesServiceImpl implements FavoritesService{
	
	private FavoritesDAO favoritesDAO;
	public void setFavoritesDAO(FavoritesDAO favoritesDAO) {
		this.favoritesDAO = favoritesDAO;
	}

	@Override
	public void regist(FavoritesVO favorites) throws SQLException {
		favoritesDAO.insertFavorites(favorites);
		
	}

	@Override
	public void remove(FavoritesVO favorites) throws SQLException {
		favoritesDAO.deleteFavorites(favorites);
		
	}

	@Override
	public int selctFavoriteCount(String userId) throws SQLException {
		int count = favoritesDAO.selectFavoriteById(userId);
		return count;
	}
	
	

}
