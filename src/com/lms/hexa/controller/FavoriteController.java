package com.lms.hexa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/favorite")
public class FavoriteController {
	
	
	@RequestMapping("/list")
	public void list() {}
}
