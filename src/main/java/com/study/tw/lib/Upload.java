package com.study.tw.lib;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Upload {

	public String saveFile(MultipartFile file, HttpServletRequest request, String url){
		//톰캣 tmp 패스잡기
		//String path = request.getSession().getServletContext().getRealPath(url);
		String path = "D:/springUpload/"+url;
		// 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();
	    System.out.println("saveName은 = " +saveName);
	    // 저장할 File 객체를 생성(껍데기 파일)
	    File saveFile = new File(path,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} 
}
