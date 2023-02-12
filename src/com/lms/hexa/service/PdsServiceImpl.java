package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.AttachDAO;
import com.lms.hexa.dao.PdsDAO;
import com.lms.hexa.dao.UserDAO;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.PdsVO;

public class PdsServiceImpl implements PdsService{

	
	private PdsDAO pdsDAO;
	public void setPdsDAO(PdsDAO pdsDAO) {
		this.pdsDAO = pdsDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	
	@Override
	public Map<String, Object> getList(Criteria cri) throws SQLException {

			List<PdsVO> pdsList = pdsDAO.selectPdsCriteria(cri);
			
			if(pdsList != null)
				for (PdsVO pds : pdsList) {
					addAttachList(pds);
				}
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(pdsDAO.selectPdsCriteriaTotalCount(cri));
			
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("pdsList", pdsList);
			dataMap.put("pageMaker", pageMaker);
			
			return dataMap;
		
		
	}


	@Override
	public PdsVO getPds(int pdsId) throws SQLException {
		PdsVO pds = pdsDAO.selectPdsByPno(pdsId);
		System.out.println("서비스 : " + pds);
		addAttachList(pds);
		
		return pds;
	}


	@Override
	public void regist(PdsVO pds) throws SQLException {
		int index = 1;
		int attachGroupId = attachDAO.selectAttachSeqNextValue();
		
		pds.setPdsId(attachGroupId);
		pdsDAO.insertPds(pds);
		
		if(pds.getAttachList() != null) {
			for (AttachVO attach : pds.getAttachList()) {
//				attach.setPdsId(pdsId);
				attach.setAttachId(index);
				attach.setAttachGroupId(attachGroupId);
				attach.setAttachWriter(pds.getMngId());
				attachDAO.insertAttach(attach);
				index++;
			}
	}
}

	@Override
	public void modify(PdsVO pds) throws SQLException {
		
		pdsDAO.updatePds(pds);
		
		if(pds.getAttachList() != null) {
			
			int index = 1;
			
			for (AttachVO attach : pds.getAttachList()) {
				
				attach.setAttachGroupId(pds.getPdsId());
				attach.setAttachWriter(pds.getMngId());
				attach.setAttachId(index);
				attachDAO.insertAttach(attach);
				index++;
			}
			
			
			
		}
		
	}


	@Override
	public void remove(int pdsId) throws SQLException {
		pdsDAO.deletePds(pdsId);
		
		
	}


	@Override
	public PdsVO read(int pdsId) throws SQLException {
		PdsVO pds = pdsDAO.selectPdsByPno(pdsId);
		pdsDAO.increaseViewCnt(pdsId);
		
		addAttachList(pds);
		
		return pds;
	}



	@Override
	public AttachVO getAttachByAttachId(int attachId) throws SQLException {
		AttachVO attach = attachDAO.selectAttachByAttachId(attachId);
		return attach;
	}



	@Override
	public void removeAttachByAttachId(int attachId) throws SQLException {
		attachDAO.deleteAttach(attachId);
		
	}
	
	
	private void addAttachList(PdsVO pds) throws SQLException {
		if(pds == null)
			return;
		
		int pdsId = pds.getPdsId();
		List<AttachVO> attachList = attachDAO.selectAttachesByPdsId(pdsId);
		
		pds.setAttachList(attachList);
		
	}

}
