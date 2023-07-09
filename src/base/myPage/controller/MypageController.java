package base.myPage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import base.myPage.service.MypageService;
import common.util.FileManageUtil;
import common.vo.FileVO;
import gameMatching.vo.UserGameInfoVO;


@Controller
public class MypageController {
	
	@Resource(name="MypageService")
	private MypageService mypageService;

	private final String FILE_PATH = "myPage";
	
	@RequestMapping("/mypage/changeMyImage.do")
	public ResponseEntity<Map<String,Object>> pushRiotApi(@RequestParam(required = true) String id,
			HttpServletRequest req
		,HttpMethod httpMethod) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		userGameInfo.setUserId(id);
		UserGameInfoVO selectUserGameInfo = cassandra.selectUserGameInfo(userGameInfo);
		dataMap.put("userInfo", selectUserGameInfo);
		
		ResponseEntity<Map<String,Object>> entity  = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(value="/mypage/changeMyImage.do", method = RequestMethod.POST, consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
	@ResponseBody
	public ResponseEntity<String> changeMyImage( @RequestPart MultipartFile file, @RequestPart("data") Object obj) throws Exception {
		
		try {
			// 업로드된 파일 처리 로직을 작성합니다.
	        if (!file.isEmpty()) {
	        	MultipartFile[] files = {file};
	        	List<FileVO> saveFiles = (FileManageUtil.saveFiles(files,FILE_PATH));
	        	if(!CollectionUtils.isEmpty(saveFiles)) {
	        		String tableName = "USER";
//	        		mypageService.saveMyImage(saveFiles,myNick,tableName);
	        	}
	        	
	        	return ResponseEntity.ok("전송 완료");
	        } else {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("이미지를 선택해주세요.");
	        }
	         
        } catch (IOException e) {
            e.printStackTrace();
            // 업로드 실패 시 예외 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("전송 실패: " + e.getMessage());
        }
		
	}
}
