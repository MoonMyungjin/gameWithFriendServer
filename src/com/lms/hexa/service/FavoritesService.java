package com.lms.hexa.service;

import java.sql.SQLException;

import com.lms.hexa.dto.FavoritesVO;

public interface FavoritesService {
	
	// 즐겨찾기 추가
	void regist(FavoritesVO favorites) throws SQLException;
	
	// 즐겨찾기 삭제
	void remove(FavoritesVO favorites) throws SQLException;
	
	// 카운트
	int selctFavoriteCount(String userId) throws SQLException;
	
	
}
