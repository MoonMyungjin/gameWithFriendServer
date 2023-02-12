package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.PdsVO;

public interface PdsDAO {
	
	// 자료실 list
	List<PdsVO> selectPdsCriteria(Criteria cri) throws SQLException;
	
	// 자료 전체 개수
	int selectPdsCriteriaTotalCount(Criteria cri) throws SQLException;
	
	// pds_id에 따른 자료
	PdsVO selectPdsByPno(int pdsId) throws SQLException;
	
	// image에 따른 자료
	PdsVO selectPdsByImage(String imageFile) throws SQLException;
	
	// 자료등록
	void insertPds(PdsVO pds) throws SQLException;
	
	// 자료 수정
	void updatePds(PdsVO pds) throws SQLException;
	
	// 자료 삭제
	void deletePds(int pdsId) throws SQLException;
	
	// 조회수 증가
	void increaseViewCnt(int pdsId) throws SQLException;
	
	int getSeqNextValue() throws SQLException;
	
}
