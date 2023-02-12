package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.AttandanceNum;
import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.SubjectAttendanceVO;
import com.lms.hexa.dto.TimeTableVO;


public class ManagerAttandanceDAOImpl implements ManagerAttandanceDAO {
		
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ManagerAttandanceVO> selectAttandanceList(AttandanceNum searchatt) throws SQLException {
		
		List<ManagerAttandanceVO> AttandanceList=session.selectList("ManagerAttandance-Mapper.selectAttandance",searchatt);
		
		return AttandanceList;
	}

	@Override
	public List<ManagerAttandanceVO> selectAttandanceGetStudentIdList() throws SQLException {
		
		List<ManagerAttandanceVO> IdList=session.selectList("ManagerAttandance-Mapper.selectAttandanceGetStudentId");
		return IdList;
	}
	
	@Override
	public List<ManagerAttandanceVO> selectOutGetStudentId() throws SQLException {
		List<ManagerAttandanceVO> IdList=session.selectList("ManagerAttandance-Mapper.selectOutGetStudentId");
		return IdList;
	}
	
	@Override
	public int selectAttandanceListTotalCount(AttandanceNum att) throws SQLException {
		int count = session.selectOne("ManagerAttandance-Mapper.selectAttandanceTotalCount",att);
		
		return count;
	}
	
	@Override
	public int selectAttandanceListTotalCount2(AttandanceNum att) throws SQLException {
		int count = session.selectOne("ManagerAttandance-Mapper.selectAttandanceTotalCount2",att);
		return count;
	}
	
	@Override
	public int selectAttandanceListYNCount(AttandanceNum att) throws SQLException {
		int count = session.selectOne("ManagerAttandance-Mapper.selectAttandanceYNCount",att);
		
		return count;
	}

	@Override
	public void updateAttandance(String studentId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateAttandance",studentId);
		
	}
	
	@Override
	public void updateAttandanceCancle(String studentId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateAttandanceCancle",studentId);
		
	}
	
	@Override
	public void updateAttandanceAll(String atnId) throws SQLException {
		 session.update("ManagerAttandance-Mapper.updateAttandanceAll", atnId);
		
	}
	
	@Override
	public void updateAttandanceAllCancle(String atnId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateAttandanceAllCancle", atnId);
		
	}


	
	@Override
	public void updateOut(String studentId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateOut",studentId);
		
	}
	
	@Override
	public void updateOutCancle(String studentId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateOutCancle",studentId);
		
	}
	
	@Override
	public void updateAttandanceQr(String studentId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateAttandanceQr",studentId);
		
	}
	

	@Override
	public void updateAttandanceQrz(String studentId) throws SQLException {
		session.update("ManagerAttandance-Mapper.updateAttandanceQrz",studentId);
		
	}

	@Override
	public void insertDayAtt(List<StudentVO> studentList) throws SQLException {
		Map<String,Object> insertMap= new HashMap<String,Object>();
		insertMap.put("studentList", studentList);
		
		session.insert("ManagerAttandance-Mapper.insertDayAtt", insertMap);
		
	}

	@Override
	public int selectAttSeqNext() throws SQLException {
		int one = session.selectOne("ManagerAttandance-Mapper.selectAttSeqNext");
		return one;
	}

	@Override
	public ManagerAttandanceVO selectAtt(String id) throws SQLException {
		ManagerAttandanceVO result = session.selectOne("ManagerAttandance-Mapper.selectAtt",id);
		return result;
	}

	@Override
	public ManagerAttandanceVO selectAttDate(String id) throws SQLException {
		ManagerAttandanceVO result = session.selectOne("ManagerAttandance-Mapper.selectAttdate",id);
		return result;
	}

	@Override
	public List<ManagerAttandanceVO> selectAttandancePlusList(Map<String, Object> dataMap) throws SQLException {
		List<ManagerAttandanceVO> result = session.selectList("ManagerAttandance-Mapper.selectAttandancePlus",dataMap);
		return result;
	}
	
	@Override
	public List<ManagerAttandanceVO> selectAttandancePlusList2(Map<String, Object> dataMap) throws SQLException {
		List<ManagerAttandanceVO> result = session.selectList("ManagerAttandance-Mapper.selectAttandancePlus2",dataMap);
		return result;
	}
	@Override
	public List<ManagerAttandanceVO> selectAttandancePlusList3(Map<String, Object> dataMap) throws SQLException {
		List<ManagerAttandanceVO> result = session.selectList("ManagerAttandance-Mapper.selectAttandancePlus3",dataMap);
		return result;
	}

	@Override
	public ManagerAttandanceVO selectAttMember(ManagerAttandanceVO managerAttVO) throws SQLException {
	
			
			
			ManagerAttandanceVO managerAttVOForList = session.selectOne("ManagerAttandance-Mapper.memberAttandanceList", managerAttVO);
			
			
		
		return managerAttVOForList;
	}

	@Override
	public ManagerAttandanceVO selectAttMember2(Object object) throws SQLException {
		
		ManagerAttandanceVO managerAttVOForList = session.selectOne("ManagerAttandance-Mapper.memberAttandanceListtwo", object);
		
		
	
		return managerAttVOForList;
	}

	@Override
	public ManagerAttandanceVO selectForMain(String id) throws SQLException {
		ManagerAttandanceVO selectOne = session.selectOne("ManagerAttandance-Mapper.getMainAtt",id);
		return selectOne;
	}

	@Override
	public ManagerAttandanceVO selectForLate(String id) throws SQLException {
		ManagerAttandanceVO selectOne = session.selectOne("ManagerAttandance-Mapper.selectAttTimeForLate",id);
		return selectOne;
	}

	
	



	

	

	

	
	


}
