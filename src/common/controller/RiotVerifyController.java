package common.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import common.util.FileManageUtil;

@Controller
public class RiotVerifyController {
	
	static String FILE_PATH = "";
	
	@Autowired
    ResourceLoader resourceLoader;
	
	@GetMapping("/riot.txt")
    public void downloadFile(HttpServletResponse response) throws Exception{
		
		String fileName = "riot.txt";
		FileManageUtil.downFile(response, fileName);
		
	}
}