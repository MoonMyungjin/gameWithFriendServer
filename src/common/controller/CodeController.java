package common.controller;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.http.client.HttpClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;

import common.service.CodeService;
import common.vo.CodeVO;
import gameMatching.cassandra.CassandraConnector;
import gameMatching.cassandra.CassandraMapper;
import gameMatching.service.GameMatchingService;
import gameMatching.vo.GameVO;
import gameMatching.vo.UserGameInfoVO;
import test.service.TestService;
import test.vo.UserVO;

@Controller
public class CodeController {
	
	UserGameInfoVO userGameInfo = new UserGameInfoVO();
	CodeVO code = new CodeVO();
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping("/common/selectOption")
	public ResponseEntity<Map<String,Object>> selectOption(
		HttpServletRequest req,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<CodeVO> codeVO = codeService.selectOption();
		dataMap.put("codeVO", codeVO);
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	
}