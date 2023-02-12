package com.lms.hexa.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.AttachVO;
import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.ExamVO;
import com.lms.hexa.dto.FavoritesVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.MenuVO;
import com.lms.hexa.dto.NoteVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.PdsVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.UserVO;
import com.lms.hexa.service.AuthorityService;
import com.lms.hexa.service.FavoritesService;
import com.lms.hexa.service.ManagerService;
import com.lms.hexa.service.MenuService;
import com.lms.hexa.service.NoteService;
import com.lms.hexa.service.ParentService;
import com.lms.hexa.service.PdsService;
import com.lms.hexa.service.StudentService;
import com.lms.hexa.service.UserService;


@Controller
public class CommonController {
	
	int authNo = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
	String authStr = "wqmw" + authNo;
	
	
	@Autowired
	private PdsService pdsService;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private StudentService studentService ;
	
	@Autowired
	private ParentService parentService ;
	
	@Autowired
	private FavoritesService favoritesService;
	
	@Autowired
	private AuthorityService authorityService;
	

	
	@RequestMapping("/common/totalDetail")
	public ModelAndView totalMemberDetail(ModelAndView mnv, String id) throws Exception{
		String url="";
		int countForCheckSt = studentService.getCountForCheckSt(id);
		
		if(countForCheckSt == 1) {
			url= "common/memberDetail";
			StudentVO studentDetail = studentService.getStudentDetail(id);
//			System.out.println("디테일 : " + studentDetail);
			
			mnv.addObject("studentDetail", studentDetail);
			mnv.setViewName(url);
			
		}else if(countForCheckSt ==0) {
			url = "common/managerDetail";
			System.out.println("디테일 : " + id);
			
			ManagerVO manager = managerService.getManagerDetail(id);
//			System.out.println("디테일 : " + studentDetail);
			
			mnv.addObject("manager", manager);
			mnv.setViewName(url);
		}
		
		return mnv;
	}
	

	@RequestMapping("/common/memberDetail")
	public ModelAndView memberDetail(ModelAndView mnv, String id) throws Exception{
		String url = "common/memberDetail";
		
//		System.out.println("디테일 : " + id);
		
		StudentVO studentDetail = studentService.getStudentDetail(id);
//		System.out.println("디테일 : " + studentDetail);
		
		mnv.addObject("studentDetail", studentDetail);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/common/managerDetail")
	public ModelAndView managerrDetail(ModelAndView mnv, String id) throws Exception{
		String url = "common/managerDetail";
		
//		System.out.println("디테일 : " + id);
		
		ManagerVO manager = managerService.getManagerDetail(id);
//		System.out.println("디테일 : " + studentDetail);
		
		mnv.addObject("manager", manager);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/common/favorites")
	public ResponseEntity<String> favorite(String menuName, String userId, HttpServletRequest req) throws Exception {
		
		ResponseEntity<String> entity=null;
		
		System.out.println(menuName);
		
		HttpSession session = req.getSession();
		String category = (String) session.getAttribute("category");
		String menuId = menuService.getMenuId(menuName);
		int count = favoritesService.selctFavoriteCount(userId);
		
		System.out.println(count);
		
		if(count < 3) {
			FavoritesVO favorites = new FavoritesVO();
			favorites.setUserId(userId);
			favorites.setUserCategory(category);
			favorites.setMenuId(menuId);
			
			favoritesService.regist(favorites);
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("overflow",HttpStatus.OK);
		}
		
		
		
		return entity;
	}
	
	@RequestMapping("/common/favoritesRemove")
	@ResponseBody
	public  ResponseEntity<String> favoritesRemove(String userId, String menuName) throws Exception {
		
//		Map<String, Object> result = new HashMap<String, Object>();
		ResponseEntity<String> entity=null;
		
		System.out.println(userId);
		System.out.println(menuName);
		
		String menuId = menuService.getMenuId(menuName);
		
		FavoritesVO favorites = new FavoritesVO();
		favorites.setUserId(userId);
		favorites.setMenuId(menuId);
		
		
		favoritesService.remove(favorites);
		entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		
		
//		result.put("SUCCESS", "success");
//		result.put("CODE", "101");
		
		
		return entity;
	}
	
	
	
	
	
	
	@RequestMapping("/member/index")
	public ModelAndView memberIndex(@RequestParam(defaultValue = "ME000001")String mCode,ModelAndView mnv,Authentication auth,HttpSession session) throws Exception {
		String url = "common/memberIndexPage";
		
		String login_id = (String) auth.getPrincipal();
		
		List<MenuVO> menuList = menuService.getStudentMenuList();			
		mnv.addObject("menuList", menuList);
		
		List<MenuVO> submenuList = menuService.getStudentSubMenuList(login_id);		
		mnv.addObject("submenuList", submenuList);
		
		MenuVO menuVO = menuService.getMenuListByMcode(mCode);
		mnv.addObject("menu", menuVO);
		
		List<MenuVO> favoriteMenuList = menuService.getStudentFavoriteMenuList(login_id);
		List<String> favoriteMenuNameList = new ArrayList<String>();
		List<String> favoriteMenuIdList = new ArrayList<String>();
		if(favoriteMenuList == null) {
			session.setAttribute("favoriteMenuListStr", "notExist"); 
			session.setAttribute("favoriteMenuIdListStr", "notExist"); 
		} else {
			for (MenuVO menu : favoriteMenuList) {
				favoriteMenuNameList.add(menu.getMenuName());
				favoriteMenuIdList.add(menu.getMenuId());
			}
			System.out.println(favoriteMenuNameList);
			session.setAttribute("favoriteMenuListStr", favoriteMenuNameList.toString());
			session.setAttribute("favoriteMenuIdListStr", favoriteMenuIdList.toString());
		}
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/parent/index")
	public ModelAndView parentIndex(@RequestParam(defaultValue = "ME000002")String mCode,ModelAndView mnv,Authentication auth,HttpSession session) throws Exception {
		String url = "common/parentIndexPage";
		
		String login_id = (String) auth.getPrincipal();
		
		List<MenuVO> menuList = menuService.getParentMenuList();			
		mnv.addObject("menuList", menuList);
		
		List<MenuVO> submenuList = menuService.getParentSubMenuList(login_id);		
		mnv.addObject("submenuList", submenuList);
		
		MenuVO menuVO = menuService.getMenuListByMcode(mCode);
		mnv.addObject("menu", menuVO);
		
		List<MenuVO> favoriteMenuList = menuService.getParentFavoriteMenuList(login_id);		
		List<String> favoriteMenuNameList = new ArrayList<String>();
		List<String> favoriteMenuIdList = new ArrayList<String>();
		if(favoriteMenuList == null) {
			session.setAttribute("favoriteMenuListStr", "notExist"); 
			session.setAttribute("favoriteMenuIdListStr", "notExist"); 
		} else {
			for (MenuVO menu : favoriteMenuList) {
				favoriteMenuNameList.add(menu.getMenuName());
				favoriteMenuIdList.add(menu.getMenuId());
			}
			System.out.println(favoriteMenuNameList);
			session.setAttribute("favoriteMenuListStr", favoriteMenuNameList.toString());
			session.setAttribute("favoriteMenuIdListStr", favoriteMenuIdList.toString());
		}
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/manager/index")
	public ModelAndView managerIndex(@RequestParam(defaultValue = "MA000001")String mCode,ModelAndView mnv,Authentication auth,HttpSession session) throws Exception {
		String url = "common/managerIndexPage";
		
		String login_id = (String) auth.getPrincipal();
		
		int authorityCount= authorityService.getAuthorityCountById(login_id);
		
		List<MenuVO> menuList = menuService.getManagerMenuListByUserId(login_id);
		mnv.addObject("menuList", menuList);
		
		List<MenuVO> submenuList = menuService.getManagerSubMenuList(login_id);		
		if(authorityCount <= 8) {
			for (int i = 0; i < submenuList.size(); i++) {
				if (submenuList.get(i).getMenuName().equals("강의관리") || submenuList.get(i).getMenuName().equals("수업개설")) {
					submenuList.remove(i);
					i--;
				}
			}
		}
		mnv.addObject("submenuList", submenuList);
		
		MenuVO menuVO = menuService.getMenuListByMcode(mCode);
		mnv.addObject("menu", menuVO);
		
		List<MenuVO> favoriteMenuList = menuService.getManagerFavoriteMenuList(login_id);
		List<String> favoriteMenuNameList = new ArrayList<String>();
		List<String> favoriteMenuIdList = new ArrayList<String>();
		if(favoriteMenuList == null) {
			session.setAttribute("favoriteMenuListStr", "notExist"); 
			session.setAttribute("favoriteMenuIdListStr", "notExist"); 
		} else {
			for (MenuVO menu : favoriteMenuList) {
				favoriteMenuNameList.add(menu.getMenuName());
				favoriteMenuIdList.add(menu.getMenuId());
			}
			session.setAttribute("favoriteMenuListStr", favoriteMenuNameList.toString());
			session.setAttribute("favoriteMenuIdListStr", favoriteMenuIdList.toString());
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/main")
	public ModelAndView memberMain(ModelAndView mnv,HttpServletRequest request,DayInfo dayInfo) throws Exception {
		String url="member_home";
		
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO) session.getAttribute("loginUser");
		String studentId = student.getId();
		Map<String, Object> dataMap = studentService.getForMainStudent(dayInfo, studentId);
		Map<String, Object> byDayMap = (Map<String, Object>) dataMap.get("byDayMap");
		ClassVO classInfo = (ClassVO) dataMap.get("classInfo");
		Map<String, Object> ttMap = (Map<String, Object>) dataMap.get("ttMap");
		List<ExamVO> examByStudentList = (List<ExamVO>) dataMap.get("examList");
		String from = (String) session.getAttribute("from");
		if(from != null) {
			System.out.println("test");
		}
		mnv.addObject("from",from);	
		mnv.addObject("examByStudentList",examByStudentList);
		mnv.addObject("ttMap",ttMap);
		mnv.addObject("classInfo",classInfo);
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("byDayMap",byDayMap);
		mnv.addObject("dayInfo", dayInfo);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/parent/main")
	public ModelAndView parentMain(ModelAndView mnv,HttpServletRequest request,DayInfo dayInfo,String studentId) throws Exception {
		String url="parent_home";
		
		HttpSession session = request.getSession();
		ParentVO parent = (ParentVO) session.getAttribute("loginUser");
		String parentId = parent.getId();
		System.out.println(parentId);
		
		Map<String, Object> dataMap = parentService.getMain(dayInfo, parentId,studentId);
		Map<String, Object> byDayMap = (Map<String, Object>) dataMap.get("byDayMap");
		ClassVO classInfo = (ClassVO) dataMap.get("classInfo");
		Map<String, Object> ttMap = (Map<String, Object>) dataMap.get("ttMap");
		List<ExamVO> examByStudentList = (List<ExamVO>) dataMap.get("examList");
		
		
		mnv.addObject("examByStudentList",examByStudentList);
		mnv.addObject("ttMap",ttMap);
		mnv.addObject("classInfo",classInfo);
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("byDayMap",byDayMap);
		mnv.addObject("dayInfo", dayInfo);
		mnv.setViewName(url);
		
		
		
		return mnv;
	}
	
	
	@RequestMapping("/common/pwdChange")
	public ResponseEntity<String> navermailtest(HttpServletRequest request, ModelMap mo, String emailAddress) throws Exception{ 
	
		ResponseEntity<String> entity=null;
		
		String recipient = emailAddress;  //메일을 발송할 이메일 주소를 기재해 줍니다. 
		int result = userService.getUserByEmail(emailAddress);
		
		System.out.println(result);
		
		if(result >= 1) {
			// 메일 관련 정보 
			String host = "smtp.naver.com"; 
			final String username = "";  //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
			final String password = ""; //네이버 이메일 비밀번호를 기재합니다. 
			int port=465;
//		String recipient = "";  //메일을 발송할 이메일 주소를 기재해 줍니다. 
			
			try {
				// 메일 내용 
				String subject = "HEXA 비밀번호 빠른 변경 인증번호 입니다."; // 제목
				String body = "인증번호는 " + authStr + " 입니다."; 	// 내용
				Properties props = System.getProperties(); 
				props.put("mail.smtp.host", host); 
				props.put("mail.smtp.port", port); 
				props.put("mail.smtp.auth", "true"); 
				props.put("mail.smtp.ssl.enable", "true"); 
				props.put("mail.smtp.ssl.trust", host); 
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
					String un=username; String pw=password; protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(un, pw); 
					} 
				}); 
				session.setDebug(true); 
				//for debug 
				Message mimeMessage = new MimeMessage(session); 
				mimeMessage.setFrom(new InternetAddress("gusdkwjd98@naver.com")); 
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
				mimeMessage.setSubject(subject); 
				mimeMessage.setText(body); 
				Transport.send(mimeMessage); 
				
				entity  = new ResponseEntity<String>("success",HttpStatus.OK);
			} catch (Exception e) {
				entity  = new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
				
			}
			
		} else {
				entity  = new ResponseEntity<String>("notFound",HttpStatus.OK);
				
		}
		
		
		return entity;
		
		}
	

	@RequestMapping("/common/authNumCheck")
	public ResponseEntity<String> authNumCheck(HttpServletRequest request, ModelMap mo, String authNum) throws Exception{
		
		ResponseEntity<String> entity=null;
		
		System.out.println("랜덤 : " + authStr);
		System.out.println("내가 넣은 수 : " + authNum);
		
		if(authStr.equals(authNum)) {
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			entity  = new ResponseEntity<String>("notFound",HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping("/common/initialization")
	public ResponseEntity<String> pwdInitialization(HttpServletRequest request, String emailAddress) throws Exception{
		ResponseEntity<String> entity=null;
		
		String type = userService.getUserCategory(emailAddress);
		
		if(type.equals("m")) {
			managerService.updatePwd(emailAddress);
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		}else if(type.equals("s")) {
			studentService.updatePwd(emailAddress);
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			parentService.updatePwd(emailAddress);
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		}
		
		userService.updatePwd(emailAddress);
		return entity;
		
	}
	
	

	@RequestMapping("/manager/main")
	public ModelAndView managerMain(ModelAndView mnv,HttpServletRequest request) throws Exception {
		String url="manager_home";
		HttpSession session = request.getSession();
		ManagerVO manager = (ManagerVO) session.getAttribute("loginUser");
		String mngId = manager.getId();
		System.out.println(mngId);
		Map<String, Object> dataMap = managerService.getMain(mngId);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model)throws Exception {
		
		String url="security/sessionOut";
		
		model.addAttribute("message","세션이 만료되었습니다.\\n다시 로그인 하세요!");
		return url;
	}
	
	@RequestMapping(value = "/common/loginForm", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error,
			HttpServletResponse response) {
		String url ="common/loginForm";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		
		return url;
	}
	
	@RequestMapping(value = "/common/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/common/loginForm.do";
		session.invalidate();
		return url;
	}
	
	
	@RequestMapping("/common/noteForm")
	public ModelAndView noteForm(ModelAndView mnv, String loginUserId, Authentication auth) throws Exception {
		String url = "common/noteForm";
				
		System.out.println(loginUserId);
		
		
		UserVO userCa = userService.getUser(loginUserId);
		Map<String, Object> dataMapRe = noteService.getReceiveList(loginUserId);
		Map<String, Object> dataMapSe = noteService.getSendList(loginUserId);
		
		mnv.addObject("dataMapRe", dataMapRe);
		mnv.addObject("dataMapSe", dataMapSe);
		mnv.addObject("userCa", userCa);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/common/noteSearch")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> noteSearch(String name, String loginUserId, ModelAndView mnv, HttpServletRequest req) throws SQLException{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
	
		
		ManagerVO manager = new ManagerVO();
		manager.setMngName(name);
		manager.setId(loginUserId);
		
		List<NoteVO> noteListSe = noteService.getNoteListSe(manager);
		dataMap.put("noteListSe", noteListSe);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
		
	}
	
	@RequestMapping("/common/noteSearchRe")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> noteSearchRe(String name, String loginUserId, ModelAndView mnv) throws SQLException{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		ManagerVO manager = new ManagerVO();
		manager.setMngName(name);
		manager.setId(loginUserId);
		
		List<NoteVO> noteListRe = noteService.getNoteListRe(manager);
		dataMap.put("noteListRe", noteListRe);
		
		entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
		
	}
	
	@RequestMapping("/common/noteDetail")
	public ModelAndView noteDetail(String noteId, ModelAndView mnv) throws Exception {
		noteService.update(noteId);
		
		String url = "common/noteDetail";
		
		NoteVO note = null;
		note = noteService.getNote(noteId);
		
		
		mnv.addObject("note", note);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/common/noteDetailSend")
	public ModelAndView noteDetailSend(String noteId, ModelAndView mnv) throws Exception {
		String url = "common/noteDetailSend";
		
		NoteVO note = null;
		note = noteService.getNote(noteId);
//		noteService.update(noteId);
		
		mnv.addObject("note", note);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/common/noteRegistForm")
	public ModelAndView noteRegistForm(String userCategory, ModelAndView mnv) {
		String url= "common/noteRegist";
		
		mnv.addObject("userCategory", userCategory);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/noteRegist", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> noteRegist(@RequestBody HashMap<String, Object> params, RedirectAttributes rttr) throws Exception {
		ResponseEntity<String> entity=null;
		
//		System.out.println("params : " + params);
		
		int result = noteService.insertNote(params);
		
		if(result>0) {
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		} else {
			entity  = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping("/common/noteReplyForm")
	public ModelAndView noteReplyForm(String noteSendUserId, ModelAndView mnv, String from) {
		String url = "common/noteReply";
		
		mnv.addObject("noteSendUserId", noteSendUserId);
		if(!(from == null || from.equals(""))) {
			mnv.addObject("from", from);
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/noteReply", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> noteReply(@RequestBody HashMap<String, Object> params, RedirectAttributes rttr) throws Exception {
		ResponseEntity<String> entity=null;
		
//		System.out.println("params : " + params);
		
		int result = noteService.insertReply(params);
		
		if(result>0) {
			entity  = new ResponseEntity<String>("success",HttpStatus.OK);
		} else {
			entity  = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping("/common/note/userList")
	public ResponseEntity<Map<String,Object>> searchUserList(SearchHelper sh)throws Exception{
		
		ResponseEntity<Map<String,Object>> entity=null;
//		System.out.println(sh.getSearch1());
//		System.out.println(sh.getSearch2());
		
		Map<String, Object> userList = noteService.getUserListByType(sh);
		
		
		entity  = new ResponseEntity<Map<String,Object>>(userList,HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
	@RequestMapping("/common/noteRemove")
	public String remove(String noteId, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/common/noteForm.do";
	
		noteService.remove(noteId);
		
		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("noteId", noteId);
		
		return url;
	}
	
	
	@RequestMapping("/common/pdsForm")
	public ModelAndView pdsForm(ModelAndView mnv, CriteriaCommand cricmd, HttpServletRequest req) throws Exception{
		
		String url = "common/pdsForm";
		
		HttpSession session = req.getSession();
		String category = (String)session.getAttribute("category");

		
		System.out.println("-----------------------------------------------");
		System.out.println(category);
		System.out.println("--------------------------------------------------");
		
		Criteria cri = cricmd.toCriteria();
		
//		UserVO userCa = userService.getUser(loginUserId);
		
		Map<String, Object> dataMap = pdsService.getList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("category", category);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/common/pdsDetail")
	public ModelAndView pdsDetail(int pdsId, String from, ModelAndView mnv) throws Exception {
		String url = "common/pdsDetail";
		
		PdsVO pds = null;
		if(from !=null && from.equals("list")) {
			pds = pdsService.read(pdsId);
			url = "redirect:/common/pdsDetail.do?pdsId=" + pdsId;
		} else {
			pds = pdsService.getPds(pdsId);
		}
		
		// 파일명 재정의
		if(pds != null) {
			List<AttachVO> attachList = pds.getAttachList();
			if(attachList != null) {
				for (AttachVO attach : attachList) {
//					System.out.println(attach.getAttachName());
					String origin = attach.getAttachName();
					String fileName = attach.getAttachName().split("\\$\\$")[1];
					attach.setAttachName(fileName);
					attach.setAttachOrigin(origin);
				}
			}
		}
		
		mnv.addObject("pds", pds);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/common/getFile")
	public String getFile(int attachId, Model model) throws Exception {
		
		String url = "downloadFile";
		
		AttachVO attach = pdsService.getAttachByAttachId(attachId);
		
		model.addAttribute("attachPath", attach.getAttachPath());
		model.addAttribute("attachName", attach.getAttachName());
		
		return url;
	}
	
}
