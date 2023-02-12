package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.jdbc.support.SQLErrorCodes;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.PdsVO;

public interface PdsService {
	
	//리스트 조회
	Map<String, Object> getList(Criteria cri) throws SQLException;
	
	// 글 조회
	PdsVO getPds(int pdsId) throws SQLException;
	
	// 글 작성
	void regist(PdsVO pds) throws SQLException;
	
	// 글 수정
	void modify(PdsVO pds) throws SQLException;
	
	// 글 삭제
	void remove(int pdsId) throws SQLException;
	
	// 글 읽기 (조회수 증가)
	PdsVO read(int pdsId) throws SQLException;
	
	//첨부파일 조회
	AttachVO getAttachByAttachId(int attachId) throws SQLException;
	
	// 파일 정보 삭제
	void removeAttachByAttachId(int attachId) throws SQLException;
	
	
	
}
