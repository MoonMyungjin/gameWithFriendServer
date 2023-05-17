package common.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CodeDAO;
import common.vo.CodeVO;
import gameMatching.dao.GameMatchingDAO;
import gameMatching.vo.GameVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Resource(name="codeDAO")
	protected CodeDAO codeDAO;
	
	@Override
	public List<CodeVO> selectCdDtlNm(CodeVO codeVO) throws SQLException {
		return codeDAO.selectCdDtlNm(codeVO);
	}

}
