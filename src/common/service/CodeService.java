package common.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import common.vo.CodeVO;
import gameMatching.vo.GameVO;

@Repository("CodeService")
public interface CodeService {

	List<CodeVO> selectCdDtlNm(CodeVO codeVO) throws SQLException;
	
	List<CodeVO> selectOptionList(CodeVO codeVO) throws SQLException;
}
