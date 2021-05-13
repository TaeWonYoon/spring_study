package com.study.tw;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.study.tw.lib.Upload;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String uploads(Model model,HttpServletRequest request){
		return "upload";
	}
	
	@RequestMapping(value = "/upload.do",method = RequestMethod.POST)
	public void upload(MultipartFile files,Model model,HttpServletRequest request){
	    
	    System.out.println("확인 = " + files.isEmpty());
	    Upload ul = new Upload();
	    
		System.out.println("Test = " + ul.saveFile(files, request, "경로"));
	}

	@RequestMapping(value = "/after")
	public String after() {
		return "after";
	}
}