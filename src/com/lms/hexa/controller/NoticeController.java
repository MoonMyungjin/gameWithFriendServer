package com.lms.hexa.controller;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.NoticeModifyCommand;
import com.lms.hexa.command.NoticeRegistCommand;
import com.lms.hexa.dto.NoticeVO;
import com.lms.hexa.dto.SchoolVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.NoticeService;
import com.lms.hexa.service.SchoolService;


@Controller
@RequestMapping("/manager/board/notice")
public class NoticeController {
	
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private SchoolService schoolService;
	
	  @RequestMapping() 
	  public ModelAndView noticeList(CriteriaCommand cricmd,HttpServletRequest request,	ModelAndView mnv,String schoolUrl,String schoolName) throws SQLException { 
		  String url ="manager/board/notice"; 
		  System.out.println(schoolUrl);
		  System.out.println(schoolName);
		  List<NoticeVO> schoolNoticeList = new ArrayList<NoticeVO>();
		  SchoolVO schoolInfo = new SchoolVO();
		  HttpSession session = request.getSession();
		  String category = (String)session.getAttribute("category");
		  String userId;
		  
		  //학원 공지사항
		  Criteria cri = cricmd.toCriteria();
		  Map<String, Object> dataMap = new HashMap<String, Object>();
		  dataMap.put("dataMap",noticeService.getList(cri));
		  
		  //학교 공지사항
		  if(category.equals("s")) {
			  StudentVO student = (StudentVO)session.getAttribute("loginUser");
			  userId = student.getId();
			  schoolInfo = noticeService.getSchoolURL(userId);
			  schoolNoticeList = noticeService.getSchoolNoticeList(schoolInfo.getSchoolURL(),cri);
		  } else {
			  List<SchoolVO> schoolList = schoolService.selectSimpleSchoolList();
			  mnv.addObject("schoolList", schoolList);
			  if(schoolUrl != null) {
				  schoolNoticeList = noticeService.getSchoolNoticeList("%"+schoolUrl+"%",cri);
				  SchoolVO vo = new SchoolVO();
				  vo.setSchoolName(schoolName);
				  schoolInfo = vo;
			  } else {
				  schoolNoticeList = noticeService.getSchoolNoticeList("%"+schoolList.get(0).getSchoolURL().substring(0, 15)+"%",cri);
				  schoolInfo = schoolList.get(0);
			  }
		  }
		  
		  dataMap.put("schoolNoticeList", schoolNoticeList);
	      mnv.addObject("dataMap",dataMap);
	      mnv.addObject("schoolInfo",schoolInfo);
		  mnv.setViewName(url);	
		
		  return mnv;
	  }

		
		@RequestMapping("/registForm")
		public String noticeRegist() {
			String url = "manager/board/noticeRegist";
			return url;
		}
		
		@RequestMapping(value="/regist", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
		public String regist(NoticeRegistCommand registReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
			
			String url = "manager/board/regist_success";
			System.out.println(registReq);
			System.out.println(registReq.getMngId());
			System.out.println(registReq.getNoticeTitle());
			System.out.println(registReq.getNoticeContent());
			NoticeVO notice = registReq.toNoticeVO();

			//pds.setPdsTitle((String)request.getAttribute("XSStitle"));
			noticeService.regist(notice);
			
			rttr.addFlashAttribute("from", "regist");
			return url;
		}
		
		@RequestMapping("/detail")
		public ModelAndView modifyPOST(ModelAndView mnv,int noticeId) throws Exception {
			
			String url = "manager/board/noticeDetail";
      	  
			NoticeVO noticeVO = noticeService.detail(noticeId);
			
			mnv.addObject("notice",noticeVO);
			mnv.setViewName(url);
			
			return mnv;
		}
		
		@RequestMapping("/crawlDetail")
		public ModelAndView crawlDetail(ModelAndView mnv,int noticeId) throws Exception {
			
			String url = "manager/board/crawlDetail";
      	    NoticeVO inNotice = new NoticeVO();
      	    inNotice.setNoticeId(noticeId);
			NoticeVO noticeVO = noticeService.crawlDetail(inNotice);
			
			mnv.addObject("notice",noticeVO);
			mnv.setViewName(url);
			
			return mnv;
		}
		
		@RequestMapping("/modifyForm")
		public ModelAndView noticeModify(ModelAndView mnv, int noticeId) throws Exception {
			String url = "manager/board/noticeModify";
			
			NoticeVO notice = noticeService.getNotice(noticeId);
			
			mnv.addObject("notice",notice);
			mnv.setViewName(url);
			
			return mnv;
		}
		
		
		@RequestMapping("/modify")
		public String modifyPOST(NoticeModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
			
			String url = "redirect:/manager/board/notice.do";
		        	  
			NoticeVO notice = modifyReq.toNoticeVO();
			
			noticeService.modify(notice);
			
			rttr.addFlashAttribute("from", "modify");
			rttr.addAttribute("noticeId", notice.getNoticeId());
			
			return url;
			
		}
		
		@RequestMapping("/remove")
		public String remove(int noticeId, RedirectAttributes rttr) throws Exception {
			String url = "redirect:/manager/board/notice.do";
			
			noticeService.remove(noticeId);
			
			rttr.addFlashAttribute("from", "remove");
			rttr.addAttribute("noticeId", noticeId);
			
			return url;
		}
			
	
}
