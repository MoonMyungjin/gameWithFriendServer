package com.lms.hexa.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.FavoritesVO;

public class FavoritesDAOImpl implements FavoritesDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertFavorites(FavoritesVO favorites) throws SQLException {
		session.update("Favorites-Mapper.insertFavorites", favorites);
		
	}

	@Override
	public void deleteFavorites(FavoritesVO favorites) throws SQLException {
		session.update("Favorites-Mapper.deleteFavorites", favorites);
		
	}

	@Override
	public int selectFavoriteById(String userId) throws SQLException {
		int count = session.selectOne("Favorites-Mapper.selectFavoriteById", userId);
		return count;
	}

}
