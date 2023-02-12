package com.lms.hexa.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;
import com.lms.hexa.command.PdsModifyCommand;
import com.lms.hexa.command.PdsRegistCommand;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.PdsVO;
import com.lms.hexa.service.AttachService;
import com.lms.hexa.service.PdsService;
import com.lms.hexa.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/manager/pds")
public class PdsController {
	
	@Autowired
	private PdsService pdsService;
	
	@Autowired
	private AttachService attachService;
	
	@RequestMapping("/registForm")
	public String pdsRegist() {
		String url = "manager/pds/pdsRegist";
		return url;
	}
	
	@Resource(name = "fileUploadPath")
	public String fileUploadPath;
	
	@RequestMapping(value="/regist", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String regist(PdsRegistCommand registReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String url = "manager/pds/regist_success";
		
		// file 저장
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(registReq.getUploadFile(), savePath);
		
		System.out.println("attachList : " + attachList);
		
		// DB
		PdsVO pds = registReq.toPdsVO();
		pds.setAttachList(attachList);
		pds.setPdsTitle(HTMLInputFilter.htmlSpecialChars(pds.getPdsTitle()));
		pdsService.regist(pds);
		
//		rttr.addFlashAttribute("from", "regist");
		return url;
	}
	
	
	
	@RequestMapping("/modifyForm")
	public ModelAndView pdsModify(ModelAndView mnv, int pdsId) throws Exception {
		String url = "manager/pds/pdsModify";
		
		PdsVO pds = pdsService.getPds(pdsId);
		
		// 파일명 재정의
		if(pds != null) {
			List<AttachVO> attachList = pds.getAttachList();
			if(attachList != null) {
				for (AttachVO attach : attachList) {
					String fileName = attach.getAttachName().split("\\$\\$")[1];
					attach.setAttachName(fileName);
				}
			}
		}
		
		mnv.addObject("pds",pds);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public String modifyPOST(PdsModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String url = "redirect:/common/pdsDetail.do";
		System.out.println(modifyReq.getUploadFile());
		
		int attachGroupId = 0;
		int attachId = 0;
		
		HttpSession session = request.getSession();
		ManagerVO managerVO = (ManagerVO)session.getAttribute("loginUser");	
		String userId = managerVO.getId();
		
		// 파일 삭제
		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(String attachIdStr : modifyReq.getDeleteFile()) {
				System.out.println(attachIdStr);
				attachGroupId = Integer.parseInt(attachIdStr.split("&")[1]);
				attachId = Integer.parseInt(attachIdStr.split("&")[0]);

				AttachVO paramsAttachVO = new AttachVO();
				paramsAttachVO.setAttachGroupId(attachGroupId);
				paramsAttachVO.setAttachId(attachId);
				
				AttachVO attach = attachService.getAttachByAttachInfo(paramsAttachVO);
				
				File deleteFile = new File(attach.getAttachPath(), attach.getAttachName());
				
				if(deleteFile.exists()) {
					deleteFile.delete();	// file 삭제
				}
				
				attachService.removeAttachByAttachAttachInfo(paramsAttachVO); // DB 삭제
			}
		}
		// 파일 저장
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(modifyReq.getUploadFile(), fileUploadPath);
		
		// pdsVO setting
		PdsVO pds = modifyReq.toPdsVO();
		pds.setAttachList(attachList);
		pds.setPdsTitle(HTMLInputFilter.htmlSpecialChars(pds.getPdsTitle()));
		pds.setMngId(userId);
		
		// DB 저장
		pdsService.modify(pds);
		
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("pdsId", pds.getPdsId());
		
		return url;
		
	}
	
	@RequestMapping("/remove")
	public String remove(int pdsId, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/common/pdsForm.do";
		
		// 첨부파일 삭제
		List<AttachVO> attachList = pdsService.getPds(pdsId).getAttachList();
		if(attachList != null) {
			for (AttachVO attach : attachList) {
				File target = new File(attach.getAttachPath(), attach.getAttachName());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		
		pdsService.remove(pdsId);
		
		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("pdsId", pdsId);
		
		return url;
	}
	
	
		
	
	
}
