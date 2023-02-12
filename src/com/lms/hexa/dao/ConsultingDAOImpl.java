package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.ConsultingVO;





public class ConsultingDAOImpl implements ConsultingDAO{

	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	



	@Override
	public List<ConsultingVO> selectDivision() throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.selectDivision");
		return list;
	}

	@Override
	public List<ConsultingVO> selectTeacher() throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.selectTeacher");
		return list;
	}


	@Override
	public List<ConsultingVO> selectStudent(String parentId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.selectStudent",parentId);
		return list;
	}



	@Override
	public List<ConsultingVO> selectSchedule(String mngId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.selectSchedule",mngId);
		return list;
	}
	


	@Override
	public int insertRequest(ConsultingVO consulting) throws SQLException {
		int result = session.insert("Consulting-Mapper.insertRequest",consulting);
		return result;
	}


	@Override
	public List<ConsultingVO> selectManagerSchedule(HashMap<String, Object> params) {
		List<ConsultingVO> managerScheduleList = session.selectList("Consulting-Mapper.getManagerSchedule", params);
		return managerScheduleList;
	}





	@Override
	public ConsultingVO selectScheduleDetailParentVer(String cnsltId) throws SQLException {
		
		ConsultingVO consultingVO = session.selectOne("Consulting-Mapper.selectConsultingSimpleInfo",cnsltId);
		String applyer = consultingVO.getCnsltApplyer();
		String target = consultingVO.getCnsltTarget();

		
		
		ConsultingVO result;
		if(applyer.equals(target)) {
			
			result = session.selectOne("Consulting-Mapper.selectScheduleDetailStudentVer",cnsltId);
		
		} else {
			result = session.selectOne("Consulting-Mapper.selectScheduleDetailParentVer",cnsltId);
		}
		System.out.println("--------------------------다오-----------------------");
		System.out.println(result.getCnsltSchDate());
		return result;
	}





	@Override
	public void updateConfirmY(String cnsltId) throws SQLException {
		 session.update("Consulting-Mapper.updateConfirmY",cnsltId);
		
		
	}

	@Override
	public void updateConfirmN(String cnsltId) throws SQLException {
		 session.update("Consulting-Mapper.updateConfirmN",cnsltId);
		
	}





	@Override
	public List<ConsultingVO> parentSelectCNSLTBeforList(String parentId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.parentSelectCNSLTBeforList",parentId);
		return list;
	}


	@Override
	public List<ConsultingVO> studentSelectCNSLTBeforList(String studentId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.studentSelectCNSLTBeforList",studentId);
		return list;
	}



	@Override
	public List<ConsultingVO> selectCNSLTBeforDetail(String cnsltId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.selectCNSLTBeforDetail",cnsltId);
		return list;
	}





	@Override
	public int studentUpdateConfirmN(String cnsltId) throws SQLException {
		int result = session.insert("Consulting-Mapper.studentUpdateConfirmN",cnsltId);
		return result;
	}





	@Override
	public List<ConsultingVO> managerSelectFinishList(ConsultingVO consulting) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.managerSelectFinishList",consulting);
		return list;

	}





	@Override
	public ConsultingVO managerSelectFinishDetail(String cnsltId) throws SQLException {
		ConsultingVO consultingVO = session.selectOne("Consulting-Mapper.selectConsultingSimpleInfo",cnsltId);
		String applyer = consultingVO.getCnsltApplyer();
		String target = consultingVO.getCnsltTarget();

		
		
		ConsultingVO result;
		if(applyer.equals(target)) {
			
			result = session.selectOne("Consulting-Mapper.managerSelectFinishDetailStudentVer",cnsltId);
		
		} else {
			result = session.selectOne("Consulting-Mapper.managerSelectFinishDetailParentVer",cnsltId);
		}
		System.out.println("--------------------------다오-----------------------");
		System.out.println(result.getCnsltSchDate());
		return result;
	}





	@Override
	public void updateRegist(ConsultingVO consulting) throws SQLException {
		 session.update("Consulting-Mapper.updateRegist",consulting);		
	}





	@Override
	public List<ConsultingVO> memberSelectFinishDetailParentVer(String parentId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.memberSelectFinishDetailParentVer",parentId);
		return list;
	}





	@Override
	public List<ConsultingVO> memberSelectFinishDetailStudentVer(String studentId) throws SQLException {
		List<ConsultingVO> list = session.selectList("Consulting-Mapper.memberSelectFinishDetailStudentVer",studentId);
		return list;
	}











	
	







	
}
