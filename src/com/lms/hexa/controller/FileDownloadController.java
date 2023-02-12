package com.lms.hexa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownloadController {
	
	@RequestMapping("/download")
	   public String download(Model model,String attachName, String attachPath)throws Exception {
	      String url = "downloadFile";
	      
	      model.addAttribute("attachPath", attachPath);
	      model.addAttribute("attachName", attachName);
	      
	      return url;
	   }
}
