package common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import common.vo.FileVO;


public class FileManageUtil {
	
	
	static String os = System.getProperty("os.name").toLowerCase();
	static String FILE_PATH = "";
	
	public static List<FileVO> saveFiles(MultipartFile[] flles, String savePath)	throws Exception{
		
		List<FileVO> fileList = new ArrayList<FileVO>();
		String saveFileName = UUID.randomUUID().toString().replace("-", "");
		
		if (os.contains("win")) {
			FILE_PATH = "C:"+File.separator+"java"+File.separator+"file";
        } else if (os.contains("linux")) {
        	FILE_PATH = "/home/ubuntu/file";
        }
		
		for (MultipartFile multipartFile : flles) {
			File saveFile = new File(FILE_PATH+File.separator+savePath, saveFileName);
			
			// 실제 파일 저장
			saveFile.mkdirs();
			multipartFile.transferTo(saveFile);
			
			// 저장정보 DB 매핑
			FileVO file = new FileVO();
			file.setFlPath(savePath);
			file.setFlOriginName(multipartFile.getOriginalFilename());
			file.setFlUniqueName(saveFileName);
			
			fileList.add(file);
		}
		
		return fileList;		
	}
	
}
