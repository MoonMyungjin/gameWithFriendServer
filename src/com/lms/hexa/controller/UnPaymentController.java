package com.lms.hexa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lms.hexa.dto.UnPaymentVO;
import com.lms.hexa.service.UnPaymentService;

@Controller
@RequestMapping("/manager/unpaid")
public class UnPaymentController {

	@Autowired
	private UnPaymentService unPaymentService;
	
	
	
	
	@RequestMapping("/form")
	public ModelAndView unpaidForm(ModelAndView mnv,String days,String search) {
		String url = "manager/unpaid/unpaidForm";
		
		
		
		UnPaymentVO unPayment = new UnPaymentVO();
		unPayment.setPaymentDuedate(days);
		unPayment.setStudentName(search);
		
		List<UnPaymentVO> unPaymentList = unPaymentService.getUnPaymentList(unPayment);
		
		mnv.addObject("unPaymentList", unPaymentList);
	
		 mnv.setViewName(url);
		 return mnv;
	}
}
