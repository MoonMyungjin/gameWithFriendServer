package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ParentVO;

public class ParentDAOImpl implements ParentDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void updatePwd(String emailAddress) throws SQLException {
		session.update("Parent-Mapper.updatePwd", emailAddress);
		
	}
	
	@Override
	public ParentVO selectParentById(String id) throws SQLException {
		System.out.println(id);
		ParentVO parent = session.selectOne("Parent-Mapper.selectParentById", id);
		System.out.println(parent);
		return parent;
	}

	@Override
	public void modifyPwd(ParentVO parent) throws SQLException {
		session.update("Parent-Mapper.modifyPwd", parent);
	}

	@Override
	public void insertParent(ParentVO parent) throws SQLException {
		session.update("Parent-Mapper.insertParent", parent);
	}

	@Override
	public ParentVO selectParentByStudentId(String id) throws SQLException {
		ParentVO parent = session.selectOne("Parent-Mapper.selectParentByStudentId", id);
		return parent;
	}

	@Override
	public List<ParentVO> selectParentList(Criteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<ParentVO> parentList = session.selectList("Parent-Mapper.selectParentList", cri, rowBounds);
		return parentList;
	}

	@Override
	public int selectParentListTotalCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Parent-Mapper.selectParentListCount", cri);
		return count;
	}

}
