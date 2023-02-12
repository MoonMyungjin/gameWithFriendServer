package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ParentVO;

public interface ParentDAO {
	
	// 비밀번호 초기화
	public void updatePwd(String emailAddress) throws SQLException;
	
	ParentVO selectParentById(String id) throws SQLException;
	
	// 비밀번호 수정
	public void modifyPwd(ParentVO parent) throws SQLException;
	
	public void insertParent(ParentVO parent) throws SQLException;
	
	public ParentVO selectParentByStudentId(String id) throws SQLException;
	
	public List<ParentVO> selectParentList(Criteria cri) throws SQLException;
	
	public int selectParentListTotalCount(Criteria cri) throws SQLException;
	
}
