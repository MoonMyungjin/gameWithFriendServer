package common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

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
	
	public static void downFile(HttpServletResponse response,String fileName) throws Exception{
		
		if (os.contains("win")) {
			FILE_PATH = "C:"+File.separator+"java"+File.separator+"file";
        } else if (os.contains("linux")) {
        	FILE_PATH = "/home/ubuntu/file";
        }
		String downloadPath = FILE_PATH+File.separator+fileName;
		File file = new File(downloadPath);
		FileInputStream in = new FileInputStream(downloadPath);
        
		fileName = new String(fileName.getBytes("UTF-8"), "8859_1");

		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		OutputStream os = response.getOutputStream();
		
		int length;
		byte[] b = new byte[(int) file.length()];
		while ((length = in.read(b)) > 0) {
			os.write(b, 0, length); // outputSteam의 write 메소드. 
		}

		os.flush();

		os.close();
		in.close();
		
	}
	
	
}
