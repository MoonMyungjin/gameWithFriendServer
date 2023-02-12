package com.lms.hexa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.dto.RefundVO;
import com.lms.hexa.service.RefundService;

@Controller
@RequestMapping("/manager/refund")
public class RefundController {

	@Autowired
	private RefundService refundService;
	
	@RequestMapping("/form")
	public ModelAndView refundForm(ModelAndView mnv) {
		String url = "manager/refund/refundForm";
		
		
		List<RefundVO> refundList = refundService.getRefundList();
		
		mnv.addObject("refundList", refundList);
		
		
		mnv.setViewName(url);
		 return mnv;
	}
	
	@RequestMapping("/refund")
	public String refund(String refundPrice,String studentId,String lessonAssignmentId,RedirectAttributes rttr) {
		String url = "redirect:/manager/refund/form.do";
		
		RefundVO refundVO = new RefundVO();
		refundVO.setStudentId(studentId);
		refundVO.setLessonAssignmentId(lessonAssignmentId);
		
		System.out.println(refundVO);
		refundService.refund(refundVO);
		
		
		 return url;
	}
	
}
