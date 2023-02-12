package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;

import com.lms.hexa.dto.FavoritesVO;

public interface FavoritesDAO {
	
	// 즐겨찾기 등록
	void insertFavorites(FavoritesVO favorites) throws SQLException;
	
	//즐겨찾기 삭제
	void deleteFavorites(FavoritesVO favorites) throws SQLException;
	
	// 즐겨찾기 개수 count
	int selectFavoriteById(String userId) throws SQLException;
	
}
