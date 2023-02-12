package com.lms.hexa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/popup")
public class PopupController {

	@RequestMapping("/Form")
	public String popupForm() {
		String url = "manager/popup/popupForm";
		return url;
	}
}
