package com.lms.hexa.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.dto.PaymentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.PaymentService;

@Controller
@RequestMapping("/member/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping("/list")
	public ModelAndView paymentList(ModelAndView mnv, Authentication auth, String studentId, String active)throws Exception{
		
		 String url = "member/payment/list";
		 String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		 
		 List<PaymentVO> pStudentList = paymentService.getPStudentList(login_id);
		
//		 if(studentId == null) {
//			 studentId = pStudentList.get(0).getStudentId();
//		 }
		 
		 PaymentVO payment = new PaymentVO();
		 payment.setParentId(login_id);
		 payment.setStudentId(studentId);
		 
		 System.err.println("************************"+login_id + studentId);
		 
		 List<PaymentVO> paymentList =  paymentService.getPayment(payment);
		 List<PaymentVO> paymentList2 =  paymentService.getPaymentList(payment);
		 
		 mnv.addObject("pStudentList", pStudentList);
		 mnv.addObject("paymentList", paymentList);
		 mnv.addObject("paymentList2", paymentList2);
		 mnv.addObject("selectedStudentId", studentId);
		 mnv.addObject("active", active);
		 System.out.println(active);
		 mnv.setViewName(url);
		 return mnv;
		}
	
	@ResponseBody
	@RequestMapping(value = "/regist", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<Map<String,Object>> regist(@RequestBody PaymentVO payment,RedirectAttributes rttr)throws Exception{
	ResponseEntity<Map<String,Object>> entity=null;
	Map<String,Object> dataMap = new HashMap<String, Object>();
	
	int result = paymentService.regist(payment); 
	
	dataMap.put("result", result);
	
	entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
	
	return entity;
	
	
	}
	
}
