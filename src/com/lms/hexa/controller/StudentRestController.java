package com.lms.hexa.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.service.StudentService;
import com.lms.hexa.util.MakeFileName;


@RestController
@RequestMapping("/manager/membermanagement")
public class StudentRestController {
	
	@Autowired
	private StudentService studentService;
	
	// 사진 경로 가져오기 (application-context.xml에 등록되어있다.)
	@Resource(name = "studentPicturePath")
	private String studentPicturePath;
	
		// 파일 저장 메소드
		private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
			
			String fileName = null;
			
			// 파일 유무 확인
			if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 *5)) {
				
				// 파일 저장 폴더 설정
				String uploadPath = studentPicturePath;
				fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File storeFile = new File(uploadPath, fileName);
				
				storeFile.mkdirs();
				
				// local HDD에 저장.
				multi.transferTo(storeFile);
				
				if (oldPicture != null && !oldPicture.isEmpty()) {
					File oldFile = new File(uploadPath, oldPicture);
					if (oldFile.exists()) {
						oldFile.delete();
					}
				}
			}
			return fileName;
		}
		
		// 사진 업로드
		@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
		public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception {
			
			ResponseEntity<String> entity = null;
			
			String result = "";
			HttpStatus status = null;
			
			// 파일 저장 확인
			if ((result = savePicture(oldPicture, multi)) == null) {
				result = "업로드 실패했습니다!";
				status = HttpStatus.BAD_REQUEST;
			} else {
				status = HttpStatus.OK;
			}
			
			entity = new ResponseEntity<String>(result, status);
			
			return entity;
		}
		
		// 사진 가져오기
		@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
		public ResponseEntity<byte[]> getPicture(String id) throws Exception {
			
			String picture = studentService.getStudent(id).getStudentPicture();
			
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;
			String imgPath = this.studentPicturePath;
			
			try {
				in = new FileInputStream(new File(imgPath, picture));
				
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			} finally {
				in.close();
			}
			return entity;
		}
		
		// id 중복체크
		@RequestMapping("/studentIdCheck")
		public ResponseEntity<String> idCheck(String id) throws Exception {
			
			ResponseEntity<String> entity = null;
				
				StudentVO member = studentService.getStudent(id);
				
				if (member != null) {
					entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
				} else {
					entity = new ResponseEntity<String>("", HttpStatus.OK);
				}
			
			return entity;
		}
		
	
}
