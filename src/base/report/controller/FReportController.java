package base.report.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import base.report.service.FReportService;

@Controller
public class FReportController {
	@Resource(name="FReportService")
	private FReportService fReportService;
	
	@RequestMapping(value = "/report/submitReport.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> submitReport (@RequestBody Map<String, String> params) throws Exception {
		int result = fReportService.insertReport(params);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
		
		return entity;
	}
}
