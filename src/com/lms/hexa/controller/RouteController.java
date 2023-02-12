package com.lms.hexa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/car")
public class RouteController {

	@RequestMapping("/routeList")
	public String routeList() {
		String url = "manager/car/routeList";
		return url;
	}
	
	@RequestMapping("/test")
	public String test() {
		String url = "manager/car/test";
		return url;
	}
}
