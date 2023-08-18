package com.jungram.pk.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	public static final String FILE_UPLOAD_PATH = "C:\\Users\\kimmi\\web\\jung_project\\springProject\\upload\\jungram";
	
	public static String saveFile(int userId, MultipartFile file) {
		
		Logger logger = LoggerFactory.getLogger(FileManager.class);
		
		if(file == null) {
			logger.error("saveFile :: 파일 저장 에러");
			return null;
		}
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			logger.error("saveFile :: 디렉토리 생성 에러 - 경로 : " + directoryPath);
			return null;
		}
		
		String filePath = null;
		
		try {
			byte[] bytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			logger.error("saveFile :: 파일 저장 에러 - 경로 :" + filePath);
			
			e.printStackTrace();
			
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	
	public static boolean removeFile(String filePath) {
		
		// 파일 정보가 없는 경우
		if(filePath == null) {
			return false;
		}
		
		// 실제 파일이 저장된 파일 경로 만들기
		
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(fullFilePath);
		
		// 파일이 존재하는지
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;
			}
		}
		Path dirPath = path.getParent();
		
		if(Files.exists(dirPath)) {
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
	
}
