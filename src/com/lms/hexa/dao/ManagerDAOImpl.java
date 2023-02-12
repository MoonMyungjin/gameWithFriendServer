package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.StudentVO;

public class ManagerDAOImpl implements ManagerDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public ManagerVO selectManagerById(String id) throws SQLException {
		ManagerVO manager = session.selectOne("Manager-Mapper.selectManagerById", id);
		return manager;
	}
	@Override
	public ManagerVO selectManagerById2(String id) throws SQLException {
		ManagerVO manager = session.selectOne("Manager-Mapper.selectManagerByIdForMain", id);
		return manager;
	}

	@Override
	public List<ManagerVO> selectWorkingTeacherListSearchByName(ManagerVO managerVO) throws Exception {
		List<ManagerVO> teacherList = session.selectList("Manager-Mapper.selectWorkingTeacherListSearchByName", managerVO);
		return teacherList;
	}
	
	@Override
	public List<ManagerVO> selectWorkingTeacherList() throws Exception {
		List<ManagerVO> teacherList = session.selectList("Manager-Mapper.selectWorkingTeacherList");
		return teacherList;
	}

	@Override
	public ManagerVO selectManagerDetailById(String id) throws Exception {
		ManagerVO manager = session.selectOne("Manager-Mapper.selectManagerDetailById", id);
		return manager;
	}

	@Override
	public void updatePwd(String emailAddress) throws SQLException {
		session.update("Manager-Mapper.updatePwd", emailAddress);
		
	}

	@Override
	public List<ManagerVO> selectManagerList(Criteria cri) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<ManagerVO> managerList = session.selectList("Manager-Mapper.selectManagerList",cri,rowBounds);
		return managerList;
	}

	@Override
	public int selectManagerListTotalCount(Criteria cri) throws Exception {
		int count = session.selectOne("Manager-Mapper.selectManagerListCount",cri);
		return count;
	}

	@Override
	public void insertManager(ManagerVO manager) throws SQLException {
		session.update("Manager-Mapper.insertManager", manager);
	}

	@Override
	public void modifyPwd(ManagerVO manager) throws SQLException {
		session.update("Manager-Mapper.modifyPwd",manager);
	}

	@Override
	public List<ManagerVO> selectMngGenderList() throws SQLException {
		List<ManagerVO> mngGenderList = session.selectList("Manager-Mapper.selectMngGenderList");
		return mngGenderList;
	}

	@Override
	public List<ManagerVO> selectMngDeleteList() throws SQLException {
		List<ManagerVO> mngDeleteList = session.selectList("Manager-Mapper.selectMngDeleteList");
		return mngDeleteList;
	}

	@Override
	public List<ManagerVO> selectDeptIdList() throws SQLException {
		List<ManagerVO> deptIdList = session.selectList("Manager-Mapper.selectDeptIdList");
		return deptIdList;
	}

	@Override
	public List<ManagerVO> selectMngSubjectList() throws SQLException {
		List<ManagerVO> mngSubjectList = session.selectList("Manager-Mapper.selectMngSubjectList");
		return mngSubjectList;
	}

	@Override
	public List<ManagerVO> selectManagerListForGoWork() throws Exception {
		List<ManagerVO> managerList = session.selectList("Manager-Mapper.selectManagerListForGoWork");
		return managerList;
	}

	@Override
	public ManagerVO selectMangerForDetail(String id) throws SQLException {
		ManagerVO selectOne = session.selectOne("Manager-Mapper.managerForDetail", id);
		return selectOne;
	}

	
}
